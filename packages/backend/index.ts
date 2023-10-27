import { QueryParameter, DuneClient } from "@cowprotocol/ts-dune-client";
const { DUNE_API_KEY } = process.env;

const client = new DuneClient("IghFJglpn2OivF1H7I8BBIsvWujhzIdZ" ?? "");
const queryID = 2684341; 

const parameters = [
  QueryParameter.text("Blockchain", "Ethereum"), 
];

client
  .refresh(queryID, parameters)
  .then((executionResult) => console.log(executionResult.result?.rows));
