import zk_bitwise_stack_v0_0_5.aleo;

program zk_deck_shuffle_v0_0_1.aleo {

    struct Stack {
        capacity: u16,
        top: u16,
        member_size: u16,
        s00: [field; 26],
        s01: [field; 26],
    }

    function shuffle_logic(n: i8, i: i8, index: u8) -> bool {
        if i < n {
            return true;
        }
        if (i - n) % 2i8 == 0i8 {
            return false;
        }
        return index <= 25u8;
    }

    function setup_shuffle(element: i8, deck: [[field; 26]; 2]) -> (i8, [field; 26], [field; 26]) {
        let n: i8 = element.abs();
        if (element < 0i8) {
            return (n, deck[0u8], deck[1u8]);
        } else {
            return (n, deck[1u8], deck[0u8]);
        }
    }

    transition shuffle_deck(n: i8, member_size: u16, deck: [[field; 26]; 2]) -> [[field; 26]; 2] {
        assert(member_size >  0u16);
        assert(member_size <= 128u16);
        assert(member_size % 8u16 == 0u16);
        let setup_result: (i8, [field; 26], [field; 26]) = setup_shuffle(n, deck);
        n = setup_result.0;
        assert(n >= 1i8);
        assert(n <= 26i8);
        let a: [field; 26] = setup_result.1;
        let b: [field; 26] = setup_result.2;
        let a_stack: Stack = zk_bitwise_stack_v0_0_5.aleo/initialize_stack(member_size);
        let b_stack: Stack = zk_bitwise_stack_v0_0_5.aleo/initialize_stack(member_size);
        let shuffled_stack: Stack = zk_bitwise_stack_v0_0_5.aleo/initialize_stack(member_size);
        a_stack = zk_bitwise_stack_v0_0_5.aleo/do_push(a[0u8], a_stack);
        b_stack = zk_bitwise_stack_v0_0_5.aleo/do_push(b[0u8], b_stack);
        a_stack = zk_bitwise_stack_v0_0_5.aleo/do_push(a[1u8], a_stack);
        b_stack = zk_bitwise_stack_v0_0_5.aleo/do_push(b[1u8], b_stack);
        a_stack = zk_bitwise_stack_v0_0_5.aleo/do_push(a[2u8], a_stack);
        b_stack = zk_bitwise_stack_v0_0_5.aleo/do_push(b[2u8], b_stack);
        a_stack = zk_bitwise_stack_v0_0_5.aleo/do_push(a[3u8], a_stack);
        b_stack = zk_bitwise_stack_v0_0_5.aleo/do_push(b[3u8], b_stack);
        a_stack = zk_bitwise_stack_v0_0_5.aleo/do_push(a[4u8], a_stack);
        b_stack = zk_bitwise_stack_v0_0_5.aleo/do_push(b[4u8], b_stack);
        a_stack = zk_bitwise_stack_v0_0_5.aleo/do_push(a[5u8], a_stack);
        b_stack = zk_bitwise_stack_v0_0_5.aleo/do_push(b[5u8], b_stack);
        a_stack = zk_bitwise_stack_v0_0_5.aleo/do_push(a[6u8], a_stack);
        b_stack = zk_bitwise_stack_v0_0_5.aleo/do_push(b[6u8], b_stack);
        a_stack = zk_bitwise_stack_v0_0_5.aleo/do_push(a[7u8], a_stack);
        b_stack = zk_bitwise_stack_v0_0_5.aleo/do_push(b[7u8], b_stack);
        a_stack = zk_bitwise_stack_v0_0_5.aleo/do_push(a[8u8], a_stack);
        b_stack = zk_bitwise_stack_v0_0_5.aleo/do_push(b[8u8], b_stack);
        a_stack = zk_bitwise_stack_v0_0_5.aleo/do_push(a[9u8], a_stack);
        b_stack = zk_bitwise_stack_v0_0_5.aleo/do_push(b[9u8], b_stack);
        a_stack = zk_bitwise_stack_v0_0_5.aleo/do_push(a[10u8], a_stack);
        b_stack = zk_bitwise_stack_v0_0_5.aleo/do_push(b[10u8], b_stack);
        a_stack = zk_bitwise_stack_v0_0_5.aleo/do_push(a[11u8], a_stack);
        b_stack = zk_bitwise_stack_v0_0_5.aleo/do_push(b[11u8], b_stack);
        a_stack = zk_bitwise_stack_v0_0_5.aleo/do_push(a[12u8], a_stack);
        b_stack = zk_bitwise_stack_v0_0_5.aleo/do_push(b[12u8], b_stack);
        a_stack = zk_bitwise_stack_v0_0_5.aleo/do_push(a[13u8], a_stack);
        b_stack = zk_bitwise_stack_v0_0_5.aleo/do_push(b[13u8], b_stack);
        a_stack = zk_bitwise_stack_v0_0_5.aleo/do_push(a[14u8], a_stack);
        b_stack = zk_bitwise_stack_v0_0_5.aleo/do_push(b[14u8], b_stack);
        a_stack = zk_bitwise_stack_v0_0_5.aleo/do_push(a[15u8], a_stack);
        b_stack = zk_bitwise_stack_v0_0_5.aleo/do_push(b[15u8], b_stack);
        a_stack = zk_bitwise_stack_v0_0_5.aleo/do_push(a[16u8], a_stack);
        b_stack = zk_bitwise_stack_v0_0_5.aleo/do_push(b[16u8], b_stack);
        a_stack = zk_bitwise_stack_v0_0_5.aleo/do_push(a[17u8], a_stack);
        b_stack = zk_bitwise_stack_v0_0_5.aleo/do_push(b[17u8], b_stack);
        a_stack = zk_bitwise_stack_v0_0_5.aleo/do_push(a[18u8], a_stack);
        b_stack = zk_bitwise_stack_v0_0_5.aleo/do_push(b[18u8], b_stack);
        a_stack = zk_bitwise_stack_v0_0_5.aleo/do_push(a[19u8], a_stack);
        b_stack = zk_bitwise_stack_v0_0_5.aleo/do_push(b[19u8], b_stack);
        a_stack = zk_bitwise_stack_v0_0_5.aleo/do_push(a[20u8], a_stack);
        b_stack = zk_bitwise_stack_v0_0_5.aleo/do_push(b[20u8], b_stack);
        a_stack = zk_bitwise_stack_v0_0_5.aleo/do_push(a[21u8], a_stack);
        b_stack = zk_bitwise_stack_v0_0_5.aleo/do_push(b[21u8], b_stack);
        a_stack = zk_bitwise_stack_v0_0_5.aleo/do_push(a[22u8], a_stack);
        b_stack = zk_bitwise_stack_v0_0_5.aleo/do_push(b[22u8], b_stack);
        a_stack = zk_bitwise_stack_v0_0_5.aleo/do_push(a[23u8], a_stack);
        b_stack = zk_bitwise_stack_v0_0_5.aleo/do_push(b[23u8], b_stack);
        a_stack = zk_bitwise_stack_v0_0_5.aleo/do_push(a[24u8], a_stack);
        b_stack = zk_bitwise_stack_v0_0_5.aleo/do_push(b[24u8], b_stack);
        a_stack = zk_bitwise_stack_v0_0_5.aleo/do_push(a[25u8], a_stack);
        b_stack = zk_bitwise_stack_v0_0_5.aleo/do_push(b[25u8], b_stack);
        let stack_operation: Stack = zk_bitwise_stack_v0_0_5.aleo/initialize_stack(member_size);
        let index: u8 = 0u8;
        for i: i8 in 0i8..52i8 {
            let use_b: bool = shuffle_logic(n, i, index);
            if use_b {
                stack_operation =  b_stack;
            }
            else {
                stack_operation =  a_stack;
            }
            let op: (field, Stack) = zk_bitwise_stack_v0_0_5.aleo/do_pop(stack_operation);
            if use_b { 
                b_stack = op.1;
            } else { 
                a_stack = op.1; 
            }
            let value: field = op.0;

            shuffled_stack = zk_bitwise_stack_v0_0_5.aleo/do_push(value, shuffled_stack);
            if use_b {
                index += 1u8;
            }
        }
        assert(shuffled_stack.top == 52u16);
        let temp: (field, Stack) = zk_bitwise_stack_v0_0_5.aleo/do_pop(shuffled_stack);
        let t0: field = temp.0;
        shuffled_stack = temp.1;
        temp = zk_bitwise_stack_v0_0_5.aleo/do_pop(shuffled_stack);
        let t1: field = temp.0;
        shuffled_stack = temp.1;
        temp = zk_bitwise_stack_v0_0_5.aleo/do_pop(shuffled_stack);
        let t2: field = temp.0;
        shuffled_stack = temp.1;
        temp = zk_bitwise_stack_v0_0_5.aleo/do_pop(shuffled_stack);
        let t3: field = temp.0;
        shuffled_stack = temp.1;
        temp = zk_bitwise_stack_v0_0_5.aleo/do_pop(shuffled_stack);
        let t4: field = temp.0;
        shuffled_stack = temp.1;
        temp = zk_bitwise_stack_v0_0_5.aleo/do_pop(shuffled_stack);
        let t5: field = temp.0;
        shuffled_stack = temp.1;
        temp = zk_bitwise_stack_v0_0_5.aleo/do_pop(shuffled_stack);
        let t6: field = temp.0;
        shuffled_stack = temp.1;
        temp = zk_bitwise_stack_v0_0_5.aleo/do_pop(shuffled_stack);
        let t7: field = temp.0;
        shuffled_stack = temp.1;
        temp = zk_bitwise_stack_v0_0_5.aleo/do_pop(shuffled_stack);
        let t8: field = temp.0;
        shuffled_stack = temp.1;
        temp = zk_bitwise_stack_v0_0_5.aleo/do_pop(shuffled_stack);
        let t9: field = temp.0;
        shuffled_stack = temp.1;
        temp = zk_bitwise_stack_v0_0_5.aleo/do_pop(shuffled_stack);
        let t10: field = temp.0;
        shuffled_stack = temp.1;
        temp = zk_bitwise_stack_v0_0_5.aleo/do_pop(shuffled_stack);
        let t11: field = temp.0;
        shuffled_stack = temp.1;
        temp = zk_bitwise_stack_v0_0_5.aleo/do_pop(shuffled_stack);
        let t12: field = temp.0;
        shuffled_stack = temp.1;
        temp = zk_bitwise_stack_v0_0_5.aleo/do_pop(shuffled_stack);
        let t13: field = temp.0;
        shuffled_stack = temp.1;
        temp = zk_bitwise_stack_v0_0_5.aleo/do_pop(shuffled_stack);
        let t14: field = temp.0;
        shuffled_stack = temp.1;
        temp = zk_bitwise_stack_v0_0_5.aleo/do_pop(shuffled_stack);
        let t15: field = temp.0;
        shuffled_stack = temp.1;
        temp = zk_bitwise_stack_v0_0_5.aleo/do_pop(shuffled_stack);
        let t16: field = temp.0;
        shuffled_stack = temp.1;
        temp = zk_bitwise_stack_v0_0_5.aleo/do_pop(shuffled_stack);
        let t17: field = temp.0;
        shuffled_stack = temp.1;
        temp = zk_bitwise_stack_v0_0_5.aleo/do_pop(shuffled_stack);
        let t18: field = temp.0;
        shuffled_stack = temp.1;
        temp = zk_bitwise_stack_v0_0_5.aleo/do_pop(shuffled_stack);
        let t19: field = temp.0;
        shuffled_stack = temp.1;
        temp = zk_bitwise_stack_v0_0_5.aleo/do_pop(shuffled_stack);
        let t20: field = temp.0;
        shuffled_stack = temp.1;
        temp = zk_bitwise_stack_v0_0_5.aleo/do_pop(shuffled_stack);
        let t21: field = temp.0;
        shuffled_stack = temp.1;
        temp = zk_bitwise_stack_v0_0_5.aleo/do_pop(shuffled_stack);
        let t22: field = temp.0;
        shuffled_stack = temp.1;
        temp = zk_bitwise_stack_v0_0_5.aleo/do_pop(shuffled_stack);
        let t23: field = temp.0;
        shuffled_stack = temp.1;
        temp = zk_bitwise_stack_v0_0_5.aleo/do_pop(shuffled_stack);
        let t24: field = temp.0;
        shuffled_stack = temp.1;
        temp = zk_bitwise_stack_v0_0_5.aleo/do_pop(shuffled_stack);
        let t25: field = temp.0;
        shuffled_stack = temp.1;
        temp = zk_bitwise_stack_v0_0_5.aleo/do_pop(shuffled_stack);
        let t26: field = temp.0;
        shuffled_stack = temp.1;
        temp = zk_bitwise_stack_v0_0_5.aleo/do_pop(shuffled_stack);
        let t27: field = temp.0;
        shuffled_stack = temp.1;
        temp = zk_bitwise_stack_v0_0_5.aleo/do_pop(shuffled_stack);
        let t28: field = temp.0;
        shuffled_stack = temp.1;
        temp = zk_bitwise_stack_v0_0_5.aleo/do_pop(shuffled_stack);
        let t29: field = temp.0;
        shuffled_stack = temp.1;
        temp = zk_bitwise_stack_v0_0_5.aleo/do_pop(shuffled_stack);
        let t30: field = temp.0;
        shuffled_stack = temp.1;
        temp = zk_bitwise_stack_v0_0_5.aleo/do_pop(shuffled_stack);
        let t31: field = temp.0;
        shuffled_stack = temp.1;
        temp = zk_bitwise_stack_v0_0_5.aleo/do_pop(shuffled_stack);
        let t32: field = temp.0;
        shuffled_stack = temp.1;
        temp = zk_bitwise_stack_v0_0_5.aleo/do_pop(shuffled_stack);
        let t33: field = temp.0;
        shuffled_stack = temp.1;
        temp = zk_bitwise_stack_v0_0_5.aleo/do_pop(shuffled_stack);
        let t34: field = temp.0;
        shuffled_stack = temp.1;
        temp = zk_bitwise_stack_v0_0_5.aleo/do_pop(shuffled_stack);
        let t35: field = temp.0;
        shuffled_stack = temp.1;
        temp = zk_bitwise_stack_v0_0_5.aleo/do_pop(shuffled_stack);
        let t36: field = temp.0;
        shuffled_stack = temp.1;
        temp = zk_bitwise_stack_v0_0_5.aleo/do_pop(shuffled_stack);
        let t37: field = temp.0;
        shuffled_stack = temp.1;
        temp = zk_bitwise_stack_v0_0_5.aleo/do_pop(shuffled_stack);
        let t38: field = temp.0;
        shuffled_stack = temp.1;
        temp = zk_bitwise_stack_v0_0_5.aleo/do_pop(shuffled_stack);
        let t39: field = temp.0;
        shuffled_stack = temp.1;
        temp = zk_bitwise_stack_v0_0_5.aleo/do_pop(shuffled_stack);
        let t40: field = temp.0;
        shuffled_stack = temp.1;
        temp = zk_bitwise_stack_v0_0_5.aleo/do_pop(shuffled_stack);
        let t41: field = temp.0;
        shuffled_stack = temp.1;
        temp = zk_bitwise_stack_v0_0_5.aleo/do_pop(shuffled_stack);
        let t42: field = temp.0;
        shuffled_stack = temp.1;
        temp = zk_bitwise_stack_v0_0_5.aleo/do_pop(shuffled_stack);
        let t43: field = temp.0;
        shuffled_stack = temp.1;
        temp = zk_bitwise_stack_v0_0_5.aleo/do_pop(shuffled_stack);
        let t44: field = temp.0;
        shuffled_stack = temp.1;
        temp = zk_bitwise_stack_v0_0_5.aleo/do_pop(shuffled_stack);
        let t45: field = temp.0;
        shuffled_stack = temp.1;
        temp = zk_bitwise_stack_v0_0_5.aleo/do_pop(shuffled_stack);
        let t46: field = temp.0;
        shuffled_stack = temp.1;
        temp = zk_bitwise_stack_v0_0_5.aleo/do_pop(shuffled_stack);
        let t47: field = temp.0;
        shuffled_stack = temp.1;
        temp = zk_bitwise_stack_v0_0_5.aleo/do_pop(shuffled_stack);
        let t48: field = temp.0;
        shuffled_stack = temp.1;
        temp = zk_bitwise_stack_v0_0_5.aleo/do_pop(shuffled_stack);
        let t49: field = temp.0;
        shuffled_stack = temp.1;
        temp = zk_bitwise_stack_v0_0_5.aleo/do_pop(shuffled_stack);
        let t50: field = temp.0;
        shuffled_stack = temp.1;
        temp = zk_bitwise_stack_v0_0_5.aleo/do_pop(shuffled_stack);
        let t51: field = temp.0;
        shuffled_stack = temp.1;

        return [[t0, t1, t2, t3, t4, t5, t6, t7, t8, t9, t10, t11, t12, t13, t14, t15, t16, t17, t18, t19, t20, t21, t22, t23, t24, t25],
                [t26, t27, t28, t29, t30, t31, t32, t33, t34, t35, t36, t37, t38, t39, t40, t41, t42, t43, t44, t45, t46, t47, t48, t49, t50, t51]];
    }
}