// SPDX-License-Identifier: MIT
pragma solidity >=0.8.21;

import { System } from "@latticexyz/world/src/System.sol";
import {
    AddressInfo
} from "../codegen/index.sol";

contract AddressEntitySystem is System {
    function setAddressInfo(address _address, string name, string description ) public {
        AddressInfo.set(
            _address,
            name,
            description
        );
    }

    function changeAddressName(address _address, string name) public {
        AddressInfo.setName(
            _address,
            name
        );
    }

    function changeAddressDescription(address _address, string description) public {
        AddressInfo.setDescription(
            _address,
            description
        );
    }
}