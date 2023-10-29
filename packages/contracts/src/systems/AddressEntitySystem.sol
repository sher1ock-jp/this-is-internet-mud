// SPDX-License-Identifier: MIT
pragma solidity >=0.8.21;

import { System } from "@latticexyz/world/src/System.sol";
import {
    AddressInfo
} from "../codegen/index.sol";

contract AddressEntitySystem is System {
    function setAddressInfo(address contract_address, string memory name, string memory description ) public {
        AddressInfo.set(
            contract_address,
            name,
            description
        );
    }

    function changeAddressName(address contract_address, string memory name) public {
        AddressInfo.setName(
            contract_address,
            name
        );
    }

    function changeAddressDescription(address contract_address, string memory description) public {
        AddressInfo.setDescription(
            contract_address,
            description
        );
    }
}