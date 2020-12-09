import pytest



@pytest.fixture
def token(a,YIToken):
    yield a[0].deploy(YIToken)


