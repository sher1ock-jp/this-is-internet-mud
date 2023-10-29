import { mudConfig } from "@latticexyz/world/register";

export default mudConfig({
  tables: {
    ChainComponent: { // chain is a reserved word
      keySchema: {
        chainId: "uint16",
      },
      valueSchema: {
        // chainGasFee: "uint16",
        landCount: "uint8",
        chainName: "string",
        chainColor: "string",
      },
    },

    // Land: {
    //   keySchema: {
    //     chaindId: "uint16",
    //     landId: "uint8",
    //   },
    //   valueSchema: {
    //     pixelId: "uint8[]",
    //   },
    // },

    OffchainLand: {
      keySchema: {
        chainId: "uint16",
        landId: "uint8",
      },
      valueSchema: {
        pixelId: "uint8",
      },
      offchainOnly: true,
    },


    Pixel: {
      keySchema: {
        chainId: "uint16",
        landId: "uint8",
        pixelId: "uint8",// fetch as many squares as exist in front end and return only those that exist.
      },
      valueSchema: {
        pixelColor: "uint8",
        contractAddress: "address",
        connectedLandId: "uint8",
        connectedPixelId: "uint8",
        chainID: "uint16",
        landID: "uint8",
      },
    },

    AddressInfo: {
      keySchema: {
        contractAddress: "address",
      },
      valueSchema: {
        name: "string",
        description: "string",
      },
    },

    AddressBoard: {
      keySchema: {
        contractAddress: "address",
      },
      valueSchema: {
        chat: "bytes32", // convert string to bytes32 to store
      },
    },
  },
});