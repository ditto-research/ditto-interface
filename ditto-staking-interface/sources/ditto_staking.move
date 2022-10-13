module ditto_staking::ditto_staking{
    use aptos_framework::aptos_coin::AptosCoin;
    use ditto_staking::staked_coin::StakedAptos;
    use aptos_framework::coin;

    public entry fun stake_aptos(_user: &signer, _amount: u64) {
    }

    public entry fun instant_unstake(_user: &signer, _amount: u64) {
    }

    public entry fun delayed_unstake(_user: &signer, _amount: u64)   {
    }

    public fun exchange_aptos(aptos: coin::Coin<AptosCoin>): coin::Coin<StakedAptos> {
        coin::destroy_zero(aptos);
        coin::zero<StakedAptos>()
    }

    public fun exchange_staptos(staptos: coin::Coin<StakedAptos>): coin::Coin<AptosCoin> {
        coin::destroy_zero(staptos);
        coin::zero<AptosCoin>()
    }
}