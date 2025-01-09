// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";

interface ILendingProtocol {
    function liquidate(address borrower, address collateralAsset, uint256 debtAmount) external;
    function getDebtAmount(address borrower) external view returns (uint256);
}

contract Liquidation {
    address private owner;
    ILendingProtocol private lendingProtocol;
    IERC20 private collateralToken;

    constructor(address _lendingProtocol, address _collateralToken) {
        owner = msg.sender;
        lendingProtocol = ILendingProtocol(_lendingProtocol);
        collateralToken = IERC20(_collateralToken);
    }

    function executeLiquidation(address borrower) external {
        // Step 1: Get the debt amount of the borrower
        uint256 debtAmount = lendingProtocol.getDebtAmount(borrower);
        require(debtAmount > 0, "No debt to liquidate");

        // Step 2: Liquidate the borrower's position
        // Assuming the collateral asset is the same as the collateralToken
        lendingProtocol.liquidate(borrower, address(collateralToken), debtAmount);

        // Step 3: Optionally, handle the received collateral (not shown here)
    }
} 