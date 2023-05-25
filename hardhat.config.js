require("@nomicfoundation/hardhat-toolbox");
require("dotenv").config({ path: ".env" });
require("@nomiclabs/hardhat-etherscan");

const ALCHEMY_API_KEY_URL = process.env.ALCHEMY_API_KEY_URL;

const MUMBAI_PRIVATE_KEY = process.env.MUMBAI_PRIVATE_KEY;

const POLYGONSCAN_KEY = process.env.POLYGONSCAN_KEY;


console.log(`ALCHEMY_API_KEY_URL:'${ALCHEMY_API_KEY_URL}'`)
console.log(`MUMBAI_PRIVATE_KEY:'${MUMBAI_PRIVATE_KEY}'`)
console.log(`POLYGONSCAN_KEY:'${POLYGONSCAN_KEY}'`)
// const { FEE, VRF_COORDINATOR, LINK_TOKEN, KEY_HASH } = require("./constants");
// console.log(`FEE:'${FEE}'`)
// console.log(`VRF_COORDINATOR:'${VRF_COORDINATOR}'`)
// console.log(`LINK_TOKEN:'${LINK_TOKEN}'`)


module.exports = {
  solidity: "0.8.10",
  networks: {
    mumbai: {
      url: ALCHEMY_API_KEY_URL,
      accounts: [MUMBAI_PRIVATE_KEY],
    },
    development: {
      host: "127.0.0.1",
      port: 7545,
      network_id: "*" //Match any network id
    },
  },
  // contracts_directory: './src/contracts/',
  // contracts_build_directory: './src/abis/',
  // compilers: {
  //   solc: {
  //     optimizer: {
  //       enabled: true,
  //       runs: 200
  //     },
  //     evmVersion: "petersburg"
  //   }
  // },
  etherscan: {
    apiKey: {
      polygonMumbai: POLYGONSCAN_KEY,
    },
  },
};