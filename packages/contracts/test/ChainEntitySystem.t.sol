// SPDX-License-Identifier: MIT
pragma solidity >=0.8.21;

import "forge-std/Test.sol";
import { MudTest } from "@latticexyz/world/test/MudTest.t.sol";
import { getKeysWithValue } from "@latticexyz/world-modules/src/modules/keyswithvalue/getKeysWithValue.sol";

import { IWorld } from "../src/codegen/world/IWorld.sol";
// import { Counter, CounterTableId } from "../src/codegen/index.sol";
import { ChainComponent, ChainComponentData } from "../src/codegen/index.sol";
import { StringToBytesKey } from "../src/systems/library/StringToBytesKey.sol";

contract ChainEntitySystemTest is MudTest {
  function testWorldExists() public {
    uint256 codeSize;
    address addr = worldAddress;
    assembly {
      codeSize := extcodesize(addr)
    }
    assertTrue(codeSize > 0);
  }

  function testCreateChainEntity() public {
    vm.startPrank(worldAddress);
    bytes32 chainId = StringToBytesKey("0x1");
    ChainComponentData memory chain_component = ChainComponent.get(chainId);
    assertEq(keccak256(abi.encodePacked(chain_component.chainName)),keccak256(abi.encodePacked("Ethereum")));
    vm.stopPrank();
  }
}