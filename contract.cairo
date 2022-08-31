%lang starknet

from starkware.cairo.common.cairo_builtins import HashBuiltin
from starkware.cairo.common.math import assert_not_zero

@event
func BalanceIncrease(current_balance : felt):
end

# Define a storage variable.
@storage_var
func balance() -> (res : felt):
end

# Increases the balance by the given amount.
@external
func increase_balance{syscall_ptr : felt*, pedersen_ptr : HashBuiltin*, range_check_ptr}(
    amount : felt
):
    with_attr error_message("can`t increase 0. got {amount}"):
        # check caller is cygnus admin, else revert
        assert_not_zero(amount)
    end

    let (res) = balance.read()

    balance.write(res + amountx)

    BalanceIncrease.emit(res+amount)

    return ()
end

# Returns the current balance.
@view
func get_balance{syscall_ptr : felt*, pedersen_ptr : HashBuiltin*, range_check_ptr}() -> (
    res : felt
):
    let (res) = balance.read()
    return (res=res)
end
