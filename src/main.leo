import zk_bitwise_stack_v0_0_2.leo;

program zk_deck_shuffle_v0_0_1.aleo {

    function shuffle_logic(n: i8, i: i8, index: u8) -> bool {
        if i < n {
            return true;
        }
        if (i - n) % 2i8 == 0i8 {
            return false;
        }
        return index <= 25u8;
    }

    transition setup_shuffle(element: i8, deck: [[u128; 26]; 2]) -> (i8, [u128; 26], [u128; 26]) {
        let n: i8 = element.abs();
        if (element < 0i8) {
            return (n, deck[0u8], deck[1u8]);
        } else {
            return (n, deck[1u8], deck[0u8]);
        }
    }

    transition shuffle_deck(n: i8, member_size: u16, a: [u128; 26], b: [u128; 26]) -> [[u128; 26]; 2] {
        assert(member_size >  0u16);
        assert(member_size <= 128u16);
        assert(member_size % 8u16 == 0u16);
        assert(n >= 1i8);
        assert(n <= 26i8);
        let empty_half: [u128; 26] = [0u128, 0u128, 0u128, 0u128, 0u128, 0u128, 0u128, 0u128, 0u128, 0u128, 0u128, 0u128, 0u128, 0u128, 0u128, 0u128, 0u128, 0u128, 0u128, 0u128, 0u128, 0u128, 0u128, 0u128, 0u128, 0u128];
        let capacity: u16 = 6656u16 / member_size;
        let top: u16 = 0u16;
        let index: u8 = 0u8;
        let a_stack: (u128, u16, u16, u16, [u128; 26], [u128; 26]) = (0u128, capacity, top, member_size, empty_half, empty_half);
        let b_stack: (u128, u16, u16, u16, [u128; 26], [u128; 26]) = (0u128, capacity, top, member_size, empty_half, empty_half);
        let shuffled_stack: (u128, u16, u16, u16, [u128; 26], [u128; 26]) = (0u128, capacity, top, member_size, empty_half, empty_half);
        a_stack = zk_bitwise_stack_v0_0_2.leo/push(a[0u8], a_stack.1, a_stack.2, a_stack.3, a_stack.4, a_stack.5);
        b_stack = zk_bitwise_stack_v0_0_2.leo/push(b[0u8], b_stack.1, b_stack.2, b_stack.3, b_stack.4, b_stack.5);
        a_stack = zk_bitwise_stack_v0_0_2.leo/push(a[1u8], a_stack.1, a_stack.2, a_stack.3, a_stack.4, a_stack.5);
        b_stack = zk_bitwise_stack_v0_0_2.leo/push(b[1u8], b_stack.1, b_stack.2, b_stack.3, b_stack.4, b_stack.5);
        a_stack = zk_bitwise_stack_v0_0_2.leo/push(a[2u8], a_stack.1, a_stack.2, a_stack.3, a_stack.4, a_stack.5);
        b_stack = zk_bitwise_stack_v0_0_2.leo/push(b[2u8], b_stack.1, b_stack.2, b_stack.3, b_stack.4, b_stack.5);
        a_stack = zk_bitwise_stack_v0_0_2.leo/push(a[3u8], a_stack.1, a_stack.2, a_stack.3, a_stack.4, a_stack.5);
        b_stack = zk_bitwise_stack_v0_0_2.leo/push(b[3u8], b_stack.1, b_stack.2, b_stack.3, b_stack.4, b_stack.5);
        a_stack = zk_bitwise_stack_v0_0_2.leo/push(a[4u8], a_stack.1, a_stack.2, a_stack.3, a_stack.4, a_stack.5);
        b_stack = zk_bitwise_stack_v0_0_2.leo/push(b[4u8], b_stack.1, b_stack.2, b_stack.3, b_stack.4, b_stack.5);
        a_stack = zk_bitwise_stack_v0_0_2.leo/push(a[5u8], a_stack.1, a_stack.2, a_stack.3, a_stack.4, a_stack.5);
        b_stack = zk_bitwise_stack_v0_0_2.leo/push(b[5u8], b_stack.1, b_stack.2, b_stack.3, b_stack.4, b_stack.5);
        a_stack = zk_bitwise_stack_v0_0_2.leo/push(a[6u8], a_stack.1, a_stack.2, a_stack.3, a_stack.4, a_stack.5);
        b_stack = zk_bitwise_stack_v0_0_2.leo/push(b[6u8], b_stack.1, b_stack.2, b_stack.3, b_stack.4, b_stack.5);
        a_stack = zk_bitwise_stack_v0_0_2.leo/push(a[7u8], a_stack.1, a_stack.2, a_stack.3, a_stack.4, a_stack.5);
        b_stack = zk_bitwise_stack_v0_0_2.leo/push(b[7u8], b_stack.1, b_stack.2, b_stack.3, b_stack.4, b_stack.5);
        a_stack = zk_bitwise_stack_v0_0_2.leo/push(a[8u8], a_stack.1, a_stack.2, a_stack.3, a_stack.4, a_stack.5);
        b_stack = zk_bitwise_stack_v0_0_2.leo/push(b[8u8], b_stack.1, b_stack.2, b_stack.3, b_stack.4, b_stack.5);
        a_stack = zk_bitwise_stack_v0_0_2.leo/push(a[9u8], a_stack.1, a_stack.2, a_stack.3, a_stack.4, a_stack.5);
        b_stack = zk_bitwise_stack_v0_0_2.leo/push(b[9u8], b_stack.1, b_stack.2, b_stack.3, b_stack.4, b_stack.5);
        a_stack = zk_bitwise_stack_v0_0_2.leo/push(a[10u8], a_stack.1, a_stack.2, a_stack.3, a_stack.4, a_stack.5);
        b_stack = zk_bitwise_stack_v0_0_2.leo/push(b[10u8], b_stack.1, b_stack.2, b_stack.3, b_stack.4, b_stack.5);
        a_stack = zk_bitwise_stack_v0_0_2.leo/push(a[11u8], a_stack.1, a_stack.2, a_stack.3, a_stack.4, a_stack.5);
        b_stack = zk_bitwise_stack_v0_0_2.leo/push(b[11u8], b_stack.1, b_stack.2, b_stack.3, b_stack.4, b_stack.5);
        a_stack = zk_bitwise_stack_v0_0_2.leo/push(a[12u8], a_stack.1, a_stack.2, a_stack.3, a_stack.4, a_stack.5);
        b_stack = zk_bitwise_stack_v0_0_2.leo/push(b[12u8], b_stack.1, b_stack.2, b_stack.3, b_stack.4, b_stack.5);
        a_stack = zk_bitwise_stack_v0_0_2.leo/push(a[13u8], a_stack.1, a_stack.2, a_stack.3, a_stack.4, a_stack.5);
        b_stack = zk_bitwise_stack_v0_0_2.leo/push(b[13u8], b_stack.1, b_stack.2, b_stack.3, b_stack.4, b_stack.5);
        a_stack = zk_bitwise_stack_v0_0_2.leo/push(a[14u8], a_stack.1, a_stack.2, a_stack.3, a_stack.4, a_stack.5);
        b_stack = zk_bitwise_stack_v0_0_2.leo/push(b[14u8], b_stack.1, b_stack.2, b_stack.3, b_stack.4, b_stack.5);
        a_stack = zk_bitwise_stack_v0_0_2.leo/push(a[15u8], a_stack.1, a_stack.2, a_stack.3, a_stack.4, a_stack.5);
        b_stack = zk_bitwise_stack_v0_0_2.leo/push(b[15u8], b_stack.1, b_stack.2, b_stack.3, b_stack.4, b_stack.5);
        a_stack = zk_bitwise_stack_v0_0_2.leo/push(a[16u8], a_stack.1, a_stack.2, a_stack.3, a_stack.4, a_stack.5);
        b_stack = zk_bitwise_stack_v0_0_2.leo/push(b[16u8], b_stack.1, b_stack.2, b_stack.3, b_stack.4, b_stack.5);
        a_stack = zk_bitwise_stack_v0_0_2.leo/push(a[17u8], a_stack.1, a_stack.2, a_stack.3, a_stack.4, a_stack.5);
        b_stack = zk_bitwise_stack_v0_0_2.leo/push(b[17u8], b_stack.1, b_stack.2, b_stack.3, b_stack.4, b_stack.5);
        a_stack = zk_bitwise_stack_v0_0_2.leo/push(a[18u8], a_stack.1, a_stack.2, a_stack.3, a_stack.4, a_stack.5);
        b_stack = zk_bitwise_stack_v0_0_2.leo/push(b[18u8], b_stack.1, b_stack.2, b_stack.3, b_stack.4, b_stack.5);
        a_stack = zk_bitwise_stack_v0_0_2.leo/push(a[19u8], a_stack.1, a_stack.2, a_stack.3, a_stack.4, a_stack.5);
        b_stack = zk_bitwise_stack_v0_0_2.leo/push(b[19u8], b_stack.1, b_stack.2, b_stack.3, b_stack.4, b_stack.5);
        a_stack = zk_bitwise_stack_v0_0_2.leo/push(a[20u8], a_stack.1, a_stack.2, a_stack.3, a_stack.4, a_stack.5);
        b_stack = zk_bitwise_stack_v0_0_2.leo/push(b[20u8], b_stack.1, b_stack.2, b_stack.3, b_stack.4, b_stack.5);
        a_stack = zk_bitwise_stack_v0_0_2.leo/push(a[21u8], a_stack.1, a_stack.2, a_stack.3, a_stack.4, a_stack.5);
        b_stack = zk_bitwise_stack_v0_0_2.leo/push(b[21u8], b_stack.1, b_stack.2, b_stack.3, b_stack.4, b_stack.5);
        a_stack = zk_bitwise_stack_v0_0_2.leo/push(a[22u8], a_stack.1, a_stack.2, a_stack.3, a_stack.4, a_stack.5);
        b_stack = zk_bitwise_stack_v0_0_2.leo/push(b[22u8], b_stack.1, b_stack.2, b_stack.3, b_stack.4, b_stack.5);
        a_stack = zk_bitwise_stack_v0_0_2.leo/push(a[23u8], a_stack.1, a_stack.2, a_stack.3, a_stack.4, a_stack.5);
        b_stack = zk_bitwise_stack_v0_0_2.leo/push(b[23u8], b_stack.1, b_stack.2, b_stack.3, b_stack.4, b_stack.5);
        a_stack = zk_bitwise_stack_v0_0_2.leo/push(a[24u8], a_stack.1, a_stack.2, a_stack.3, a_stack.4, a_stack.5);
        b_stack = zk_bitwise_stack_v0_0_2.leo/push(b[24u8], b_stack.1, b_stack.2, b_stack.3, b_stack.4, b_stack.5);
        a_stack = zk_bitwise_stack_v0_0_2.leo/push(a[25u8], a_stack.1, a_stack.2, a_stack.3, a_stack.4, a_stack.5);
        b_stack = zk_bitwise_stack_v0_0_2.leo/push(b[25u8], b_stack.1, b_stack.2, b_stack.3, b_stack.4, b_stack.5);
        let stack_operation: (u128, u16, u16, u16, [u128; 26], [u128; 26]) = (0u128, 0u16, 0u16, 0u16, empty_half, empty_half);
        for i: i8 in 0i8..52i8 {
            let use_b: bool = shuffle_logic(n, i, index);
            if use_b {
                stack_operation =  b_stack;
            }
            else {
                stack_operation =  a_stack;
            }
            stack_operation = zk_bitwise_stack_v0_0_2.leo/pop(stack_operation.1, stack_operation.2, stack_operation.3, stack_operation.4, stack_operation.5);
            if use_b { 
                b_stack = stack_operation; 
            } else { 
                a_stack = stack_operation; 
            }
            let value: u128 = stack_operation.0;

            shuffled_stack = zk_bitwise_stack_v0_0_2.leo/push(value, shuffled_stack.1, shuffled_stack.2, shuffled_stack.3, shuffled_stack.4, shuffled_stack.5);
            if use_b {
                index += 1u8;
            }
        }
        assert(shuffled_stack.2 == 52u16);
        shuffled_stack = zk_bitwise_stack_v0_0_2.leo/pop(shuffled_stack.1, shuffled_stack.2, shuffled_stack.3, shuffled_stack.4, shuffled_stack.5);
        let t0: u128 = shuffled_stack.0;
        shuffled_stack = zk_bitwise_stack_v0_0_2.leo/pop(shuffled_stack.1, shuffled_stack.2, shuffled_stack.3, shuffled_stack.4, shuffled_stack.5);
        let t1: u128 = shuffled_stack.0;
        shuffled_stack = zk_bitwise_stack_v0_0_2.leo/pop(shuffled_stack.1, shuffled_stack.2, shuffled_stack.3, shuffled_stack.4, shuffled_stack.5);
        let t2: u128 = shuffled_stack.0;
        shuffled_stack = zk_bitwise_stack_v0_0_2.leo/pop(shuffled_stack.1, shuffled_stack.2, shuffled_stack.3, shuffled_stack.4, shuffled_stack.5);
        let t3: u128 = shuffled_stack.0;
        shuffled_stack = zk_bitwise_stack_v0_0_2.leo/pop(shuffled_stack.1, shuffled_stack.2, shuffled_stack.3, shuffled_stack.4, shuffled_stack.5);
        let t4: u128 = shuffled_stack.0;
        shuffled_stack = zk_bitwise_stack_v0_0_2.leo/pop(shuffled_stack.1, shuffled_stack.2, shuffled_stack.3, shuffled_stack.4, shuffled_stack.5);
        let t5: u128 = shuffled_stack.0;
        shuffled_stack = zk_bitwise_stack_v0_0_2.leo/pop(shuffled_stack.1, shuffled_stack.2, shuffled_stack.3, shuffled_stack.4, shuffled_stack.5);
        let t6: u128 = shuffled_stack.0;
        shuffled_stack = zk_bitwise_stack_v0_0_2.leo/pop(shuffled_stack.1, shuffled_stack.2, shuffled_stack.3, shuffled_stack.4, shuffled_stack.5);
        let t7: u128 = shuffled_stack.0;
        shuffled_stack = zk_bitwise_stack_v0_0_2.leo/pop(shuffled_stack.1, shuffled_stack.2, shuffled_stack.3, shuffled_stack.4, shuffled_stack.5);
        let t8: u128 = shuffled_stack.0;
        shuffled_stack = zk_bitwise_stack_v0_0_2.leo/pop(shuffled_stack.1, shuffled_stack.2, shuffled_stack.3, shuffled_stack.4, shuffled_stack.5);
        let t9: u128 = shuffled_stack.0;
        shuffled_stack = zk_bitwise_stack_v0_0_2.leo/pop(shuffled_stack.1, shuffled_stack.2, shuffled_stack.3, shuffled_stack.4, shuffled_stack.5);
        let t10: u128 = shuffled_stack.0;
        shuffled_stack = zk_bitwise_stack_v0_0_2.leo/pop(shuffled_stack.1, shuffled_stack.2, shuffled_stack.3, shuffled_stack.4, shuffled_stack.5);
        let t11: u128 = shuffled_stack.0;
        shuffled_stack = zk_bitwise_stack_v0_0_2.leo/pop(shuffled_stack.1, shuffled_stack.2, shuffled_stack.3, shuffled_stack.4, shuffled_stack.5);
        let t12: u128 = shuffled_stack.0;
        shuffled_stack = zk_bitwise_stack_v0_0_2.leo/pop(shuffled_stack.1, shuffled_stack.2, shuffled_stack.3, shuffled_stack.4, shuffled_stack.5);
        let t13: u128 = shuffled_stack.0;
        shuffled_stack = zk_bitwise_stack_v0_0_2.leo/pop(shuffled_stack.1, shuffled_stack.2, shuffled_stack.3, shuffled_stack.4, shuffled_stack.5);
        let t14: u128 = shuffled_stack.0;
        shuffled_stack = zk_bitwise_stack_v0_0_2.leo/pop(shuffled_stack.1, shuffled_stack.2, shuffled_stack.3, shuffled_stack.4, shuffled_stack.5);
        let t15: u128 = shuffled_stack.0;
        shuffled_stack = zk_bitwise_stack_v0_0_2.leo/pop(shuffled_stack.1, shuffled_stack.2, shuffled_stack.3, shuffled_stack.4, shuffled_stack.5);
        let t16: u128 = shuffled_stack.0;
        shuffled_stack = zk_bitwise_stack_v0_0_2.leo/pop(shuffled_stack.1, shuffled_stack.2, shuffled_stack.3, shuffled_stack.4, shuffled_stack.5);
        let t17: u128 = shuffled_stack.0;
        shuffled_stack = zk_bitwise_stack_v0_0_2.leo/pop(shuffled_stack.1, shuffled_stack.2, shuffled_stack.3, shuffled_stack.4, shuffled_stack.5);
        let t18: u128 = shuffled_stack.0;
        shuffled_stack = zk_bitwise_stack_v0_0_2.leo/pop(shuffled_stack.1, shuffled_stack.2, shuffled_stack.3, shuffled_stack.4, shuffled_stack.5);
        let t19: u128 = shuffled_stack.0;
        shuffled_stack = zk_bitwise_stack_v0_0_2.leo/pop(shuffled_stack.1, shuffled_stack.2, shuffled_stack.3, shuffled_stack.4, shuffled_stack.5);
        let t20: u128 = shuffled_stack.0;
        shuffled_stack = zk_bitwise_stack_v0_0_2.leo/pop(shuffled_stack.1, shuffled_stack.2, shuffled_stack.3, shuffled_stack.4, shuffled_stack.5);
        let t21: u128 = shuffled_stack.0;
        shuffled_stack = zk_bitwise_stack_v0_0_2.leo/pop(shuffled_stack.1, shuffled_stack.2, shuffled_stack.3, shuffled_stack.4, shuffled_stack.5);
        let t22: u128 = shuffled_stack.0;
        shuffled_stack = zk_bitwise_stack_v0_0_2.leo/pop(shuffled_stack.1, shuffled_stack.2, shuffled_stack.3, shuffled_stack.4, shuffled_stack.5);
        let t23: u128 = shuffled_stack.0;
        shuffled_stack = zk_bitwise_stack_v0_0_2.leo/pop(shuffled_stack.1, shuffled_stack.2, shuffled_stack.3, shuffled_stack.4, shuffled_stack.5);
        let t24: u128 = shuffled_stack.0;
        shuffled_stack = zk_bitwise_stack_v0_0_2.leo/pop(shuffled_stack.1, shuffled_stack.2, shuffled_stack.3, shuffled_stack.4, shuffled_stack.5);
        let t25: u128 = shuffled_stack.0;
        shuffled_stack = zk_bitwise_stack_v0_0_2.leo/pop(shuffled_stack.1, shuffled_stack.2, shuffled_stack.3, shuffled_stack.4, shuffled_stack.5);
        let t26: u128 = shuffled_stack.0;
        shuffled_stack = zk_bitwise_stack_v0_0_2.leo/pop(shuffled_stack.1, shuffled_stack.2, shuffled_stack.3, shuffled_stack.4, shuffled_stack.5);
        let t27: u128 = shuffled_stack.0;
        shuffled_stack = zk_bitwise_stack_v0_0_2.leo/pop(shuffled_stack.1, shuffled_stack.2, shuffled_stack.3, shuffled_stack.4, shuffled_stack.5);
        let t28: u128 = shuffled_stack.0;
        shuffled_stack = zk_bitwise_stack_v0_0_2.leo/pop(shuffled_stack.1, shuffled_stack.2, shuffled_stack.3, shuffled_stack.4, shuffled_stack.5);
        let t29: u128 = shuffled_stack.0;
        shuffled_stack = zk_bitwise_stack_v0_0_2.leo/pop(shuffled_stack.1, shuffled_stack.2, shuffled_stack.3, shuffled_stack.4, shuffled_stack.5);
        let t30: u128 = shuffled_stack.0;
        shuffled_stack = zk_bitwise_stack_v0_0_2.leo/pop(shuffled_stack.1, shuffled_stack.2, shuffled_stack.3, shuffled_stack.4, shuffled_stack.5);
        let t31: u128 = shuffled_stack.0;
        shuffled_stack = zk_bitwise_stack_v0_0_2.leo/pop(shuffled_stack.1, shuffled_stack.2, shuffled_stack.3, shuffled_stack.4, shuffled_stack.5);
        let t32: u128 = shuffled_stack.0;
        shuffled_stack = zk_bitwise_stack_v0_0_2.leo/pop(shuffled_stack.1, shuffled_stack.2, shuffled_stack.3, shuffled_stack.4, shuffled_stack.5);
        let t33: u128 = shuffled_stack.0;
        shuffled_stack = zk_bitwise_stack_v0_0_2.leo/pop(shuffled_stack.1, shuffled_stack.2, shuffled_stack.3, shuffled_stack.4, shuffled_stack.5);
        let t34: u128 = shuffled_stack.0;
        shuffled_stack = zk_bitwise_stack_v0_0_2.leo/pop(shuffled_stack.1, shuffled_stack.2, shuffled_stack.3, shuffled_stack.4, shuffled_stack.5);
        let t35: u128 = shuffled_stack.0;
        shuffled_stack = zk_bitwise_stack_v0_0_2.leo/pop(shuffled_stack.1, shuffled_stack.2, shuffled_stack.3, shuffled_stack.4, shuffled_stack.5);
        let t36: u128 = shuffled_stack.0;
        shuffled_stack = zk_bitwise_stack_v0_0_2.leo/pop(shuffled_stack.1, shuffled_stack.2, shuffled_stack.3, shuffled_stack.4, shuffled_stack.5);
        let t37: u128 = shuffled_stack.0;
        shuffled_stack = zk_bitwise_stack_v0_0_2.leo/pop(shuffled_stack.1, shuffled_stack.2, shuffled_stack.3, shuffled_stack.4, shuffled_stack.5);
        let t38: u128 = shuffled_stack.0;
        shuffled_stack = zk_bitwise_stack_v0_0_2.leo/pop(shuffled_stack.1, shuffled_stack.2, shuffled_stack.3, shuffled_stack.4, shuffled_stack.5);
        let t39: u128 = shuffled_stack.0;
        shuffled_stack = zk_bitwise_stack_v0_0_2.leo/pop(shuffled_stack.1, shuffled_stack.2, shuffled_stack.3, shuffled_stack.4, shuffled_stack.5);
        let t40: u128 = shuffled_stack.0;
        shuffled_stack = zk_bitwise_stack_v0_0_2.leo/pop(shuffled_stack.1, shuffled_stack.2, shuffled_stack.3, shuffled_stack.4, shuffled_stack.5);
        let t41: u128 = shuffled_stack.0;
        shuffled_stack = zk_bitwise_stack_v0_0_2.leo/pop(shuffled_stack.1, shuffled_stack.2, shuffled_stack.3, shuffled_stack.4, shuffled_stack.5);
        let t42: u128 = shuffled_stack.0;
        shuffled_stack = zk_bitwise_stack_v0_0_2.leo/pop(shuffled_stack.1, shuffled_stack.2, shuffled_stack.3, shuffled_stack.4, shuffled_stack.5);
        let t43: u128 = shuffled_stack.0;
        shuffled_stack = zk_bitwise_stack_v0_0_2.leo/pop(shuffled_stack.1, shuffled_stack.2, shuffled_stack.3, shuffled_stack.4, shuffled_stack.5);
        let t44: u128 = shuffled_stack.0;
        shuffled_stack = zk_bitwise_stack_v0_0_2.leo/pop(shuffled_stack.1, shuffled_stack.2, shuffled_stack.3, shuffled_stack.4, shuffled_stack.5);
        let t45: u128 = shuffled_stack.0;
        shuffled_stack = zk_bitwise_stack_v0_0_2.leo/pop(shuffled_stack.1, shuffled_stack.2, shuffled_stack.3, shuffled_stack.4, shuffled_stack.5);
        let t46: u128 = shuffled_stack.0;
        shuffled_stack = zk_bitwise_stack_v0_0_2.leo/pop(shuffled_stack.1, shuffled_stack.2, shuffled_stack.3, shuffled_stack.4, shuffled_stack.5);
        let t47: u128 = shuffled_stack.0;
        shuffled_stack = zk_bitwise_stack_v0_0_2.leo/pop(shuffled_stack.1, shuffled_stack.2, shuffled_stack.3, shuffled_stack.4, shuffled_stack.5);
        let t48: u128 = shuffled_stack.0;
        shuffled_stack = zk_bitwise_stack_v0_0_2.leo/pop(shuffled_stack.1, shuffled_stack.2, shuffled_stack.3, shuffled_stack.4, shuffled_stack.5);
        let t49: u128 = shuffled_stack.0;
        shuffled_stack = zk_bitwise_stack_v0_0_2.leo/pop(shuffled_stack.1, shuffled_stack.2, shuffled_stack.3, shuffled_stack.4, shuffled_stack.5);
        let t50: u128 = shuffled_stack.0;
        shuffled_stack = zk_bitwise_stack_v0_0_2.leo/pop(shuffled_stack.1, shuffled_stack.2, shuffled_stack.3, shuffled_stack.4, shuffled_stack.5);
        let t51: u128 = shuffled_stack.0;

        return [[t0, t1, t2, t3, t4, t5, t6, t7, t8, t9, t10, t11, t12, t13, t14, t15, t16, t17, t18, t19, t20, t21, t22, t23, t24, t25],
                [t26, t27, t28, t29, t30, t31, t32, t33, t34, t35, t36, t37, t38, t39, t40, t41, t42, t43, t44, t45, t46, t47, t48, t49, t50, t51]];
    }
}