pragma solidity >=0.5.17 <0.8.10;

import "./uni/UniswapFlashSwapper.sol";

import "./oin/Math.sol";
import "./oin/SafeMath.sol";
// import "./oin/Owned.sol";
// import "./IERC20.sol";
// import "./IUniswapV2Pair.sol";
// import "./UniswapFlashSwapper.sol";


interface IOinStake {
    function getDepositorICR(address depositor) external view returns (uint256 value);

    function deposit(uint256 tokenAmount) external;

    function generate(uint256 coinAmount) external;

    event DepositEvent(uint256 tokenAmount);
}

interface ICoin {
    function burn(address account, uint256 amount) external;

    function liquidateBurn(address account, uint256 amount) external;

    function mint(address account, uint256 amount) external;

    function balanceOf(address account) external view returns (uint256);

    function sendToPool(address account, address stablePoolAddress, uint256 amount) external;

    function returnFromPool(address stablePoolAddress, address account, uint256 amount) external;
}

   


contract TestLoop is UniswapFlashSwapper {

    // JUST FOR TESTING - ITS OKAY TO REMOVE ALL OF THESE VARS
    address public lastTokenBorrow;
    uint public lastAmount;
    address public lastTokenPay;
    uint public lastamountToRepay;
    bytes public lastUserData;
// ---------------
 IOinStake public oinStake;
    /// @dev Coin address
    ICoin coin;
    ///@dev Token address
    IERC20 token;
    IUniswapV2Pair uniswapPair;
    // IV2SwapRouter uniswapR;
    address sender;
    address efteth;
    address usdoeth;

    /// @notice Setup Token&Coin address success
    event SetupCoin(address token, address coin);


   

    function setup(address osaddr) public  {
        // uniswapPair = IUniswapV2Pair(_uniswap);
        // uniswapR = IV2SwapRouter(_uniswap);
        oinStake = IOinStake(osaddr);
        // require(address(token) == address(0) && address(coin) == address(0), "Token address already set up.");
        token = IERC20(0xA8390686f484c49241c116B39f82108A74af86fc);
        coin = ICoin(0x031CCaB6583B2a5ABBcC58E48e74E6acafE9c503);
        // uniswapV2Factory= IUniswapV2Factory(0x5C69bEe701ef814a2B6a3EDD4B1652CB9cc5aA6f);


        // pairs= IUniswapV2Pair(0x5C69bEe701ef814a2B6a3EDD4B1652CB9cc5aA6f);

        emit SetupCoin(address( token),address(coin));
    }


    
    
    function approveToken(address tokenaddr,address tcontract) public {
        //申请额度
            

      IERC20(address(tokenaddr)).approve(address(this), 1e26);
    //   IERC20(address(tokenaddr)).approve(address(uniswapR), 1e26);
      IERC20(address(tokenaddr)).approve(tcontract, 1e26);
      
    }

    
    constructor() public UniswapFlashSwapper() {
        // uniswapPair = IUniswapV2Pair(0x5C69bEe701ef814a2B6a3EDD4B1652CB9cc5aA6f);
        // // uniswapR = IV2SwapRouter(0x68b3465833fb72A70ecDF485E0e4C7bD8665Fc45);
        // oinStake = IOinStake(0xCfbE884439BC0Ac24FDE72519Aa2ddf063A14D30);
        // token = IERC20(0xA8390686f484c49241c116B39f82108A74af86fc);
        // coin = ICoin(0x031CCaB6583B2a5ABBcC58E48e74E6acafE9c503);
        sender = msg.sender;
         efteth=0xfF30eEF97Ad64426D7e901a9A49ac07718170ce1;
        usdoeth=0xFD780817F08Ae3824DAD20fd594b04f7386e7D4d;
    }

    // constructor(address _DAI, address _WETH) public UniswapFlashSwapper(_DAI, _WETH) {}

    // @notice Flash-borrows _amount of _tokenBorrow from a Uniswap V2 pair and repays using _tokenPay
    // @param _tokenBorrow The address of the token you want to flash-borrow, use 0x0 for ETH
    // @param _amount The amount of _tokenBorrow you will borrow
    // @param _tokenPay The address of the token you want to use to payback the flash-borrow, use 0x0 for ETH
    // @param _userData Data that will be passed to the `execute` function for the user
    // @dev Depending on your use case, you may want to add access controls to this function
    function testLoop( uint256 _amount,uint256 num) external {
        uint256 real_amount=_amount*num/100;


        // require(msg.sender==sender,"not  sender");

        token.transferFrom(msg.sender,address(this),_amount);


        // uint256 token_amount_to_borrow=real_amount-_amount;
        // uint256 coinAmount= tokenPrice*_amount*100/160/1e10/10;

        //   for (uint256 i = 0; i < num; i++) {
            //  require(amount > 0, "Amount must be non-zero");
            // oinStake.deposit(_amount);
     
            // oinStake.generate(coinAmount);

            // IERC20(address(coin)).transferFrom(msg.sender,address(this),coinAmount);
            
            // uint256 token_to_get=coinAmount*1e10*997/1000/tokenPrice;

            startSwap(address(token), real_amount,address(coin),'0x00');
        //   }
        //swap结束
        // startSwap(address(token), token_to_get,address(coin),'0x00');

            // _amount=token_to_get;

            // token.transfer(msg.sender,_amount);
            //计算出amount0 amount1
            // uniswap.swap(coinAmount,amount,msg.sender,'');
        // }


        
        // token.transfer(msg.sender,token_amount_to_borrow);

        // uint256 coin_amount_to_pay =  tokenPrice*token_amount_to_borrow*1004/1000/100000000/10000000000;
        
        // oinStake.deposit(real_amount);
        // oinStake.generate(coin_amount_to_pay);

        // IERC20(address(coin)).transferFrom(msg.sender,address(this),coin_amount_to_pay);
        
        
    }

  


    // @notice This is where your custom logic goes
    // @dev When this code executes, this contract will hold _amount of _tokenBorrow
    // @dev It is important that, by the end of the execution of this function, this contract holds
    //     at least _amountToRepay of the _tokenPay token
    // @dev Paying back the flash-loan happens automatically for you -- DO NOT pay back the loan in this function
    // @param _tokenBorrow The address of the token you flash-borrowed, address(0) indicates ETH
    // @param _amount The amount of the _tokenBorrow token you borrowed
    // @param _tokenPay The address of the token in which you'll repay the flash-borrow, address(0) indicates ETH
    // @param _amountToRepay The amount of the _tokenPay token that will be auto-removed from this contract to pay back
    //        the flash-borrow when this function finishes executing
    // @param _userData Any data you privided to the flashBorrow function when you called it
    function execute(address _tokenBorrow, uint _amount, address _tokenPay, uint _amountToRepay, bytes memory _userData) internal {
        // do whatever you want here
        // we're just going to update some local variables because we're boring
        // but you could do some arbitrage or liquidaztions or CDP collateral swaps, etc

        // require(msg.sender==sender,"not this ");

        require(msg.sender==sender,"is not  efc-eth uni sender ");
        // address mm=tx.orignal;
        // IERC20(address(coin)).approve(address(this),1e26);
        // IERC20(address(coin)).approve(address(this),1e26);
        // token.transfer(sender,_amount);

        // IERC20(address(coin)).transferFrom(msg.sender,address(this),1003*_amount/10000);


        // uint256 coin_amount_to_pay =  10000000*_amount*1004/1000/100000000/10000000000;
        
        // exedeposit(_amount*2,coin_amount_to_pay);

        // IERC20(address(coin)).transferFrom(sender,address(this),1003*_amount/10000);



        lastTokenBorrow = _tokenBorrow; // just for testing
        lastAmount = _amount; // just for testing
        lastTokenPay = _tokenPay; // just for testing
        lastamountToRepay = _amountToRepay; // just for testing
        lastUserData = _userData; // just for testing
    }

    // @notice Simple getter for convenience while testing
    function exedeposit(uint256 depositAmount,uint256 coin_amount_to_pay) internal  {
       oinStake.deposit(depositAmount);
        oinStake.generate(coin_amount_to_pay);
    }
   
    // @notice Simple getter for convenience while testing
    function getBalanceOf(address _input) external view returns (uint) {
        if (_input == address(0)) {
            return address(this).balance;
        }
        return IERC20(_input).balanceOf(address(this));
    }
}
