import dotenv from 'dotenv';
dotenv.config();
import { QueryParameter, DuneClient } from "@cowprotocol/ts-dune-client";
import express, { Express, Request, Response } from 'express';
import cors from 'cors';

const app: Express = express();
const port = process.env.PORT_DUNE;

app.use(cors());

app.get('/', (req: Request, res: Response) => {
    res.send('Express + TypeScript Server');
  });
  
app.listen(port, () => {
console.log(`⚡️[server]: Server is running at http://localhost:${port}`);
});
  

app.get('/executeDuneQuery', async (req: Request, res: Response) => {
    const client = new DuneClient(process.env.DUNE_API_KEY ?? "");
    const queryID = 2684341; 
    const parameters = [QueryParameter.text("Blockchain", "Ethereum")];
    try {
        const executionResult = await client.refresh(queryID, parameters);
        res.send(executionResult.result?.rows);
    } catch (e) {
        // res.status(500).send(e.message);
        const error = e as Error;
        console.error(error.message);
    }
});

// const client = new DuneClient(process.env.DUNE_API_KEY ?? "");
// const queryID = 2684341; 

// const parameters = [
//   QueryParameter.text("Blockchain", "Ethereum"), 
// ];

// client
//   .refresh(queryID, parameters)
//   .then((executionResult) => console.log(executionResult.result?.rows));