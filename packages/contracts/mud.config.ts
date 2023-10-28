import { mudConfig } from "@latticexyz/world/register";

export default mudConfig({
  tables: {
    Chain: {
      keySchema: {
        chainId: "bytes32",
      },
      valueSchema: {
        chainGasFee: "uint16",
        landId: "uint8",
        chainName: "string",
        chainColor: "string",
      },
    },

    Land: {
      keySchema: {
        landId: "uint8",
      },
      valueSchema: {
        pixelId: "uint8",
      },
    },

    PixelColor: {
      keySchema: {
        landId: "uint8",
        pixelId: "uint8",
      },
      valueSchema: {
        r: "uint8",
        g: "uint8",
        b: "uint8",
        a: "uint8",
      },
    },

    PixelAddress: {
      keySchema: {
        landId: "uint8",
        pixelId: "uint8",
      },
      valueSchema: {
        address: "address",
      },
    },

    PixelAddressConnection: {
      keySchema: {
        landId: "uint8",
        pixelId: "uint8",
      },
      valueSchema: {
        connectedLandId: "uint8",
        connectedPixelId: "uint8",
      },
    },

    AddressInfo: {
      keySchema: {
        address: "address",
      },
      valueSchema: {
        mainCategory: "string",
        subCategory: "string",
        name: "string",
        description: "string",
      },
    },

    AddressBoard: {
      keySchema: {
        address: "address",
      },
      valueSchema: {
        chat: "bytes32", // convert string to bytes32 to store
      },
    },
  },
});