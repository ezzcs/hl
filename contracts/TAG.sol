pragma solidity 0.6.12;

import "./lib/token/ERC721/ERC721.sol";
import "./lib/token/ERC721/IERC721.sol";
contract TAG is ERC721("TAG","EZZCtag"){
IERC721 public hl_tag;
mapping(bytes32 => address) private tagMap;

function getTag(bytes32 _key) public view returns(address){
return tagMap[_key];
}

function setTag(bytes32 _key,address _value) internal{
tagMap[_key] = _value;
}

constructor(IERC721 _hl_tag) public{
	hl_tag = _hl_tag;
}

function MintUniqueTokenTo(
	address _to,
	uint256 _tokenId,
	string memory	_tokenURI
) public{
super._mint(_to,_tokenId);
super._setTokenURI(_tokenId,_tokenURI);
}


}


