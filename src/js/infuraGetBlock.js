const fetch = require('node-fetch');

fetch('https://mainnet.infura.io/v3/81761ff4740b4706ad7cf1f21c9fde57', {
    method: 'post',
    body: JSON.stringify({
        jsonrpc:2.0,
        method:'eth_chainId',
        params:[],
        id:1
    })
}).then(response => response.json()
    .then(data => console.log(data)));
