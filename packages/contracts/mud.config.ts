import { mudConfig } from "@latticexyz/world/register";

export default mudConfig({
  tables: {
    Chain: {
      keySchema: {
        chainId: "bytes32",
      },
      valueSchema: {
        // chainGasFee: "uint16",
        landId: "uint8[]",
        chainName: "string",
        chainColor: "string",
      },
    },

    Land: {
      keySchema: {
        chaindId: "bytes32",
        landId: "uint8",
      },
      valueSchema: {
        pixelId: "uint8[]",
      },
    },

    OffchainLand: {
      keySchema: {
        chaindId: "bytes32",
        landId: "uint8",
      },
      valueSchema: {
        pixelId: "uint8",
      },
      offchainOnly: true,
    },

    Pixel: {
      keySchema: {
        chaindId: "bytes32",
        landId: "uint8",
        pixelId: "uint8",
      },
      valueSchema: {
        pixelColor: "uint8",
        address: "address",
        connectedLandId: "uint8",
        connectedPixelId: "uint8",
      },
    },

    AddressInfo: {
      keySchema: {
        address: "address",
      },
      valueSchema: {
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