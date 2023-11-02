// SPDX-License-Identifier: MIT
pragma solidity >=0.8.21;

/* Autogenerated file. Do not edit manually. */

/**
 * @title IPixelEntitySystem
 * @dev This interface is automatically generated from the corresponding system contract. Do not edit manually.
 */
interface IPixelEntitySystem {
  function createPixelEntity(
    uint16 chain_id,
    uint8 land_id,
    uint8[] memory pixel_id,
    uint8[] memory pixel_color,
    address[] memory contract_address,
    uint8[] memory connected_chain_id,
    uint8[] memory connected_land_id,
    uint8[] memory connected_pixel_id
  ) external;

  function changePixelColor(uint16 chain_id, uint8 land_id, uint8 pixel_id, uint8 pixel_color) external;
}
