pragma solidity 0.6.12;

import "./lib/token/ERC20/IERC20.sol";
import "./lib/math/SafeMath.sol";


contract YIExchange {
    using SafeMath for uint256;
    event Enter(address indexed user, uint256 amount);
    event Leave(address indexed user, uint256 amount);

    IERC20 public sushi;

    uint256 public reductionPerBlock;
    uint256 public multiplier;
    uint256 public lastMultiplerProcessBlock;

    uint256 public accYIPerShare;
    uint256 public ackYIBalance;
    uint256 public totalShares;

    struct UserInfo {
        uint256 amount; // YI stake amount
        uint256 share;
        uint256 rewardDebt;
    }

    mapping (address => UserInfo) public userInfo;

    constructor(IERC20 _sushi, uint256 _reductionPerBlock) public {
        sushi = _sushi;
        reductionPerBlock = _reductionPerBlock; // Use 999999390274979584 for 10% per month
        multiplier = 1e18; // Should be good for 20 years
        lastMultiplerProcessBlock = block.number;
    }

    // Clean the restaurant. Called whenever someone enters or leaves.
    function cleanup() public {
        // Update multiplier
        uint256 reductionTimes = block.number.sub(lastMultiplerProcessBlock);
        uint256 fraction = 1e18;
        uint256 acc = reductionPerBlock;
        while (reductionTimes > 0) {
            if (reductionTimes & 1 != 0) {
                fraction = fraction.mul(acc).div(1e18);
            }
            acc = acc.mul(acc).div(1e18);
            reductionTimes = reductionTimes / 2;
        }
        multiplier = multiplier.mul(fraction).div(1e18);
        lastMultiplerProcessBlock = block.number;
        // Update accYIPerShare / ackYIBalance
        if (totalShares > 0) {
            uint256 additionalYI = sushi.balanceOf(address(this)).sub(ackYIBalance);
            accYIPerShare = accYIPerShare.add(additionalYI.mul(1e12).div(totalShares));
            ackYIBalance = ackYIBalance.add(additionalYI);
        }
    }

    // Get user pending reward. May be outdated until someone calls cleanup.
    function getPendingReward(address _user) public view returns (uint256) {
        UserInfo storage user = userInfo[_user];
        return user.share.mul(accYIPerShare).div(1e12).sub(user.rewardDebt);
    }

    // Enter the restaurant. Pay some YIs. Earn some shares.
    function enter(uint256 _amount) public {
        cleanup();
        safeYITransfer(msg.sender, getPendingReward(msg.sender));
        sushi.transferFrom(msg.sender, address(this), _amount);
        ackYIBalance = ackYIBalance.add(_amount);
        UserInfo storage user = userInfo[msg.sender];
        uint256 moreShare = _amount.mul(multiplier).div(1e18);
        user.amount = user.amount.add(_amount);
        totalShares = totalShares.add(moreShare);
        user.share = user.share.add(moreShare);
        user.rewardDebt = user.share.mul(accYIPerShare).div(1e12);
        emit Enter(msg.sender, _amount);
    }

    // Leave the restaurant. Claim back your YIs.
    function leave(uint256 _amount) public {
        cleanup();
        safeYITransfer(msg.sender, getPendingReward(msg.sender));
        UserInfo storage user = userInfo[msg.sender];
        uint256 lessShare = user.share.mul(_amount).div(user.amount);
        user.amount = user.amount.sub(_amount);
        totalShares = totalShares.sub(lessShare);
        user.share = user.share.sub(lessShare);
        user.rewardDebt = user.share.mul(accYIPerShare).div(1e12);
        safeYITransfer(msg.sender, _amount);
        emit Leave(msg.sender, _amount);
    }

    // Safe sushi transfer function, just in case if rounding error causes pool to not have enough YIs.
    function safeYITransfer(address _to, uint256 _amount) internal {
        uint256 sushiBal = sushi.balanceOf(address(this));
        if (_amount > sushiBal) {
            sushi.transfer(_to, sushiBal);
            ackYIBalance = ackYIBalance.sub(sushiBal);
        } else {
            sushi.transfer(_to, _amount);
            ackYIBalance = ackYIBalance.sub(_amount);
        }
    }
}
