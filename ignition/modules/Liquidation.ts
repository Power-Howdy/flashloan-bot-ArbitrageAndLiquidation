import { buildModule } from "@nomicfoundation/hardhat-ignition/modules";

export default buildModule("Liquidation", (m) => {
   const liquidation = m.contract("Liquidation", [
    "owner", 
    "lendingProtocol", 
    "collateralToken"
    ]);
   m.call(liquidation, "executeLiquidation", [
    "borrower"
   ]);
   return {
    liquidation
   }
});
