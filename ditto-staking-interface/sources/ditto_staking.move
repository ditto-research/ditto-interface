module ditto_staking::ditto_staking {
    use aptos_framework::aptos_coin::AptosCoin;
    use aptos_framework::coin;

    use ditto_staking::staked_coin::StakedAptos;

    public entry fun stake_aptos(_user: &signer, _amount: u64) {}

    public entry fun instant_unstake(_user: &signer, _amount: u64) {}

    public entry fun delayed_unstake(_user: &signer, _amount: u64) {}

    public entry fun claim_aptos(_user: &signer) {}


    public fun exchange_aptos(aptos: coin::Coin<AptosCoin>): coin::Coin<StakedAptos> {
        coin::destroy_zero(aptos);
        coin::zero<StakedAptos>()
    }

    public fun exchange_staptos(staptos: coin::Coin<StakedAptos>): coin::Coin<AptosCoin> {
        coin::destroy_zero(staptos);
        coin::zero<AptosCoin>()
    }

    public fun delayed_exchange_staptos(staptos: coin::Coin<StakedAptos>, _user_addr: address) {
        coin::destroy_zero(staptos);
    }

    public fun claim_queued_aptos(_user: &signer): coin::Coin<AptosCoin> {
        coin::zero<AptosCoin>()
    }
}