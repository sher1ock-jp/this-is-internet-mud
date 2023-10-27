import express, { Express, Request, Response } from 'express';
import dotenv from 'dotenv';
import cors from 'cors';
import Moralis from 'moralis';
import { EvmChain } from "@moralisweb3/common-evm-utils";

dotenv.config();

const app: Express = express();
const port = process.env.PORT_MORALIS;

app.use(cors());

Moralis.start({ apiKey: process.env.MORALIS_API_KEY });

app.get('/', (req: Request, res: Response) => {
  res.send('Express + TypeScript Server');
});

app.listen(port, () => {
  console.log(`⚡️[server]: Server is running at http://localhost:${port}`);
});

app.get('/getAllTransactions', async (req: Request, res: Response) => {
  try {
      // const { address, chain } = req.query;
      // const address = process.env.WALLET_ADDRESS;

      // if (typeof address === 'string') {
      //   const response = await Moralis.EvmApi.resolve.resolveAddress({
      //     address,
      //   });
      const address = "0xd8da6bf26964af9d7eed9e03e53415d37aa96045";
      const chain: EvmChain = EvmChain.ETHEREUM;

      const response = await Moralis.EvmApi.transaction.getWalletTransactions({
          address,
          chain: chain as any,
      });

      if (response !== null) { // Check if response is not null
          const transaction = response.toJSON();
          console.log(transaction);
          res.send(transaction);
      } else {
          res.status(404).send('Transaction not found');
      }
  } catch (e: any) {
      res.status(500).send(e.message);
  }
});