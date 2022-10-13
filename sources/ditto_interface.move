module ditto_interface::ditto_interface {
    use std::signer;

    use aptos_framework::aptos_coin::AptosCoin;
    use aptos_framework::coin;

    use ditto_staking::ditto_staking;
    use ditto_staking::staked_coin;

    public entry fun invoke_ditto_stake_aptos(user: &signer, amount: u64) {
        ditto_staking::stake_aptos(user, amount);
    }

    public entry fun invoke_ditto_instant_unstake(user: &signer, amount: u64) {
        ditto_staking::instant_unstake(user, amount);
    }

    public entry fun invoke_ditto_delayed_unstake(user: &signer, amount: u64) {
        ditto_staking::delayed_unstake(user, amount);
    }

    public entry fun invoke_ditto_claim_aptos(user: &signer) {
        ditto_staking::claim_aptos(user);
    }

    public entry fun invoke_ditto_exchange_aptos(user: &signer, amount: u64) {
        let user_addr = signer::address_of(user);

        if (!coin::is_account_registered<staked_coin::StakedAptos>(user_addr)) {
            staked_coin::register(user);
        };

        let coins = coin::withdraw<AptosCoin>(user, amount);
        let staked_coins = ditto_staking::exchange_aptos(coins);
        coin::deposit(user_addr, staked_coins);
    }

    public entry fun invoke_ditto_exchange_staptos(user: &signer, amount: u64) {
        let user_addr = signer::address_of(user);

        let staked_coin = coin::withdraw<staked_coin::StakedAptos>(user, amount);
        let unstaked_aptos = ditto_staking::exchange_staptos(staked_coin);
        coin::deposit(user_addr, unstaked_aptos);
    }

    public entry fun invoke_ditto_delayed_exchange_staptos(user: &signer, amount: u64) {
        let staked_coin = coin::withdraw<staked_coin::StakedAptos>(user, amount);
        let user_addr = signer::address_of(user);
        ditto_staking::delayed_exchange_staptos(staked_coin, user_addr);
    }

    public entry fun invoke_ditto_claim_queued_aptos(user: &signer) {
        coin::deposit(signer::address_of(user), ditto_staking::claim_queued_aptos(user));
    }
}