import pytest
from brownie import TAG,accounts

def test_token(token):
    ac0 = accounts[0]
    ac1 = accounts[1]
    ac2 = accounts[2]
    ac3 = accounts[3]
    ac4 = accounts[4]
    ac5 = accounts[5]
    tag1 = TAG.deploy(ac0,{'from':ac1})
    assert tag1.name() == 'TAG'
    tag1.MintUniqueTokenTo(ac1,1,'Test1',{'from':ac2})
    assert tag1.tokenURI(1) == 'Test1'
    tag1.MintUniqueTokenTo(ac1,2,'Test2',{'from':ac2})
    assert tag1.tokenURI(2) == 'Test2'
    assert tag1.ownerOf(1) == ac1
    tag1.safeTransferFrom(ac1,ac2,1)
    assert tag1.ownerOf(1) == ac2
 

