import pytest
from brownie import TAG,accounts

def test_token(token):
    ac0 = accounts[0]
    ac1 = accounts[1]
    ac2 = accounts[2]
    tag1 = TAG.deploy(ac0,{'from':ac1})
    assert tag1.name() == 'TAG'
    tag1.MintUniqueTokenTo(ac1,1,'Test',{'from':ac2})
    assert tag1.tokenURI(1) == 'Test'
    

