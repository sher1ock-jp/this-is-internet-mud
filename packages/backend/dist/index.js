import { QueryParameter, DuneClient } from "@cowprotocol/ts-dune-client";
const { DUNE_API_KEY } = process.env;
const client = new DuneClient("IghFJglpn2OivF1H7I8BBIsvWujhzIdZ" !== null && "IghFJglpn2OivF1H7I8BBIsvWujhzIdZ" !== void 0 ? "IghFJglpn2OivF1H7I8BBIsvWujhzIdZ" : "");
const queryID = 2684341;
const parameters = [
    QueryParameter.text("Blockchain", "Ethereum"),
];
client
    .refresh(queryID, parameters)
    .then((executionResult) => { var _a; return console.log((_a = executionResult.result) === null || _a === void 0 ? void 0 : _a.rows); });
