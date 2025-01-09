import { HardhatUserConfig } from "hardhat/config";
import "@nomicfoundation/hardhat-toolbox";

const config: HardhatUserConfig = {
  solidity: "0.8.28",
  networks: {
    ropsten: {
        url: "https://ropsten.infura.io/v3/YOUR_INFURA_PROJECT_ID",
        accounts: ["0xYOUR_PRIVATE_KEY"],
    },
},
};

export default config;
