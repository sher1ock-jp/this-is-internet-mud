// SPDX-License-Identifier: MIT
pragma solidity >=0.8.21;

import { System } from "@latticexyz/world/src/System.sol";
import {
    AddressInfo
} from "../codegen/index.sol";

contract AddressInfro is System {
    function setAddressInfo(address _address, string name, string description ) {
        AddressInfo.set(
            _address,
            name,
            description
        );
    }

    function changeAddressName(address _address, string name) {
        AddressInfo.setName(
            _address,
            name
        );
    }

    function changeAddressDescription(address _address, string description) {
        AddressInfo.setDescription(
            _address,
            description
        );
    }
}