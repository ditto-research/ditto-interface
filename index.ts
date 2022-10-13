import * as aptos from "aptos";
import { EntryFunctionPayload } from "aptos/src/generated";

const CONTRACT_ADDRESS =
  "0x498ec0b8914eb9fdecf0a037a75049a6ddfc5a82d1c39ec2315b0716c0d40a98";
const CLIENT = new aptos.AptosClient(
  "https://fullnode.devnet.aptoslabs.com/v1"
);
const USER = new aptos.AptosAccount(
  new aptos.HexString(
    "0xd4710c3c92a9fd7681fd8f5579fa5e619255f20c11841c4d9e94fbc60bc124f8"
  ).toUint8Array()
);
const DEFAULT_TXN_CONFIG = {
  maxGasAmount: 10000n,
  gasUnitPrice: 100n,
  txnExpirationOffset: 10n,
};

async function main() {
  let payload: EntryFunctionPayload = {
    function: `${CONTRACT_ADDRESS}::ditto_interface::invoke_ditto_stake_aptos`,
    arguments: [10000],
    type_arguments: [],
  };

  let address = USER.address();
  let txn = await CLIENT.generateTransaction(address, payload, {
    max_gas_amount: DEFAULT_TXN_CONFIG.maxGasAmount.toString(),
    gas_unit_price: DEFAULT_TXN_CONFIG.gasUnitPrice.toString(),
    expiration_timestamp_secs: (
      BigInt(Math.floor(Date.now() / 1000)) +
      DEFAULT_TXN_CONFIG.txnExpirationOffset
    ).toString(),
  });
  let signedTx = await CLIENT.signTransaction(USER, txn);
  let response = await CLIENT.submitTransaction(signedTx);
  await CLIENT.waitForTransaction(response.hash);
  let txnInfo: aptos.Types.Transaction;
  try {
    txnInfo = await CLIENT.getTransactionByHash(response.hash);
  } catch (e) {
    throw Error("Transaction hash can't be found.");
  }
  console.log(txnInfo.hash, (txnInfo as any).vm_status);

  payload = {
    function: `${CONTRACT_ADDRESS}::ditto_interface::invoke_ditto_instant_unstake`,
    arguments: [10000],
    type_arguments: [],
  };

  address = USER.address();
  txn = await CLIENT.generateTransaction(address, payload, {
    max_gas_amount: DEFAULT_TXN_CONFIG.maxGasAmount.toString(),
    gas_unit_price: DEFAULT_TXN_CONFIG.gasUnitPrice.toString(),
    expiration_timestamp_secs: (
      BigInt(Math.floor(Date.now() / 1000)) +
      DEFAULT_TXN_CONFIG.txnExpirationOffset
    ).toString(),
  });
  signedTx = await CLIENT.signTransaction(USER, txn);
  response = await CLIENT.submitTransaction(signedTx);
  await CLIENT.waitForTransaction(response.hash);
  try {
    txnInfo = await CLIENT.getTransactionByHash(response.hash);
  } catch (e) {
    throw Error("Transaction hash can't be found.");
  }
  console.log(txnInfo.hash, (txnInfo as any).vm_status);

  payload = {
    function: `${CONTRACT_ADDRESS}::ditto_interface::invoke_ditto_delayed_unstake`,
    arguments: [10000],
    type_arguments: [],
  };

  address = USER.address();
  txn = await CLIENT.generateTransaction(address, payload, {
    max_gas_amount: DEFAULT_TXN_CONFIG.maxGasAmount.toString(),
    gas_unit_price: DEFAULT_TXN_CONFIG.gasUnitPrice.toString(),
    expiration_timestamp_secs: (
      BigInt(Math.floor(Date.now() / 1000)) +
      DEFAULT_TXN_CONFIG.txnExpirationOffset
    ).toString(),
  });
  signedTx = await CLIENT.signTransaction(USER, txn);
  response = await CLIENT.submitTransaction(signedTx);
  await CLIENT.waitForTransaction(response.hash);
  try {
    txnInfo = await CLIENT.getTransactionByHash(response.hash);
  } catch (e) {
    throw Error("Transaction hash can't be found.");
  }
  console.log(txnInfo.hash, (txnInfo as any).vm_status);

  payload = {
    function: `${CONTRACT_ADDRESS}::ditto_interface::invoke_ditto_exchange_aptos`,
    arguments: [15000],
    type_arguments: [],
  };

  address = USER.address();
  txn = await CLIENT.generateTransaction(address, payload, {
    max_gas_amount: DEFAULT_TXN_CONFIG.maxGasAmount.toString(),
    gas_unit_price: DEFAULT_TXN_CONFIG.gasUnitPrice.toString(),
    expiration_timestamp_secs: (
      BigInt(Math.floor(Date.now() / 1000)) +
      DEFAULT_TXN_CONFIG.txnExpirationOffset
    ).toString(),
  });
  signedTx = await CLIENT.signTransaction(USER, txn);
  response = await CLIENT.submitTransaction(signedTx);
  await CLIENT.waitForTransaction(response.hash);
  try {
    txnInfo = await CLIENT.getTransactionByHash(response.hash);
  } catch (e) {
    throw Error("Transaction hash can't be found.");
  }
  console.log(txnInfo.hash, (txnInfo as any).vm_status);
}

main();
