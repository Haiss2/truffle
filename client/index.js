const Web3 = require('web3');
const Coin = require('./contracts/HaiLe.json')

const init = async () => {
    const web3 = new Web3("http://127.0.0.1:9545/")

    console.log(web3)
}

init()