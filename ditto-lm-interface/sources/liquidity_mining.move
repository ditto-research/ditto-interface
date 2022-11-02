module liquidity_mining::liquidity_mining {

    // 1e12
    const ACC_REWARDS_PER_SHARE_FACTOR: u128 = 1000000000000;

    /// Errors
    const ERR_NOT_ADMIN: u64 = 100;

    const ERR_IS_NOT_COIN: u64 = 101;

    const ERR_MINE_EXISTS_FOR_COIN: u64 = 102;

    const ERR_MINE_DOESNT_EXIST_FOR_COIN: u64 = 103;

    const ERR_USER_HAS_NO_STAKE_DATA_FOR_MINE: u64 = 104;

    const ERR_USER_INSUFFICIENT_STAKED_AMOUNT: u64 = 105;

    const ERR_INVALID_REWARDS_RATE: u64 = 106;

    struct UserStakeData has key, store, drop {
        amount: u64,
        earnt_rewards: u64,
        claimed_rewards: u64,
        reward_debt: u64,
    }

    public entry fun stake<CoinType>(
        _user: &signer,
        _amount: u64,
    ) {}

    public entry fun unstake<CoinType>(
        _user: &signer,
        _amount: u64,
    ) {}

    public entry fun redeem<StakedCoin, RewardCoin>(_user: &signer) {}
}
