import pytest
from brownie import YIToken,accounts

def test_token(token):
    ac0 = accounts[0]
    tk1 = ac0.deploy(YIToken)
    assert tk1.name() == 'YIToken'
