# https://www.cairo-lang.org/docs/hello_cairo/intro.html#product-exercise

%builtins output

from starkware.cairo.common.alloc import alloc
from starkware.cairo.common.serialize import serialize_word

func array_prod_even(arr : felt*, size) -> (prod : felt):
    if size == 0:
        return (prod=1)
    end

    let (prod_of_rest) = array_prod_even(arr = arr + 2, size = size - 2)
    return (prod = [arr] * prod_of_rest)
end

func main{output_ptr : felt*}():
    const ARRAY_SIZE = 6

    # Allocate an array.
    let (ptr) = alloc()

    # Populate some values in the array.
    assert [ptr] = 1
    assert [ptr + 1] = 2
    assert [ptr + 2] = 3
    assert [ptr + 3] = 4
    assert [ptr + 4] = 5
    assert [ptr + 5] = 6

    # Call array_prod_even to compute the product of the even index elements.
    let (prod) = array_prod_even(arr=ptr, size=ARRAY_SIZE)

    # Check answer
    assert prod = 15

    # Write the sum to the program output.
    serialize_word(prod)

    return ()
end