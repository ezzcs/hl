pragma solidity 0.6.12;

import "./lib/token/ERC20/IERC20.sol";
import "./lib/token/ERC20/ERC20.sol";
import "./lib/math/SafeMath.sol";


contract HL is ERC20("HL", "XI"){
    using SafeMath for uint256;
    IERC20 public yi;

    constructor(IERC20 _yi) public {
        yi = _yi;
    }

    // Enter the exchange. Pay some YIs. Earn some shares.
    function enter(uint256 _amount) public {
        uint256 totalYI = yi.balanceOf(address(this));
        uint256 totalShares = totalSupply();
        if (totalShares == 0 || totalYI == 0) {
            _mint(msg.sender, _amount);
        } else {
            uint256 what = _amount.mul(totalShares).div(totalYI);
            _mint(msg.sender, what);
        }
        yi.transferFrom(msg.sender, address(this), _amount);
    }

    // Leave the exchange. Claim back your YIs.
    function leave(uint256 _share) public {
        uint256 totalShares = totalSupply();
        uint256 what = _share.mul(yi.balanceOf(address(this))).div(totalShares);
        _burn(msg.sender, _share);
        yi.transfer(msg.sender, what);
    }
}
