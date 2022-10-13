module ditto_interface::ditto_interface {
    use ditto_staking::ditto_staking;

    public entry fun stake_to_ditto(user: &signer, amount: u64) {
        ditto_staking::stake_aptos(user, amount);
    }
}