# Flash USDT Bot

## Description
This project implements a FlashLoan contract that allows users to borrow USDT for various operations like arbitrage and liquidation.

## Prerequisites
- Node.js
- Hardhat
- Ethereum wallet (e.g., MetaMask)

## Installation
1. Clone the repository.
2. Run `npm install` to install dependencies.

## Deployment
To deploy the FlashLoan contract, update the `USDT_ADDRESS` in `scripts/deploy.js` with the actual USDT contract address.

```javascript
// ... existing code ...
const USDT_ADDRESS = "0x..."; // Replace with the actual USDT contract address
// ... existing code ...
```

3. Run `npm run deploy` to deploy the contract.

## Usage
After deployment, you can interact with the FlashLoan contract to execute flash loans.

## License
This project is licensed under the MIT License.

## Explanation of Updates:
- Added a brief description of the project.
- Included prerequisites for setting up the project.
- Provided instructions for installation and deployment.
- Mentioned how to update the USDT address in the deployment script.
- Feel free to adjust any sections as needed!
