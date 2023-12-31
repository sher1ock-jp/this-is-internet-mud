// SPDX-License-Identifier: MIT
pragma solidity >=0.8.21;

/* Autogenerated file. Do not edit manually. */

// Import schema type
import { SchemaType } from "@latticexyz/schema-type/src/solidity/SchemaType.sol";

// Import store internals
import { IStore } from "@latticexyz/store/src/IStore.sol";
import { StoreSwitch } from "@latticexyz/store/src/StoreSwitch.sol";
import { StoreCore } from "@latticexyz/store/src/StoreCore.sol";
import { Bytes } from "@latticexyz/store/src/Bytes.sol";
import { Memory } from "@latticexyz/store/src/Memory.sol";
import { SliceLib } from "@latticexyz/store/src/Slice.sol";
import { EncodeArray } from "@latticexyz/store/src/tightcoder/EncodeArray.sol";
import { FieldLayout, FieldLayoutLib } from "@latticexyz/store/src/FieldLayout.sol";
import { Schema, SchemaLib } from "@latticexyz/store/src/Schema.sol";
import { PackedCounter, PackedCounterLib } from "@latticexyz/store/src/PackedCounter.sol";
import { ResourceId } from "@latticexyz/store/src/ResourceId.sol";
import { RESOURCE_TABLE, RESOURCE_OFFCHAIN_TABLE } from "@latticexyz/store/src/storeResourceTypes.sol";

ResourceId constant _tableId = ResourceId.wrap(
  bytes32(abi.encodePacked(RESOURCE_TABLE, bytes14(""), bytes16("Pixel")))
);
ResourceId constant PixelTableId = _tableId;

FieldLayout constant _fieldLayout = FieldLayout.wrap(
  0x001c080002010101140101010000000000000000000000000000000000000000
);

struct PixelData {
  uint16 chainID;
  uint8 landID;
  uint8 pixelID;
  uint8 pixelColor;
  address contractAddress;
  uint8 connectedChainId;
  uint8 connectedLandId;
  uint8 connectedPixelId;
}

