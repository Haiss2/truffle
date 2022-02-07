const Web3 = require('web3');
const Coin = require('./contracts/HaiLe.json')

const init = async () => {
    const web3 = new Web3("http://127.0.0.1:9545/")


    const contract = await new web3.eth.Contract(Coin.abi, '0xB4F384A0E00DAC849C5073684CC2d63eCd4BeBc9')

    const name = await contract.methods.name().call()
    const symbol = await contract.methods.symbol().call()
    const decimals = await contract.methods.decimals().call()


    const InitBalance = await contract.methods.balanceOf('0xa6f4af3f01fb1f9429d7f619635b2706037f12f1').call()
    await contract.methods.transfer('0x40b491a36c4ce207d134cf771a0e4bc4d4d80f0a', 1000).send({
        from: '0xa6f4af3f01fb1f9429d7f619635b2706037f12f1'
    })

    const FinalBalance = await contract.methods.balanceOf('0xa6f4af3f01fb1f9429d7f619635b2706037f12f1').call()

    // console.log(contract.methods)
    console.log(name, symbol, decimals, InitBalance, FinalBalance)

}


init()