// SPDX-License-Identifier: MIT
pragma solidity >=0.8.21;

import { System } from "@latticexyz/world/src/System.sol";
import {
    Land,
    OffchainLand
} from "../codegen/index.sol";

import {StringToBytesKey} from "./library/StringToBytesKey.sol";

contract LandEntitySystem is System {
    function createLandEntity(
        bytes32 chain_id,
        bytes32 land_id,
        uint8 pixel_id
    ) public {
        Land.pushPixelId(
            chain_id,
            land_id,
            pixel_id
        );
    }

    // for create new pixel or change pixel element
    function emitReserveLandEntity(
        bytes32 chain_id,
        bytes32 land_id,
        uint8 pixel_id
    ) public {
        OffchainLand.set(
            chain_id,
            land_id,
            pixel_id
        );
    }

    function emitReleaseLandEntity(
        bytes32 chain_id,
        bytes32 land_id,
        uint8 pixel_id
    ) public {
        OffchainLand.remove(
            chain_id,
            land_id,
            pixel_id
        );
    }

}