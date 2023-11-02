// SPDX-License-Identifier: MIT
pragma solidity >=0.8.21;

import { System } from "@latticexyz/world/src/System.sol";
import {
    Pixel
} from "../codegen/index.sol";

import {StringToBytesKey} from "./library/StringToBytesKey.sol";

contract PixelEntitySystem is System {
    function createPixelEntity(
        uint16 chain_id,
        uint8 land_id,
        uint8[] memory pixel_id,
        uint8[] memory pixel_color,
        address[] memory contract_address,
        uint8[] memory connected_chain_id,
        uint8[] memory connected_land_id,
        uint8[] memory connected_pixel_id
    ) public {
        for (uint256 i = 0; i < pixel_id.length; i++) {
            Pixel.set(
                chain_id,
                land_id,
                pixel_id[i],
                chain_id,
                land_id,
                pixel_id[i],
                pixel_color[i],
                contract_address[i],
                connected_chain_id[i],
                connected_land_id[i],
                connected_pixel_id[i]
            );
        }
    }

    // user cant change only pixel address
    function changePixelColor(
        uint16 chain_id,
        uint8 land_id,
        uint8 pixel_id,
        uint8 pixel_color
    ) public {
        Pixel.setPixelColor(
            chain_id,
            land_id,
            pixel_id,
            pixel_color
        );
    }
}