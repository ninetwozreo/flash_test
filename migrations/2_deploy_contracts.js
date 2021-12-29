let Flashloan = artifacts.require("Flashloan")
let testloop = artifacts.require("TestLoop")

module.exports = async function (deployer, network) {
    try {

        let lendingPoolAddressesProviderAddress;
        let testloopAddress=0x0168fB3140214ff72BA6C5E7F45E84e5132B446F;

        switch(network) {
            case "mainnet":
            case "mainnet-fork":
            case "development": // For Ganache mainnet forks
                lendingPoolAddressesProviderAddress = "0x24a42fD28C976A61Df5D00D0599C34c4f90748c8"; break
            case "ropsten":
            case "ropsten-fork":
                lendingPoolAddressesProviderAddress = "0x1c8756FD2B28e9426CDBDcC7E3c4d64fa9A54728"; break
            case "kovan":
            case "kovan-fork":
                lendingPoolAddressesProviderAddress = "0x506B0B2CF20FAA8f38a4E2B524EE43e1f4458Cc5"; break
                // lendingPoolAddressesProviderAddress = "0x506B0B2CF20FAA8f38a4E2B524EE43e1f4458Cc5"; break
            default:
                throw Error(`Are you deploying to the correct network? (network selected: ${network})`)
        }

        // await deployer.deploy(Flashloan, lendingPoolAddressesProviderAddress)
        await deployer.deploy(testloop)
        // await deployer.deploy(testloop,{ gas: 1500000,gasPrice: 50000000000, from: "0x3535e108a984836a7F1536210CC1FbcFC84DbFa4"})
    } catch (e) {
        console.log(`Error in migration: ${e.message}`)
    }
}