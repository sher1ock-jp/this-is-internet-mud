// SPDX-License-Identifier: MIT
pragma solidity >=0.8.21;

import { System } from "@latticexyz/world/src/System.sol";
import {
    ChainComponent
} from "../codegen/index.sol";

import { getUniqueEntity } from "@latticexyz/world-modules/src/modules/uniqueentity/getUniqueEntity.sol";
import {StringToBytesKey} from "./library/StringToBytesKey.sol";

contract ChainEntitySystem is System {
    function createChainEntity(
        uint16 chain_id,
        string memory chain_name,
        string memory chain_color
    ) public {
        // bytes32 _chain_id = StringToBytesKey(chain_id); // cant use string as key
        uint8 initial_land_count = 1;
        ChainComponent.set(
            chain_id,
            initial_land_count,
            chain_name,
            chain_color
        );
    }

    function addLandEntity(
        uint16 chain_id
    ) public {
        // bytes32 _chain_id = StringToBytesKey(chain_id); // cant use string as key
        uint8 land_count = ChainComponent.getLandCount(chain_id) + 1;
        ChainComponent.setLandCount(
            chain_id,
            land_count
        );
    }

}