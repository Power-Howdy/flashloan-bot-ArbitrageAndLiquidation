import { buildModule } from "@nomicfoundation/hardhat-ignition/modules";

export default buildModule("Arbitrage", (m) => {
    const arbitrage = m.contract("Arbitrage", [
        "token",
        "uniswap",
        "sushiswap"
    ]);
    m.call(arbitrage, "executeArbitrage", [
        "amount"// not string, uint256
    ]);
    return {
        arbitrage
    }
});
