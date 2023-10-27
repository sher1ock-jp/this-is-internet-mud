import express, { Express, Request, Response } from 'express';
import dotenv from 'dotenv';
import cors from 'cors';
import Moralis from 'moralis';

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
      const { address, chain } = req.query;

      const response = await Moralis.EvmApi.transaction.getWalletTransactions({
          address: address as string,
          chain: chain as string,
      });

      if (response !== null) { 
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