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
  0x0017040001140101000000000000000000000000000000000000000000000000
);

struct PixelData {
  uint8 pixelColor;
  address address;
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
    _keySchema[0] = SchemaType.BYTES32;
    _keySchema[1] = SchemaType.UINT8;
    _keySchema[2] = SchemaType.UINT8;

    return SchemaLib.encode(_keySchema);
  }

  /**
   * @notice Get the table's value schema.
   * @return _valueSchema The value schema for the table.
   */
  function getValueSchema() internal pure returns (Schema) {
    SchemaType[] memory _valueSchema = new SchemaType[](4);
    _valueSchema[0] = SchemaType.UINT8;
    _valueSchema[1] = SchemaType.ADDRESS;
    _valueSchema[2] = SchemaType.UINT8;
    _valueSchema[3] = SchemaType.UINT8;

    return SchemaLib.encode(_valueSchema);
  }

  /**
   * @notice Get the table's key field names.
   * @return keyNames An array of strings with the names of key fields.
   */
  function getKeyNames() internal pure returns (string[] memory keyNames) {
    keyNames = new string[](3);
    keyNames[0] = "chaindId";
    keyNames[1] = "landId";
    keyNames[2] = "pixelId";
  }

  /**
   * @notice Get the table's value field names.
   * @return fieldNames An array of strings with the names of value fields.
   */
  function getFieldNames() internal pure returns (string[] memory fieldNames) {
    fieldNames = new string[](4);
    fieldNames[0] = "pixelColor";
    fieldNames[1] = "address";
    fieldNames[2] = "connectedLandId";
    fieldNames[3] = "connectedPixelId";
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
   * @notice Get pixelColor.
   */
  function getPixelColor(bytes32 chaindId, uint8 landId, uint8 pixelId) internal view returns (uint8 pixelColor) {
    bytes32[] memory _keyTuple = new bytes32[](3);
    _keyTuple[0] = chaindId;
    _keyTuple[1] = bytes32(uint256(landId));
    _keyTuple[2] = bytes32(uint256(pixelId));

    bytes32 _blob = StoreSwitch.getStaticField(_tableId, _keyTuple, 0, _fieldLayout);
    return (uint8(bytes1(_blob)));
  }

  /**
   * @notice Get pixelColor.
   */
  function _getPixelColor(bytes32 chaindId, uint8 landId, uint8 pixelId) internal view returns (uint8 pixelColor) {
    bytes32[] memory _keyTuple = new bytes32[](3);
    _keyTuple[0] = chaindId;
    _keyTuple[1] = bytes32(uint256(landId));
    _keyTuple[2] = bytes32(uint256(pixelId));

    bytes32 _blob = StoreCore.getStaticField(_tableId, _keyTuple, 0, _fieldLayout);
    return (uint8(bytes1(_blob)));
  }

  /**
   * @notice Set pixelColor.
   */
  function setPixelColor(bytes32 chaindId, uint8 landId, uint8 pixelId, uint8 pixelColor) internal {
    bytes32[] memory _keyTuple = new bytes32[](3);
    _keyTuple[0] = chaindId;
    _keyTuple[1] = bytes32(uint256(landId));
    _keyTuple[2] = bytes32(uint256(pixelId));

    StoreSwitch.setStaticField(_tableId, _keyTuple, 0, abi.encodePacked((pixelColor)), _fieldLayout);
  }

  /**
   * @notice Set pixelColor.
   */
  function _setPixelColor(bytes32 chaindId, uint8 landId, uint8 pixelId, uint8 pixelColor) internal {
    bytes32[] memory _keyTuple = new bytes32[](3);
    _keyTuple[0] = chaindId;
    _keyTuple[1] = bytes32(uint256(landId));
    _keyTuple[2] = bytes32(uint256(pixelId));

    StoreCore.setStaticField(_tableId, _keyTuple, 0, abi.encodePacked((pixelColor)), _fieldLayout);
  }

  /**
   * @notice Get address.
   */
  function getAddress(bytes32 chaindId, uint8 landId, uint8 pixelId) internal view returns (address address) {
    bytes32[] memory _keyTuple = new bytes32[](3);
    _keyTuple[0] = chaindId;
    _keyTuple[1] = bytes32(uint256(landId));
    _keyTuple[2] = bytes32(uint256(pixelId));

    bytes32 _blob = StoreSwitch.getStaticField(_tableId, _keyTuple, 1, _fieldLayout);
    return (address(bytes20(_blob)));
  }

  /**
   * @notice Get address.
   */
  function _getAddress(bytes32 chaindId, uint8 landId, uint8 pixelId) internal view returns (address address) {
    bytes32[] memory _keyTuple = new bytes32[](3);
    _keyTuple[0] = chaindId;
    _keyTuple[1] = bytes32(uint256(landId));
    _keyTuple[2] = bytes32(uint256(pixelId));

    bytes32 _blob = StoreCore.getStaticField(_tableId, _keyTuple, 1, _fieldLayout);
    return (address(bytes20(_blob)));
  }

  /**
   * @notice Set address.
   */
  function setAddress(bytes32 chaindId, uint8 landId, uint8 pixelId, address address) internal {
    bytes32[] memory _keyTuple = new bytes32[](3);
    _keyTuple[0] = chaindId;
    _keyTuple[1] = bytes32(uint256(landId));
    _keyTuple[2] = bytes32(uint256(pixelId));

    StoreSwitch.setStaticField(_tableId, _keyTuple, 1, abi.encodePacked((address)), _fieldLayout);
  }

  /**
   * @notice Set address.
   */
  function _setAddress(bytes32 chaindId, uint8 landId, uint8 pixelId, address address) internal {
    bytes32[] memory _keyTuple = new bytes32[](3);
    _keyTuple[0] = chaindId;
    _keyTuple[1] = bytes32(uint256(landId));
    _keyTuple[2] = bytes32(uint256(pixelId));

    StoreCore.setStaticField(_tableId, _keyTuple, 1, abi.encodePacked((address)), _fieldLayout);
  }

  /**
   * @notice Get connectedLandId.
   */
  function getConnectedLandId(
    bytes32 chaindId,
    uint8 landId,
    uint8 pixelId
  ) internal view returns (uint8 connectedLandId) {
    bytes32[] memory _keyTuple = new bytes32[](3);
    _keyTuple[0] = chaindId;
    _keyTuple[1] = bytes32(uint256(landId));
    _keyTuple[2] = bytes32(uint256(pixelId));

    bytes32 _blob = StoreSwitch.getStaticField(_tableId, _keyTuple, 2, _fieldLayout);
    return (uint8(bytes1(_blob)));
  }

  /**
   * @notice Get connectedLandId.
   */
  function _getConnectedLandId(
    bytes32 chaindId,
    uint8 landId,
    uint8 pixelId
  ) internal view returns (uint8 connectedLandId) {
    bytes32[] memory _keyTuple = new bytes32[](3);
    _keyTuple[0] = chaindId;
    _keyTuple[1] = bytes32(uint256(landId));
    _keyTuple[2] = bytes32(uint256(pixelId));

    bytes32 _blob = StoreCore.getStaticField(_tableId, _keyTuple, 2, _fieldLayout);
    return (uint8(bytes1(_blob)));
  }

  /**
   * @notice Set connectedLandId.
   */
  function setConnectedLandId(bytes32 chaindId, uint8 landId, uint8 pixelId, uint8 connectedLandId) internal {
    bytes32[] memory _keyTuple = new bytes32[](3);
    _keyTuple[0] = chaindId;
    _keyTuple[1] = bytes32(uint256(landId));
    _keyTuple[2] = bytes32(uint256(pixelId));

    StoreSwitch.setStaticField(_tableId, _keyTuple, 2, abi.encodePacked((connectedLandId)), _fieldLayout);
  }

  /**
   * @notice Set connectedLandId.
   */
  function _setConnectedLandId(bytes32 chaindId, uint8 landId, uint8 pixelId, uint8 connectedLandId) internal {
    bytes32[] memory _keyTuple = new bytes32[](3);
    _keyTuple[0] = chaindId;
    _keyTuple[1] = bytes32(uint256(landId));
    _keyTuple[2] = bytes32(uint256(pixelId));

    StoreCore.setStaticField(_tableId, _keyTuple, 2, abi.encodePacked((connectedLandId)), _fieldLayout);
  }

  /**
   * @notice Get connectedPixelId.
   */
  function getConnectedPixelId(
    bytes32 chaindId,
    uint8 landId,
    uint8 pixelId
  ) internal view returns (uint8 connectedPixelId) {
    bytes32[] memory _keyTuple = new bytes32[](3);
    _keyTuple[0] = chaindId;
    _keyTuple[1] = bytes32(uint256(landId));
    _keyTuple[2] = bytes32(uint256(pixelId));

    bytes32 _blob = StoreSwitch.getStaticField(_tableId, _keyTuple, 3, _fieldLayout);
    return (uint8(bytes1(_blob)));
  }

  /**
   * @notice Get connectedPixelId.
   */
  function _getConnectedPixelId(
    bytes32 chaindId,
    uint8 landId,
    uint8 pixelId
  ) internal view returns (uint8 connectedPixelId) {
    bytes32[] memory _keyTuple = new bytes32[](3);
    _keyTuple[0] = chaindId;
    _keyTuple[1] = bytes32(uint256(landId));
    _keyTuple[2] = bytes32(uint256(pixelId));

    bytes32 _blob = StoreCore.getStaticField(_tableId, _keyTuple, 3, _fieldLayout);
    return (uint8(bytes1(_blob)));
  }

  /**
   * @notice Set connectedPixelId.
   */
  function setConnectedPixelId(bytes32 chaindId, uint8 landId, uint8 pixelId, uint8 connectedPixelId) internal {
    bytes32[] memory _keyTuple = new bytes32[](3);
    _keyTuple[0] = chaindId;
    _keyTuple[1] = bytes32(uint256(landId));
    _keyTuple[2] = bytes32(uint256(pixelId));

    StoreSwitch.setStaticField(_tableId, _keyTuple, 3, abi.encodePacked((connectedPixelId)), _fieldLayout);
  }

  /**
   * @notice Set connectedPixelId.
   */
  function _setConnectedPixelId(bytes32 chaindId, uint8 landId, uint8 pixelId, uint8 connectedPixelId) internal {
    bytes32[] memory _keyTuple = new bytes32[](3);
    _keyTuple[0] = chaindId;
    _keyTuple[1] = bytes32(uint256(landId));
    _keyTuple[2] = bytes32(uint256(pixelId));

    StoreCore.setStaticField(_tableId, _keyTuple, 3, abi.encodePacked((connectedPixelId)), _fieldLayout);
  }

  /**
   * @notice Get the full data.
   */
  function get(bytes32 chaindId, uint8 landId, uint8 pixelId) internal view returns (PixelData memory _table) {
    bytes32[] memory _keyTuple = new bytes32[](3);
    _keyTuple[0] = chaindId;
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
  function _get(bytes32 chaindId, uint8 landId, uint8 pixelId) internal view returns (PixelData memory _table) {
    bytes32[] memory _keyTuple = new bytes32[](3);
    _keyTuple[0] = chaindId;
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
    bytes32 chaindId,
    uint8 landId,
    uint8 pixelId,
    uint8 pixelColor,
    address address,
    uint8 connectedLandId,
    uint8 connectedPixelId
  ) internal {
    bytes memory _staticData = encodeStatic(pixelColor, address, connectedLandId, connectedPixelId);

    PackedCounter _encodedLengths;
    bytes memory _dynamicData;

    bytes32[] memory _keyTuple = new bytes32[](3);
    _keyTuple[0] = chaindId;
    _keyTuple[1] = bytes32(uint256(landId));
    _keyTuple[2] = bytes32(uint256(pixelId));

    StoreSwitch.setRecord(_tableId, _keyTuple, _staticData, _encodedLengths, _dynamicData);
  }

  /**
   * @notice Set the full data using individual values.
   */
  function _set(
    bytes32 chaindId,
    uint8 landId,
    uint8 pixelId,
    uint8 pixelColor,
    address address,
    uint8 connectedLandId,
    uint8 connectedPixelId
  ) internal {
    bytes memory _staticData = encodeStatic(pixelColor, address, connectedLandId, connectedPixelId);

    PackedCounter _encodedLengths;
    bytes memory _dynamicData;

    bytes32[] memory _keyTuple = new bytes32[](3);
    _keyTuple[0] = chaindId;
    _keyTuple[1] = bytes32(uint256(landId));
    _keyTuple[2] = bytes32(uint256(pixelId));

    StoreCore.setRecord(_tableId, _keyTuple, _staticData, _encodedLengths, _dynamicData, _fieldLayout);
  }

  /**
   * @notice Set the full data using the data struct.
   */
  function set(bytes32 chaindId, uint8 landId, uint8 pixelId, PixelData memory _table) internal {
    bytes memory _staticData = encodeStatic(
      _table.pixelColor,
      _table.address,
      _table.connectedLandId,
      _table.connectedPixelId
    );

    PackedCounter _encodedLengths;
    bytes memory _dynamicData;

    bytes32[] memory _keyTuple = new bytes32[](3);
    _keyTuple[0] = chaindId;
    _keyTuple[1] = bytes32(uint256(landId));
    _keyTuple[2] = bytes32(uint256(pixelId));

    StoreSwitch.setRecord(_tableId, _keyTuple, _staticData, _encodedLengths, _dynamicData);
  }

  /**
   * @notice Set the full data using the data struct.
   */
  function _set(bytes32 chaindId, uint8 landId, uint8 pixelId, PixelData memory _table) internal {
    bytes memory _staticData = encodeStatic(
      _table.pixelColor,
      _table.address,
      _table.connectedLandId,
      _table.connectedPixelId
    );

    PackedCounter _encodedLengths;
    bytes memory _dynamicData;

    bytes32[] memory _keyTuple = new bytes32[](3);
    _keyTuple[0] = chaindId;
    _keyTuple[1] = bytes32(uint256(landId));
    _keyTuple[2] = bytes32(uint256(pixelId));

    StoreCore.setRecord(_tableId, _keyTuple, _staticData, _encodedLengths, _dynamicData, _fieldLayout);
  }

  /**
   * @notice Decode the tightly packed blob of static data using this table's field layout.
   */
  function decodeStatic(
    bytes memory _blob
  ) internal pure returns (uint8 pixelColor, address address, uint8 connectedLandId, uint8 connectedPixelId) {
    pixelColor = (uint8(Bytes.slice1(_blob, 0)));

    address = (address(Bytes.slice20(_blob, 1)));

    connectedLandId = (uint8(Bytes.slice1(_blob, 21)));

    connectedPixelId = (uint8(Bytes.slice1(_blob, 22)));
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
    (_table.pixelColor, _table.address, _table.connectedLandId, _table.connectedPixelId) = decodeStatic(_staticData);
  }

  /**
   * @notice Delete all data for given keys.
   */
  function deleteRecord(bytes32 chaindId, uint8 landId, uint8 pixelId) internal {
    bytes32[] memory _keyTuple = new bytes32[](3);
    _keyTuple[0] = chaindId;
    _keyTuple[1] = bytes32(uint256(landId));
    _keyTuple[2] = bytes32(uint256(pixelId));

    StoreSwitch.deleteRecord(_tableId, _keyTuple);
  }

  /**
   * @notice Delete all data for given keys.
   */
  function _deleteRecord(bytes32 chaindId, uint8 landId, uint8 pixelId) internal {
    bytes32[] memory _keyTuple = new bytes32[](3);
    _keyTuple[0] = chaindId;
    _keyTuple[1] = bytes32(uint256(landId));
    _keyTuple[2] = bytes32(uint256(pixelId));

    StoreCore.deleteRecord(_tableId, _keyTuple, _fieldLayout);
  }

  /**
   * @notice Tightly pack static (fixed length) data using this table's schema.
   * @return The static data, encoded into a sequence of bytes.
   */
  function encodeStatic(
    uint8 pixelColor,
    address address,
    uint8 connectedLandId,
    uint8 connectedPixelId
  ) internal pure returns (bytes memory) {
    return abi.encodePacked(pixelColor, address, connectedLandId, connectedPixelId);
  }

  /**
   * @notice Encode all of a record's fields.
   * @return The static (fixed length) data, encoded into a sequence of bytes.
   * @return The lengths of the dynamic fields (packed into a single bytes32 value).
   * @return The dyanmic (variable length) data, encoded into a sequence of bytes.
   */
  function encode(
    uint8 pixelColor,
    address address,
    uint8 connectedLandId,
    uint8 connectedPixelId
  ) internal pure returns (bytes memory, PackedCounter, bytes memory) {
    bytes memory _staticData = encodeStatic(pixelColor, address, connectedLandId, connectedPixelId);

    PackedCounter _encodedLengths;
    bytes memory _dynamicData;

    return (_staticData, _encodedLengths, _dynamicData);
  }

  /**
   * @notice Encode keys as a bytes32 array using this table's field layout.
   */
  function encodeKeyTuple(bytes32 chaindId, uint8 landId, uint8 pixelId) internal pure returns (bytes32[] memory) {
    bytes32[] memory _keyTuple = new bytes32[](3);
    _keyTuple[0] = chaindId;
    _keyTuple[1] = bytes32(uint256(landId));
    _keyTuple[2] = bytes32(uint256(pixelId));

    return _keyTuple;
  }
}