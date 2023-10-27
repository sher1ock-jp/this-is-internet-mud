import dotenv from 'dotenv';
dotenv.config();
import { QueryParameter, DuneClient } from "@cowprotocol/ts-dune-client";

const client = new DuneClient(process.env.DUNE_API_KEY ?? "");
const queryID = 2684341; 

const parameters = [
  QueryParameter.text("Blockchain", "Ethereum"), 
];

client
  .refresh(queryID, parameters)
  .then((executionResult) => console.log(executionResult.result?.rows));
