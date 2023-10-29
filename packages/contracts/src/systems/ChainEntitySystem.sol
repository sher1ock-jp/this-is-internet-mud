// SPDX-License-Identifier: MIT
pragma solidity >=0.8.21;

import { System } from "@latticexyz/world/src/System.sol";
import {
    Chain
} from "../codegen/index.sol";

import { getUniqueEntity } from "@latticexyz/world-modules/src/modules/uniqueentity/getUniqueEntity.sol";
import {StringToBytesKey} from "./library/StringToBytesKey.sol";

contract ChainEntitySystem is System {
    function createChainEntity(
        string memory chain_id,
        string memory chain_name,
        string memory chain_color
    ) public {
        bytes32 chain_id = StringToBytesKey(chain_id); // cant use string as key
        Chain.set(
            chain_id,
            land_id,
            chain_name,
            chain_color
        );
    }
}