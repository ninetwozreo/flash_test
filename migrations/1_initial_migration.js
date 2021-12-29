const Migrations = artifacts.require("Migrations");
const testloop = artifacts.require("TestLoop");

module.exports = deployer => {
  // deployer.deploy(Migrations);
  deployer.deploy(testloop);
  // deployer.deploy(testloop,{gas: 200000, from: "0x3535e108a984836a7F1536210CC1FbcFC84DbFa4"})

};
