#[aztec::macros::aztec]
pub contract Train {
    use aztec::{
        macros::{functions::{initializer, public}, storage::storage},
        protocol_types::{address::AztecAddress, traits::{Deserialize, Packable, Serialize}},
        state_vars::{map::Map, SharedMutable},
    };

    #[derive(Eq, Packable, Serialize, Deserialize)]
    pub struct HTLC_Public {
        src_receiver: AztecAddress,
        // Note: if the fields below are commented out, the contract will compile.
        amount: u128,
    }

    #[public]
    #[initializer]
    fn constructor() {}

    #[storage]
    struct Storage<Context> {
        contracts_public: Map<Field, SharedMutable<HTLC_Public, 180, Context>, Context>,
    }

}
