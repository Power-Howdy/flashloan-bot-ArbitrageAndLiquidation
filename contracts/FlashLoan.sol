// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "./Arbitrage.sol";
import "./Liquidation.sol";

interface IFlashLoanProvider {
    function flashLoan(address borrower, address token, uint256 amount, bytes calldata data) external;
}

contract FlashLoan {
    address private owner;
    IFlashLoanProvider private flashLoanProvider;
    IERC20 private token;
    Arbitrage private arbitrage;
    Liquidation private liquidation;

    constructor(address _flashLoanProvider, address _token, address _arbitrage, address _liquidation) {
        owner = msg.sender;
        flashLoanProvider = IFlashLoanProvider(_flashLoanProvider);
        token = IERC20(_token);
        arbitrage = Arbitrage(_arbitrage);
        liquidation = Liquidation(_liquidation);
    }

    function executeFlashLoan(uint256 amount, bool isLiquidation) external {
        // Step 1: Initiate the flash loan
        flashLoanProvider.flashLoan(address(this), address(token), amount, "");

        // Step 2: Execute flash load --- choose between arbitrage and liquidation        
        if (isLiquidation) {
            address borrower = address(0); // Replace with actual borrower address
            liquidation.executeLiquidation(borrower);
        } else {
            arbitrage.executeArbitrage(amount);
        }

        // Step 3: Repay the flash loan
        // Approve the flash loan provider to withdraw the amount
        token.approve(address(flashLoanProvider), amount);
    }
}