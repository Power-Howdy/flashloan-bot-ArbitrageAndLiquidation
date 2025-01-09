import { buildModule } from "@nomicfoundation/hardhat-ignition/modules";


export default buildModule("FlashLoan", (m) => {
    const flashLoan = m.contract("FlashLoan", [
        "flashLoanProvider",
        "token",
        "arbitrage",
        "liquidation"
    ]);
    m.call(flashLoan, "executeFlashLoan", [
        "amount",
        "isLiquidation"// true or false, if true, liquidation, if false, arbitrage
    ]);
    return {
        flashLoan
    }
});
