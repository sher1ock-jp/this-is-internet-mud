var _a;
import dotenv from 'dotenv';
dotenv.config();
import { QueryParameter, DuneClient } from "@cowprotocol/ts-dune-client";
const client = new DuneClient((_a = process.env.DUNE_API_KEY) !== null && _a !== void 0 ? _a : "");
const queryID = 2684341;
const parameters = [
    QueryParameter.text("Blockchain", "Ethereum"),
];
client
    .refresh(queryID, parameters)
    .then((executionResult) => { var _a; return console.log((_a = executionResult.result) === null || _a === void 0 ? void 0 : _a.rows); });
