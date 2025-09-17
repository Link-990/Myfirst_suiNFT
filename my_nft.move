module my_nft::my_nft {
    use std::string::{Self, String};     
    use sui::object::{Self, UID};          
    use sui::tx_context::{Self, TxContext, sender}; 
    use sui::transfer;                       

               
    public struct MyNFT has key, store {
        id: UID,
        name: String,
        description: String,
        image_url: String,
    }

    fun init(ctx: &mut TxContext) {
        let my_nft = MyNFT {
            id: object::new(ctx),
            name: string::utf8(b"早川 NFT"),
            description: string::utf8(b"A sample NFT on Sui"),  
            image_url: string::utf8(b"https://img1.baidu.com/it/u=3231610420,3073805411&fm=253&fmt=auto&app=120&f=JPEG?w=500&h=500"),
        };
        transfer::transfer(my_nft, sender(ctx)); 
    }
}


