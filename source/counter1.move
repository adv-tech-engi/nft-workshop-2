module counter::counter{
    //struct

    public struct Counter has key{
        id: UID,
        owner: address,
        value: u64,
    }
    //Initialize function

    fun init (ctx: &mut TxContext){
        transfer::share_object(Counter{
            id: object::new(ctx),
            owner: ctx.sender(),
            value: 0,
        });
    }

    //increment function 
    entry fun increment (counter: &mut Counter) {
        counter.value = counter.value + 1;
    }

    //set value function
    entry fun set_value (counter: &mut Counter, val: u64, ctx: &TxContext){
        assert!(counter.owner == ctx.sender(), 0);
        counter.value = val;
    }

    //get value function
    public fun get_value (counter: &Counter) :u64 {
        counter.value
    }

}