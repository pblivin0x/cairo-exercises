%builtins output

from starkware.cairo.common.serialize import serialize_word

func main{output_ptr : felt*}():

    # The primitive type - field element (felt)
    serialize_word(6 / 3)       # 2 numerator is multiple of denominator, 6 / 3 = 2
    serialize_word(7 / 3)       # x that satisfies 3 * x = 7: 1206167596222043737899107594365023368541035738443865566657697352045290673496
    serialize_word((7 / 3) * 3) # 7 denominator * x = 3 * (7/3) = 7 = numerator
    return ()
end
