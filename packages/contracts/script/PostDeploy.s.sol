// SPDX-License-Identifier: MIT
pragma solidity >=0.8.21;

import { Script } from "forge-std/Script.sol";
import { console } from "forge-std/console.sol";
import { IWorld } from "../src/codegen/world/IWorld.sol";

import { ChainComponent } from "../src/codegen/index.sol";
import { StringToBytesKey } from "../src/systems/library/StringToBytesKey.sol";

contract PostDeploy is Script {
  function run(address worldAddress) external {
    // Load the private key from the `PRIVATE_KEY` environment variable (in .env)
    uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY");

    // Start broadcasting transactions from the deployer account
    vm.startBroadcast(deployerPrivateKey);

    IWorld world = IWorld(worldAddress);

    world.createChainEntity(
      "0x1",
      "Ethereum",
      "#121212"
    );

    world.createChainEntity(
      "0xa",
      "OP+mainnet",
      "#FC0721"
    );

     world.createChainEntity(
      "0x2105",
      "Base",
      "#799CF5"
    );

    world.createChainEntity(
      "0x38",
      "BNB",
      "#F0B90B"
    );

     world.createChainEntity(
      "0x89",
      "Polygon+PoS",
      "#8C44ED"
    );

     world.createChainEntity(
      "0xa86a",
      "Avalanche+C-chain",
      "#E84440"
    );
    
     world.createChainEntity(
      "0xa4ec",
      "Celo",
      "#809863"
    );

     world.createChainEntity(
      "0x64",
      "Gnosis",
      "#11765B"
    );

     world.createChainEntity(
      "0xa4b1",
      "Arbitrum+One",
      "#2050DE"
    );

    bytes32 chainId = StringToBytesKey("0x1");

    uint8[] memory pixel_ids = new uint8[](3);
    pixel_ids[0] = 1;
    pixel_ids[1] = 2;
    pixel_ids[2] = 3;

    uint8[] memory pixel_colors = new uint8[](3);
    pixel_colors[0] = 0x0;
    pixel_colors[1] = 0xA;
    pixel_colors[2] = 0xB;
    
    address[] memory contract_addresses = new address[](3);
    contract_addresses[0] = 0x051F533167D366AeE5AEbF95B85d8cd5a5A4Ef4A;
    contract_addresses[1] = 0x051F533167D366AeE5AEbF95B85d8cd5a5A4Ef4A;
    contract_addresses[2] = 0x051F533167D366AeE5AEbF95B85d8cd5a5A4Ef4A;

    uint8[] memory connected_land_ids = new uint8[](3);
    connected_land_ids[0] = 1;
    connected_land_ids[1] = 2;
    connected_land_ids[2] = 3;

    uint8[] memory connected_pixel_ids = new uint8[](3);
    connected_pixel_ids[0] = 1;
    connected_pixel_ids[1] = 2;
    connected_pixel_ids[2] = 3;

    world.createPixelEntity(
      chainId,
      1,
      pixel_ids,
      pixel_colors,
      contract_addresses,
      connected_land_ids,
      connected_pixel_ids
    );

    console.log("ChainEntitySystem created");
    
    vm.stopBroadcast();
  }
}
