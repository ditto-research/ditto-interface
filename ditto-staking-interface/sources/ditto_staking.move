module ditto_staking::ditto_staking {
    use aptos_framework::aptos_coin::AptosCoin;
    use aptos_framework::coin;

    use ditto_staking::staked_coin::StakedAptos;

    /// Errors

    const ERR_NOT_DITTO_ADMIN: u64 = 100;

    const ERR_DITTO_POOL_ALREADY_INITIALIZED: u64 = 101;

    const ERR_DITTO_POOL_NOT_INITIALIZED: u64 = 102;

    const ERR_USER_HAS_NO_STAKED_APTOS_ACCOUNT: u64 = 103;

    const ERR_INSUFFICIENT_APTOS_BUFFER: u64 = 104;

    const ERR_INVALID_VALIDATOR_STATE: u64 = 105;

    const ERR_VALIDATOR_HAS_PENDING_INACTIVE: u64 = 106;

    const ERR_INVALID_UNSTAKE_AMOUNT: u64 = 107;

    const ERR_INVALID_UNSTAKE_STATE: u64 = 108;

    const ERR_USER_HAS_NO_CLAIM_STATE: u64 = 109;

    const ERR_USER_HAS_ZERO_CLAIMABLE_BALANCE: u64 = 110;

    const ERR_VALIDATOR_ALREADY_WHITELISTED: u64 = 111;

    const ERR_VALIDATOR_NOT_WHITELISTED: u64 = 112;

    const ERR_VALIDATOR_NOT_PART_OF_POOL: u64 = 113;

    const ERR_VALIDATOR_NOT_INACTIVE: u64 = 114;

    const ERR_ADMIN_NOT_ALLOWED: u64 = 115;

    const ERR_EXCEEDED_MAX_VALIDATORS: u64 = 116;

    const ERR_NO_VALIDATORS: u64 = 117;

    struct UserClaimState has store, copy, drop {
        available_claim: u64,
        pending_claim: u64,
    }

    public entry fun stake_aptos(_user: &signer, _amount: u64) {}

    public entry fun stake_aptos_with_id(_user: &signer, _amount: u64, _id: u8) {}

    public entry fun instant_unstake(_user: &signer, _amount: u64) {}

    public entry fun delayed_unstake(_user: &signer, _amount: u64) {}

    public entry fun claim_aptos(_user: &signer) {}

    public fun exchange_aptos(aptos: coin::Coin<AptosCoin>): coin::Coin<StakedAptos> {
        coin::destroy_zero(aptos);
        coin::zero<StakedAptos>()
    }

    public fun exchange_aptos_with_id(aptos: coin::Coin<AptosCoin>, _id: u8): coin::Coin<StakedAptos> {
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

    public fun get_ditto_pool_total_aptos(): u64  {
        0
    }

    public fun get_queued_aptos_for_buffer(): u64   {
        0
    }

    public fun get_aptos_buffer_amount(): u64   {
        0
    }

    public fun get_pending_stake_amount(): u64   {
        0
    }

    public fun get_treasury_amount(): u64   {
        0
    }

    public fun get_total_pending_claim(): u64   {
        0
    }

    public fun get_claim_pool_amount(): u64   {
        0
    }

    public fun get_user_claim_state(user: address): UserClaimState {
        UserClaimState {
            available_claim: 0,
            pending_claim: 0,
        }
    }
}