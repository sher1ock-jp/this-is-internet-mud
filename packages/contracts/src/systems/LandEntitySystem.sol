// SPDX-License-Identifier: MIT
pragma solidity >=0.8.21;

import { System } from "@latticexyz/world/src/System.sol";
import {
    OffchainLand
} from "../codegen/index.sol";

import {StringToBytesKey} from "./library/StringToBytesKey.sol";

contract LandEntitySystem is System {
    // function createInitialLandEntity(
    //     bytes32 chain_id,
    //     uint8 pixel_id
    // ) public {

    //     uint8 initial_land_id = Chain.getLandCount(chain_id);

    //     Land.pushPixelId(
    //         chain_id,
    //         initial_land_id,
    //         pixel_id
    //     );
    // }

    // function addLandEntity (
    //     bytes32 chain_id,
    //     uint8 pixel_id
    // ) public {

    //     uint8 current_land_id = Chain.getLandId(
    //         chain_id,
    //         pixel_id
    //     );

    //     Land.pushPixelId(
    //         chain_id,
    //         current_land_id,
    //         pixel_id
    //     );
    // }

    // for create new pixel or change pixel element
    function emitReserveLandEntity(
        bytes32 chain_id,
        uint8 land_id,
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
        uint8 land_id
    ) public {
        OffchainLand.deleteRecord(
            chain_id,
            land_id
        );
    }
}