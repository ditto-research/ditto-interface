module liquidity_mining::rewarder {
    use aptos_framework::coin::{Coin, Self};

    friend liquidity_mining::liquidity_mining;

    const ERR_INVALID_ADMIN: u64 = 200;

    const ERR_REWARDER_EXISTS: u64 = 201;

    const ERR_REWARDER_DOESNT_EXIST: u64 = 202;

    public(friend) fun withdraw_reward<X, Y>(_amount: u64): Coin<Y> {
        coin::zero<Y>()
    }
}
