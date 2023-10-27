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
    const chain_name = typeof req.query.chain_name === 'string' ? req.query.chain_name : undefined;

    if (!chain_name) {
        res.status(400).send('Missing or invalid chain_name parameter');
        return;
    }
    
    const parameters = [QueryParameter.text("Blockchain", chain_name)];

    try {
        const executionResult = await client.refresh(queryID, parameters);
        res.send(executionResult.result?.rows);
    } catch (e) {
        // res.status(500).send(e.message);
        const error = e as Error;
        console.error(error.message);
    }
});