library Pixel {
  /**
   * @notice Get the table values' field layout.
   * @return _fieldLayout The field layout for the table.
   */
  function getFieldLayout() internal pure returns (FieldLayout) {
    return _fieldLayout;
  }

  /**
   * @notice Get the table's key schema.
   * @return _keySchema The key schema for the table.
   */
  function getKeySchema() internal pure returns (Schema) {
    SchemaType[] memory _keySchema = new SchemaType[](3);
    _keySchema[0] = SchemaType.UINT16;
    _keySchema[1] = SchemaType.UINT8;
    _keySchema[2] = SchemaType.UINT8;

    return SchemaLib.encode(_keySchema);
  }

  /**
   * @notice Get the table's value schema.
   * @return _valueSchema The value schema for the table.
   */
  function getValueSchema() internal pure returns (Schema) {
    SchemaType[] memory _valueSchema = new SchemaType[](8);
    _valueSchema[0] = SchemaType.UINT16;
    _valueSchema[1] = SchemaType.UINT8;
    _valueSchema[2] = SchemaType.UINT8;
    _valueSchema[3] = SchemaType.UINT8;
    _valueSchema[4] = SchemaType.ADDRESS;
    _valueSchema[5] = SchemaType.UINT8;
    _valueSchema[6] = SchemaType.UINT8;
    _valueSchema[7] = SchemaType.UINT8;

    return SchemaLib.encode(_valueSchema);
  }

  /**
   * @notice Get the table's key field names.
   * @return keyNames An array of strings with the names of key fields.
   */
  function getKeyNames() internal pure returns (string[] memory keyNames) {
    keyNames = new string[](3);
    keyNames[0] = "chainId";
    keyNames[1] = "landId";
    keyNames[2] = "pixelId";
  }

  /**
   * @notice Get the table's value field names.
   * @return fieldNames An array of strings with the names of value fields.
   */
  function getFieldNames() internal pure returns (string[] memory fieldNames) {
    fieldNames = new string[](8);
    fieldNames[0] = "chainID";
    fieldNames[1] = "landID";
    fieldNames[2] = "pixelID";
    fieldNames[3] = "pixelColor";
    fieldNames[4] = "contractAddress";
    fieldNames[5] = "connectedChainId";
    fieldNames[6] = "connectedLandId";
    fieldNames[7] = "connectedPixelId";
  }

  /**
   * @notice Register the table with its config.
   */
  function register() internal {
    StoreSwitch.registerTable(_tableId, _fieldLayout, getKeySchema(), getValueSchema(), getKeyNames(), getFieldNames());
  }

  /**
   * @notice Register the table with its config.
   */
  function _register() internal {
    StoreCore.registerTable(_tableId, _fieldLayout, getKeySchema(), getValueSchema(), getKeyNames(), getFieldNames());
  }

  /**
   * @notice Get chainID.
   */
  function getChainID(uint16 chainId, uint8 landId, uint8 pixelId) internal view returns (uint16 chainID) {
    bytes32[] memory _keyTuple = new bytes32[](3);
    _keyTuple[0] = bytes32(uint256(chainId));
    _keyTuple[1] = bytes32(uint256(landId));
    _keyTuple[2] = bytes32(uint256(pixelId));

    bytes32 _blob = StoreSwitch.getStaticField(_tableId, _keyTuple, 0, _fieldLayout);
    return (uint16(bytes2(_blob)));
  }

  /**
   * @notice Get chainID.
   */
  function _getChainID(uint16 chainId, uint8 landId, uint8 pixelId) internal view returns (uint16 chainID) {
    bytes32[] memory _keyTuple = new bytes32[](3);
    _keyTuple[0] = bytes32(uint256(chainId));
    _keyTuple[1] = bytes32(uint256(landId));
    _keyTuple[2] = bytes32(uint256(pixelId));

    bytes32 _blob = StoreCore.getStaticField(_tableId, _keyTuple, 0, _fieldLayout);
    return (uint16(bytes2(_blob)));
  }

  /**
   * @notice Set chainID.
   */
  function setChainID(uint16 chainId, uint8 landId, uint8 pixelId, uint16 chainID) internal {
    bytes32[] memory _keyTuple = new bytes32[](3);
    _keyTuple[0] = bytes32(uint256(chainId));
    _keyTuple[1] = bytes32(uint256(landId));
    _keyTuple[2] = bytes32(uint256(pixelId));

    StoreSwitch.setStaticField(_tableId, _keyTuple, 0, abi.encodePacked((chainID)), _fieldLayout);
  }

  /**
   * @notice Set chainID.
   */
  function _setChainID(uint16 chainId, uint8 landId, uint8 pixelId, uint16 chainID) internal {
    bytes32[] memory _keyTuple = new bytes32[](3);
    _keyTuple[0] = bytes32(uint256(chainId));
    _keyTuple[1] = bytes32(uint256(landId));
    _keyTuple[2] = bytes32(uint256(pixelId));

    StoreCore.setStaticField(_tableId, _keyTuple, 0, abi.encodePacked((chainID)), _fieldLayout);
  }

  /**
   * @notice Get landID.
   */
  function getLandID(uint16 chainId, uint8 landId, uint8 pixelId) internal view returns (uint8 landID) {
    bytes32[] memory _keyTuple = new bytes32[](3);
    _keyTuple[0] = bytes32(uint256(chainId));
    _keyTuple[1] = bytes32(uint256(landId));
    _keyTuple[2] = bytes32(uint256(pixelId));

    bytes32 _blob = StoreSwitch.getStaticField(_tableId, _keyTuple, 1, _fieldLayout);
    return (uint8(bytes1(_blob)));
  }

  /**
   * @notice Get landID.
   */
  function _getLandID(uint16 chainId, uint8 landId, uint8 pixelId) internal view returns (uint8 landID) {
    bytes32[] memory _keyTuple = new bytes32[](3);
    _keyTuple[0] = bytes32(uint256(chainId));
    _keyTuple[1] = bytes32(uint256(landId));
    _keyTuple[2] = bytes32(uint256(pixelId));

    bytes32 _blob = StoreCore.getStaticField(_tableId, _keyTuple, 1, _fieldLayout);
    return (uint8(bytes1(_blob)));
  }

  /**
   * @notice Set landID.
   */
  function setLandID(uint16 chainId, uint8 landId, uint8 pixelId, uint8 landID) internal {
    bytes32[] memory _keyTuple = new bytes32[](3);
    _keyTuple[0] = bytes32(uint256(chainId));
    _keyTuple[1] = bytes32(uint256(landId));
    _keyTuple[2] = bytes32(uint256(pixelId));

    StoreSwitch.setStaticField(_tableId, _keyTuple, 1, abi.encodePacked((landID)), _fieldLayout);
  }

  /**
   * @notice Set landID.
   */
  function _setLandID(uint16 chainId, uint8 landId, uint8 pixelId, uint8 landID) internal {
    bytes32[] memory _keyTuple = new bytes32[](3);
    _keyTuple[0] = bytes32(uint256(chainId));
    _keyTuple[1] = bytes32(uint256(landId));
    _keyTuple[2] = bytes32(uint256(pixelId));

    StoreCore.setStaticField(_tableId, _keyTuple, 1, abi.encodePacked((landID)), _fieldLayout);
  }

  /**
   * @notice Get pixelID.
   */
  function getPixelID(uint16 chainId, uint8 landId, uint8 pixelId) internal view returns (uint8 pixelID) {
    bytes32[] memory _keyTuple = new bytes32[](3);
    _keyTuple[0] = bytes32(uint256(chainId));
    _keyTuple[1] = bytes32(uint256(landId));
    _keyTuple[2] = bytes32(uint256(pixelId));

    bytes32 _blob = StoreSwitch.getStaticField(_tableId, _keyTuple, 2, _fieldLayout);
    return (uint8(bytes1(_blob)));
  }

  /**
   * @notice Get pixelID.
   */
  function _getPixelID(uint16 chainId, uint8 landId, uint8 pixelId) internal view returns (uint8 pixelID) {
    bytes32[] memory _keyTuple = new bytes32[](3);
    _keyTuple[0] = bytes32(uint256(chainId));
    _keyTuple[1] = bytes32(uint256(landId));
    _keyTuple[2] = bytes32(uint256(pixelId));

    bytes32 _blob = StoreCore.getStaticField(_tableId, _keyTuple, 2, _fieldLayout);
    return (uint8(bytes1(_blob)));
  }

  /**
   * @notice Set pixelID.
   */
  function setPixelID(uint16 chainId, uint8 landId, uint8 pixelId, uint8 pixelID) internal {
    bytes32[] memory _keyTuple = new bytes32[](3);
    _keyTuple[0] = bytes32(uint256(chainId));
    _keyTuple[1] = bytes32(uint256(landId));
    _keyTuple[2] = bytes32(uint256(pixelId));

    StoreSwitch.setStaticField(_tableId, _keyTuple, 2, abi.encodePacked((pixelID)), _fieldLayout);
  }

  /**
   * @notice Set pixelID.
   */
  function _setPixelID(uint16 chainId, uint8 landId, uint8 pixelId, uint8 pixelID) internal {
    bytes32[] memory _keyTuple = new bytes32[](3);
    _keyTuple[0] = bytes32(uint256(chainId));
    _keyTuple[1] = bytes32(uint256(landId));
    _keyTuple[2] = bytes32(uint256(pixelId));

    StoreCore.setStaticField(_tableId, _keyTuple, 2, abi.encodePacked((pixelID)), _fieldLayout);
  }

  /**
   * @notice Get pixelColor.
   */
  function getPixelColor(uint16 chainId, uint8 landId, uint8 pixelId) internal view returns (uint8 pixelColor) {
    bytes32[] memory _keyTuple = new bytes32[](3);
    _keyTuple[0] = bytes32(uint256(chainId));
    _keyTuple[1] = bytes32(uint256(landId));
    _keyTuple[2] = bytes32(uint256(pixelId));

    bytes32 _blob = StoreSwitch.getStaticField(_tableId, _keyTuple, 3, _fieldLayout);
    return (uint8(bytes1(_blob)));
  }

  /**
   * @notice Get pixelColor.
   */
  function _getPixelColor(uint16 chainId, uint8 landId, uint8 pixelId) internal view returns (uint8 pixelColor) {
    bytes32[] memory _keyTuple = new bytes32[](3);
    _keyTuple[0] = bytes32(uint256(chainId));
    _keyTuple[1] = bytes32(uint256(landId));
    _keyTuple[2] = bytes32(uint256(pixelId));

    bytes32 _blob = StoreCore.getStaticField(_tableId, _keyTuple, 3, _fieldLayout);
    return (uint8(bytes1(_blob)));
  }

  /**
   * @notice Set pixelColor.
   */
  function setPixelColor(uint16 chainId, uint8 landId, uint8 pixelId, uint8 pixelColor) internal {
    bytes32[] memory _keyTuple = new bytes32[](3);
    _keyTuple[0] = bytes32(uint256(chainId));
    _keyTuple[1] = bytes32(uint256(landId));
    _keyTuple[2] = bytes32(uint256(pixelId));

    StoreSwitch.setStaticField(_tableId, _keyTuple, 3, abi.encodePacked((pixelColor)), _fieldLayout);
  }

  /**
   * @notice Set pixelColor.
   */
  function _setPixelColor(uint16 chainId, uint8 landId, uint8 pixelId, uint8 pixelColor) internal {
    bytes32[] memory _keyTuple = new bytes32[](3);
    _keyTuple[0] = bytes32(uint256(chainId));
    _keyTuple[1] = bytes32(uint256(landId));
    _keyTuple[2] = bytes32(uint256(pixelId));

    StoreCore.setStaticField(_tableId, _keyTuple, 3, abi.encodePacked((pixelColor)), _fieldLayout);
  }

  /**
   * @notice Get contractAddress.
   */
  function getContractAddress(
    uint16 chainId,
    uint8 landId,
    uint8 pixelId
  ) internal view returns (address contractAddress) {
    bytes32[] memory _keyTuple = new bytes32[](3);
    _keyTuple[0] = bytes32(uint256(chainId));
    _keyTuple[1] = bytes32(uint256(landId));
    _keyTuple[2] = bytes32(uint256(pixelId));

    bytes32 _blob = StoreSwitch.getStaticField(_tableId, _keyTuple, 4, _fieldLayout);
    return (address(bytes20(_blob)));
  }

  /**
   * @notice Get contractAddress.
   */
  function _getContractAddress(
    uint16 chainId,
    uint8 landId,
    uint8 pixelId
  ) internal view returns (address contractAddress) {
    bytes32[] memory _keyTuple = new bytes32[](3);
    _keyTuple[0] = bytes32(uint256(chainId));
    _keyTuple[1] = bytes32(uint256(landId));
    _keyTuple[2] = bytes32(uint256(pixelId));

    bytes32 _blob = StoreCore.getStaticField(_tableId, _keyTuple, 4, _fieldLayout);
    return (address(bytes20(_blob)));
  }

  /**
   * @notice Set contractAddress.
   */
  function setContractAddress(uint16 chainId, uint8 landId, uint8 pixelId, address contractAddress) internal {
    bytes32[] memory _keyTuple = new bytes32[](3);
    _keyTuple[0] = bytes32(uint256(chainId));
    _keyTuple[1] = bytes32(uint256(landId));
    _keyTuple[2] = bytes32(uint256(pixelId));

    StoreSwitch.setStaticField(_tableId, _keyTuple, 4, abi.encodePacked((contractAddress)), _fieldLayout);
  }

  /**
   * @notice Set contractAddress.
   */
  function _setContractAddress(uint16 chainId, uint8 landId, uint8 pixelId, address contractAddress) internal {
    bytes32[] memory _keyTuple = new bytes32[](3);
    _keyTuple[0] = bytes32(uint256(chainId));
    _keyTuple[1] = bytes32(uint256(landId));
    _keyTuple[2] = bytes32(uint256(pixelId));

    StoreCore.setStaticField(_tableId, _keyTuple, 4, abi.encodePacked((contractAddress)), _fieldLayout);
  }

  /**
   * @notice Get connectedChainId.
   */
  function getConnectedChainId(
    uint16 chainId,
    uint8 landId,
    uint8 pixelId
  ) internal view returns (uint8 connectedChainId) {
    bytes32[] memory _keyTuple = new bytes32[](3);
    _keyTuple[0] = bytes32(uint256(chainId));
    _keyTuple[1] = bytes32(uint256(landId));
    _keyTuple[2] = bytes32(uint256(pixelId));

    bytes32 _blob = StoreSwitch.getStaticField(_tableId, _keyTuple, 5, _fieldLayout);
    return (uint8(bytes1(_blob)));
  }

  /**
   * @notice Get connectedChainId.
   */
  function _getConnectedChainId(
    uint16 chainId,
    uint8 landId,
    uint8 pixelId
  ) internal view returns (uint8 connectedChainId) {
    bytes32[] memory _keyTuple = new bytes32[](3);
    _keyTuple[0] = bytes32(uint256(chainId));
    _keyTuple[1] = bytes32(uint256(landId));
    _keyTuple[2] = bytes32(uint256(pixelId));

    bytes32 _blob = StoreCore.getStaticField(_tableId, _keyTuple, 5, _fieldLayout);
    return (uint8(bytes1(_blob)));
  }

  /**
   * @notice Set connectedChainId.
   */
  function setConnectedChainId(uint16 chainId, uint8 landId, uint8 pixelId, uint8 connectedChainId) internal {
    bytes32[] memory _keyTuple = new bytes32[](3);
    _keyTuple[0] = bytes32(uint256(chainId));
    _keyTuple[1] = bytes32(uint256(landId));
    _keyTuple[2] = bytes32(uint256(pixelId));

    StoreSwitch.setStaticField(_tableId, _keyTuple, 5, abi.encodePacked((connectedChainId)), _fieldLayout);
  }

  /**
   * @notice Set connectedChainId.
   */
  function _setConnectedChainId(uint16 chainId, uint8 landId, uint8 pixelId, uint8 connectedChainId) internal {
    bytes32[] memory _keyTuple = new bytes32[](3);
    _keyTuple[0] = bytes32(uint256(chainId));
    _keyTuple[1] = bytes32(uint256(landId));
    _keyTuple[2] = bytes32(uint256(pixelId));

    StoreCore.setStaticField(_tableId, _keyTuple, 5, abi.encodePacked((connectedChainId)), _fieldLayout);
  }

  /**
   * @notice Get connectedLandId.
   */
  function getConnectedLandId(
    uint16 chainId,
    uint8 landId,
    uint8 pixelId
  ) internal view returns (uint8 connectedLandId) {
    bytes32[] memory _keyTuple = new bytes32[](3);
    _keyTuple[0] = bytes32(uint256(chainId));
    _keyTuple[1] = bytes32(uint256(landId));
    _keyTuple[2] = bytes32(uint256(pixelId));

    bytes32 _blob = StoreSwitch.getStaticField(_tableId, _keyTuple, 6, _fieldLayout);
    return (uint8(bytes1(_blob)));
  }

  /**
   * @notice Get connectedLandId.
   */
  function _getConnectedLandId(
    uint16 chainId,
    uint8 landId,
    uint8 pixelId
  ) internal view returns (uint8 connectedLandId) {
    bytes32[] memory _keyTuple = new bytes32[](3);
    _keyTuple[0] = bytes32(uint256(chainId));
    _keyTuple[1] = bytes32(uint256(landId));
    _keyTuple[2] = bytes32(uint256(pixelId));

    bytes32 _blob = StoreCore.getStaticField(_tableId, _keyTuple, 6, _fieldLayout);
    return (uint8(bytes1(_blob)));
  }

  /**
   * @notice Set connectedLandId.
   */
  function setConnectedLandId(uint16 chainId, uint8 landId, uint8 pixelId, uint8 connectedLandId) internal {
    bytes32[] memory _keyTuple = new bytes32[](3);
    _keyTuple[0] = bytes32(uint256(chainId));
    _keyTuple[1] = bytes32(uint256(landId));
    _keyTuple[2] = bytes32(uint256(pixelId));

    StoreSwitch.setStaticField(_tableId, _keyTuple, 6, abi.encodePacked((connectedLandId)), _fieldLayout);
  }

  /**
   * @notice Set connectedLandId.
   */
  function _setConnectedLandId(uint16 chainId, uint8 landId, uint8 pixelId, uint8 connectedLandId) internal {
    bytes32[] memory _keyTuple = new bytes32[](3);
    _keyTuple[0] = bytes32(uint256(chainId));
    _keyTuple[1] = bytes32(uint256(landId));
    _keyTuple[2] = bytes32(uint256(pixelId));

    StoreCore.setStaticField(_tableId, _keyTuple, 6, abi.encodePacked((connectedLandId)), _fieldLayout);
  }

  /**
   * @notice Get connectedPixelId.
   */
  function getConnectedPixelId(
    uint16 chainId,
    uint8 landId,
    uint8 pixelId
  ) internal view returns (uint8 connectedPixelId) {
    bytes32[] memory _keyTuple = new bytes32[](3);
    _keyTuple[0] = bytes32(uint256(chainId));
    _keyTuple[1] = bytes32(uint256(landId));
    _keyTuple[2] = bytes32(uint256(pixelId));

    bytes32 _blob = StoreSwitch.getStaticField(_tableId, _keyTuple, 7, _fieldLayout);
    return (uint8(bytes1(_blob)));
  }

  /**
   * @notice Get connectedPixelId.
   */
  function _getConnectedPixelId(
    uint16 chainId,
    uint8 landId,
    uint8 pixelId
  ) internal view returns (uint8 connectedPixelId) {
    bytes32[] memory _keyTuple = new bytes32[](3);
    _keyTuple[0] = bytes32(uint256(chainId));
    _keyTuple[1] = bytes32(uint256(landId));
    _keyTuple[2] = bytes32(uint256(pixelId));

    bytes32 _blob = StoreCore.getStaticField(_tableId, _keyTuple, 7, _fieldLayout);
    return (uint8(bytes1(_blob)));
  }

  /**
   * @notice Set connectedPixelId.
   */
  function setConnectedPixelId(uint16 chainId, uint8 landId, uint8 pixelId, uint8 connectedPixelId) internal {
    bytes32[] memory _keyTuple = new bytes32[](3);
    _keyTuple[0] = bytes32(uint256(chainId));
    _keyTuple[1] = bytes32(uint256(landId));
    _keyTuple[2] = bytes32(uint256(pixelId));

    StoreSwitch.setStaticField(_tableId, _keyTuple, 7, abi.encodePacked((connectedPixelId)), _fieldLayout);
  }

  /**
   * @notice Set connectedPixelId.
   */
  function _setConnectedPixelId(uint16 chainId, uint8 landId, uint8 pixelId, uint8 connectedPixelId) internal {
    bytes32[] memory _keyTuple = new bytes32[](3);
    _keyTuple[0] = bytes32(uint256(chainId));
    _keyTuple[1] = bytes32(uint256(landId));
    _keyTuple[2] = bytes32(uint256(pixelId));

    StoreCore.setStaticField(_tableId, _keyTuple, 7, abi.encodePacked((connectedPixelId)), _fieldLayout);
  }

  /**
   * @notice Get the full data.
   */
  function get(uint16 chainId, uint8 landId, uint8 pixelId) internal view returns (PixelData memory _table) {
    bytes32[] memory _keyTuple = new bytes32[](3);
    _keyTuple[0] = bytes32(uint256(chainId));
    _keyTuple[1] = bytes32(uint256(landId));
    _keyTuple[2] = bytes32(uint256(pixelId));

    (bytes memory _staticData, PackedCounter _encodedLengths, bytes memory _dynamicData) = StoreSwitch.getRecord(
      _tableId,
      _keyTuple,
      _fieldLayout
    );
    return decode(_staticData, _encodedLengths, _dynamicData);
  }

  /**
   * @notice Get the full data.
   */
  function _get(uint16 chainId, uint8 landId, uint8 pixelId) internal view returns (PixelData memory _table) {
    bytes32[] memory _keyTuple = new bytes32[](3);
    _keyTuple[0] = bytes32(uint256(chainId));
    _keyTuple[1] = bytes32(uint256(landId));
    _keyTuple[2] = bytes32(uint256(pixelId));

    (bytes memory _staticData, PackedCounter _encodedLengths, bytes memory _dynamicData) = StoreCore.getRecord(
      _tableId,
      _keyTuple,
      _fieldLayout
    );
    return decode(_staticData, _encodedLengths, _dynamicData);
  }

  /**
   * @notice Set the full data using individual values.
   */
  function set(
    uint16 chainId,
    uint8 landId,
    uint8 pixelId,
    uint16 chainID,
    uint8 landID,
    uint8 pixelID,
    uint8 pixelColor,
    address contractAddress,
    uint8 connectedChainId,
    uint8 connectedLandId,
    uint8 connectedPixelId
  ) internal {
    bytes memory _staticData = encodeStatic(
      chainID,
      landID,
      pixelID,
      pixelColor,
      contractAddress,
      connectedChainId,
      connectedLandId,
      connectedPixelId
    );

    PackedCounter _encodedLengths;
    bytes memory _dynamicData;

    bytes32[] memory _keyTuple = new bytes32[](3);
    _keyTuple[0] = bytes32(uint256(chainId));
    _keyTuple[1] = bytes32(uint256(landId));
    _keyTuple[2] = bytes32(uint256(pixelId));

    StoreSwitch.setRecord(_tableId, _keyTuple, _staticData, _encodedLengths, _dynamicData);
  }

  /**
   * @notice Set the full data using individual values.
   */
  function _set(
    uint16 chainId,
    uint8 landId,
    uint8 pixelId,
    uint16 chainID,
    uint8 landID,
    uint8 pixelID,
    uint8 pixelColor,
    address contractAddress,
    uint8 connectedChainId,
    uint8 connectedLandId,
    uint8 connectedPixelId
  ) internal {
    bytes memory _staticData = encodeStatic(
      chainID,
      landID,
      pixelID,
      pixelColor,
      contractAddress,
      connectedChainId,
      connectedLandId,
      connectedPixelId
    );

    PackedCounter _encodedLengths;
    bytes memory _dynamicData;

    bytes32[] memory _keyTuple = new bytes32[](3);
    _keyTuple[0] = bytes32(uint256(chainId));
    _keyTuple[1] = bytes32(uint256(landId));
    _keyTuple[2] = bytes32(uint256(pixelId));

    StoreCore.setRecord(_tableId, _keyTuple, _staticData, _encodedLengths, _dynamicData, _fieldLayout);
  }

  /**
   * @notice Set the full data using the data struct.
   */
  function set(uint16 chainId, uint8 landId, uint8 pixelId, PixelData memory _table) internal {
    bytes memory _staticData = encodeStatic(
      _table.chainID,
      _table.landID,
      _table.pixelID,
      _table.pixelColor,
      _table.contractAddress,
      _table.connectedChainId,
      _table.connectedLandId,
      _table.connectedPixelId
    );

    PackedCounter _encodedLengths;
    bytes memory _dynamicData;

    bytes32[] memory _keyTuple = new bytes32[](3);
    _keyTuple[0] = bytes32(uint256(chainId));
    _keyTuple[1] = bytes32(uint256(landId));
    _keyTuple[2] = bytes32(uint256(pixelId));

    StoreSwitch.setRecord(_tableId, _keyTuple, _staticData, _encodedLengths, _dynamicData);
  }

  /**
   * @notice Set the full data using the data struct.
   */
  function _set(uint16 chainId, uint8 landId, uint8 pixelId, PixelData memory _table) internal {
    bytes memory _staticData = encodeStatic(
      _table.chainID,
      _table.landID,
      _table.pixelID,
      _table.pixelColor,
      _table.contractAddress,
      _table.connectedChainId,
      _table.connectedLandId,
      _table.connectedPixelId
    );

    PackedCounter _encodedLengths;
    bytes memory _dynamicData;

    bytes32[] memory _keyTuple = new bytes32[](3);
    _keyTuple[0] = bytes32(uint256(chainId));
    _keyTuple[1] = bytes32(uint256(landId));
    _keyTuple[2] = bytes32(uint256(pixelId));

    StoreCore.setRecord(_tableId, _keyTuple, _staticData, _encodedLengths, _dynamicData, _fieldLayout);
  }

  /**
   * @notice Decode the tightly packed blob of static data using this table's field layout.
   */
  function decodeStatic(
    bytes memory _blob
  )
    internal
    pure
    returns (
      uint16 chainID,
      uint8 landID,
      uint8 pixelID,
      uint8 pixelColor,
      address contractAddress,
      uint8 connectedChainId,
      uint8 connectedLandId,
      uint8 connectedPixelId
    )
  {
    chainID = (uint16(Bytes.slice2(_blob, 0)));

    landID = (uint8(Bytes.slice1(_blob, 2)));

    pixelID = (uint8(Bytes.slice1(_blob, 3)));

    pixelColor = (uint8(Bytes.slice1(_blob, 4)));

    contractAddress = (address(Bytes.slice20(_blob, 5)));

    connectedChainId = (uint8(Bytes.slice1(_blob, 25)));

    connectedLandId = (uint8(Bytes.slice1(_blob, 26)));

    connectedPixelId = (uint8(Bytes.slice1(_blob, 27)));
  }

  /**
   * @notice Decode the tightly packed blobs using this table's field layout.
   * @param _staticData Tightly packed static fields.
   *
   *
   */
  function decode(
    bytes memory _staticData,
    PackedCounter,
    bytes memory
  ) internal pure returns (PixelData memory _table) {
    (
      _table.chainID,
      _table.landID,
      _table.pixelID,
      _table.pixelColor,
      _table.contractAddress,
      _table.connectedChainId,
      _table.connectedLandId,
      _table.connectedPixelId
    ) = decodeStatic(_staticData);
  }

  /**
   * @notice Delete all data for given keys.
   */
  function deleteRecord(uint16 chainId, uint8 landId, uint8 pixelId) internal {
    bytes32[] memory _keyTuple = new bytes32[](3);
    _keyTuple[0] = bytes32(uint256(chainId));
    _keyTuple[1] = bytes32(uint256(landId));
    _keyTuple[2] = bytes32(uint256(pixelId));

    StoreSwitch.deleteRecord(_tableId, _keyTuple);
  }

  /**
   * @notice Delete all data for given keys.
   */
  function _deleteRecord(uint16 chainId, uint8 landId, uint8 pixelId) internal {
    bytes32[] memory _keyTuple = new bytes32[](3);
    _keyTuple[0] = bytes32(uint256(chainId));
    _keyTuple[1] = bytes32(uint256(landId));
    _keyTuple[2] = bytes32(uint256(pixelId));

    StoreCore.deleteRecord(_tableId, _keyTuple, _fieldLayout);
  }

  /**
   * @notice Tightly pack static (fixed length) data using this table's schema.
   * @return The static data, encoded into a sequence of bytes.
   */
  function encodeStatic(
    uint16 chainID,
    uint8 landID,
    uint8 pixelID,
    uint8 pixelColor,
    address contractAddress,
    uint8 connectedChainId,
    uint8 connectedLandId,
    uint8 connectedPixelId
  ) internal pure returns (bytes memory) {
    return
      abi.encodePacked(
        chainID,
        landID,
        pixelID,
        pixelColor,
        contractAddress,
        connectedChainId,
        connectedLandId,
        connectedPixelId
      );
  }

  /**
   * @notice Encode all of a record's fields.
   * @return The static (fixed length) data, encoded into a sequence of bytes.
   * @return The lengths of the dynamic fields (packed into a single bytes32 value).
   * @return The dyanmic (variable length) data, encoded into a sequence of bytes.
   */
  function encode(
    uint16 chainID,
    uint8 landID,
    uint8 pixelID,
    uint8 pixelColor,
    address contractAddress,
    uint8 connectedChainId,
    uint8 connectedLandId,
    uint8 connectedPixelId
  ) internal pure returns (bytes memory, PackedCounter, bytes memory) {
    bytes memory _staticData = encodeStatic(
      chainID,
      landID,
      pixelID,
      pixelColor,
      contractAddress,
      connectedChainId,
      connectedLandId,
      connectedPixelId
    );

    PackedCounter _encodedLengths;
    bytes memory _dynamicData;

    return (_staticData, _encodedLengths, _dynamicData);
  }

  /**
   * @notice Encode keys as a bytes32 array using this table's field layout.
   */
  function encodeKeyTuple(uint16 chainId, uint8 landId, uint8 pixelId) internal pure returns (bytes32[] memory) {
    bytes32[] memory _keyTuple = new bytes32[](3);
    _keyTuple[0] = bytes32(uint256(chainId));
    _keyTuple[1] = bytes32(uint256(landId));
    _keyTuple[2] = bytes32(uint256(pixelId));

    return _keyTuple;
  }
}
