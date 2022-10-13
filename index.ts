import * as aptos from "aptos";
import { EntryFunctionPayload } from "aptos/src/generated";

const CONTRACT_ADDRESS =
  "0x95a81e1d4db7829583cd27280e8f08ced8bd2d5c411a6c74aea84900b6c270b3";
const CLIENT = new aptos.AptosClient(
  "https://fullnode.devnet.aptoslabs.com/v1"
);
const USER = new aptos.AptosAccount(
  new aptos.HexString(
    "0x78553f1ad95f9108e6f9f3b28632bed94c3f01aff50e19ab7351d3fe2e3c4277"
  ).toUint8Array()
);
const DEFAULT_TXN_CONFIG = {
  maxGasAmount: 10000n,
  gasUnitPrice: 100n,
  txnExpirationOffset: 10n,
};

async function main() {
  const payload: EntryFunctionPayload = {
    function: `${CONTRACT_ADDRESS}::ditto_interface::stake_to_ditto`,
    arguments: [10000],
    type_arguments: [],
  };

  const address = USER.address();
  const txn = await CLIENT.generateTransaction(address, payload, {
    max_gas_amount: DEFAULT_TXN_CONFIG.maxGasAmount.toString(),
    gas_unit_price: DEFAULT_TXN_CONFIG.gasUnitPrice.toString(),
    expiration_timestamp_secs: (
      BigInt(Math.floor(Date.now() / 1000)) +
      DEFAULT_TXN_CONFIG.txnExpirationOffset
    ).toString(),
  });
  const signedTx = await CLIENT.signTransaction(USER, txn);
  const response = await CLIENT.submitTransaction(signedTx);
  console.log(response);
}

main();
