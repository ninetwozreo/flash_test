pragma solidity >=0.4.25 <0.7.0;

import "truffle/Assert.sol";
import "truffle/DeployedAddresses.sol";
import "../contracts/TestLoop.sol";
// import "../contracts/oin/IERC20.sol";

contract TestMetaCoin {

  function qtesttest() public {
    TestLoop testloop = TestLoop(DeployedAddresses.TestLoop());
    IERC20(0xA8390686f484c49241c116B39f82108A74af86fc).approve(DeployedAddresses.TestLoop(), 1e26);
    IERC20(0x031CCaB6583B2a5ABBcC58E48e74E6acafE9c503).approve(DeployedAddresses.TestLoop(), 1e26);

    testloop.setup(0xCfbE884439BC0Ac24FDE72519Aa2ddf063A14D30);

    // testloop.setup(0xCfbE884439BC0Ac24FDE72519Aa2ddf063A14D30);
    // testloop.testLoop(2000000000000000000000, 200);
    uint expected = 0;

    Assert.equal(testloop.getBalanceOf(0x031CCaB6583B2a5ABBcC58E48e74E6acafE9c503), 0, "Owner should have 10000 MetaCoin initially");
  }


  function testloop() public {
    uint expected = 0;
    uint banlance1 = 1;
    // require(banlance1==expected,"not zero 1");

    IERC20(0xA8390686f484c49241c116B39f82108A74af86fc).approve(DeployedAddresses.TestLoop(), 1e26);
    IERC20(0x031CCaB6583B2a5ABBcC58E48e74E6acafE9c503).approve(DeployedAddresses.TestLoop(), 1e26);
    TestLoop testloop = TestLoop(DeployedAddresses.TestLoop());

    // efc.approve(DeployedAddresses.TestLoop(), 1e26);
    testloop.setup(0xCfbE884439BC0Ac24FDE72519Aa2ddf063A14D30);
    testloop.testLoop(2000000000000000000000, 200);
    

    // Assert.equal(efc.balanceOf(msg.sender),10000000,"not zero");
    /// @notice Explain to an end user what this does
    /// @dev Explain to a developer any extra details
    /// @return Documents the return variables of a contract’s function state variable
    /// @inheritdoc	Copies all missing tags from the base function (must be followed by the contract name))), expected, "Owner should have 10000 MetaCoin initially");
    // testloop.testLoop(2000000000000000000000, 200);
    
    }

}
