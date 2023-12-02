import zk_bitwise_stack_v0_0_1.leo;

program zk_deck_shuffle_v0_0_1.aleo {

    transition setup_shuffle(element: i8, deck: [[u128; 26]; 2]) -> (i8, [u128; 26], [u128; 26]) {
        let n: i8 = element.abs();
        if (element < 0i8) {
            return (n, deck[0u8], deck[1u8]);
        } else {
            return (n, deck[1u8], deck[0u8]);
        }
    }

    transition shuffle_deck(n: i8, member_size: u8, a: [u128; 26], b: [u128; 26]) -> [[u128; 26]; 2] {
        assert(n >= 1i8);
        assert(n <= 26i8);
        let max_size: u16 = member_size as u16;
        let capacity: u16 = 6656u16 / max_size;
        // Check for overflow
        assert(capacity > 0u16);
        assert(capacity <= 832u16);
        assert(member_size > 0u8);
        assert(member_size <= 128u8);
        assert_eq(member_size % 8u8, 0u8);
        let initial_stack: (u16, u16, u8, [u128; 26], [u128; 26]) = (capacity, 0u16, member_size, [0u128, 0u128, 0u128, 0u128, 0u128, 0u128,0u128, 0u128, 0u128, 0u128, 0u128, 0u128, 0u128,
                 0u128, 0u128, 0u128, 0u128, 0u128, 0u128, 0u128, 0u128, 0u128, 0u128, 0u128, 0u128, 0u128], [0u128, 0u128, 0u128, 0u128, 0u128, 0u128,0u128, 0u128, 0u128, 0u128, 0u128, 0u128, 0u128,
                 0u128, 0u128, 0u128, 0u128, 0u128, 0u128, 0u128, 0u128, 0u128, 0u128, 0u128, 0u128, 0u128]);
        let stack_a: (u16, u16, u8, [u128; 26], [u128; 26]) = initial_stack;
        let stack_b: (u16, u16, u8, [u128; 26], [u128; 26]) = initial_stack;
        let shuffled_stack: (u16, u16, u8, [u128; 26], [u128; 26]) = initial_stack;
        for i: u8 in 0u8..26u8 {
            stack_a = zk_bitwise_stack_v0_0_1.leo/push(a[i], stack_a.0, stack_a.1, stack_a.2, stack_a.3, stack_a.4);
        }
        for i: u8 in 0u8..26u8 {
            stack_b = zk_bitwise_stack_v0_0_1.leo/push(b[i], stack_b.0, stack_b.1, stack_b.2, stack_b.3, stack_b.4);
        }
        let a_index: u8 = 0u8;
        let b_index: u8 = 0u8;
        let value_paired_stack: (u128, u16, u16, u8, [u128; 26], [u128; 26]) = (0u128, initial_stack.0, initial_stack.1, initial_stack.2, initial_stack.3, initial_stack.4);
        for i: i8 in 0i8..52i8 {
            let use_b: bool = false;
            let use_a: bool = false;
            if (i < n) {
                use_b = true;
                b_index += 1u8;
            }
            else if (((i - n) % 2i8 == 0i8)) {
                use_a = true;
                a_index += 1u8;
            }
            else if (b_index <= 25u8) {
                use_b = true;
                b_index += 1u8;
            } else {
                use_a = true;
                a_index += 1u8;
            }
            assert(use_a && !use_b || !use_a && use_b);
            if (use_b) {
                value_paired_stack = zk_bitwise_stack_v0_0_1.leo/pop(stack_b.0, stack_b.1, stack_b.2, stack_b.3, stack_b.4);
                stack_b = (value_paired_stack.1, value_paired_stack.2, value_paired_stack.3, value_paired_stack.4, value_paired_stack.5);
                shuffled_stack = zk_bitwise_stack_v0_0_1.leo/push(value_paired_stack.0, shuffled_stack.0, shuffled_stack.1, shuffled_stack.2, shuffled_stack.3, shuffled_stack.4);
            }
            else {
                value_paired_stack = zk_bitwise_stack_v0_0_1.leo/pop(stack_a.0, stack_a.1, stack_a.2, stack_a.3, stack_a.4);
                stack_a = (value_paired_stack.1, value_paired_stack.2, value_paired_stack.3, value_paired_stack.4, value_paired_stack.5);
                shuffled_stack = zk_bitwise_stack_v0_0_1.leo/push(value_paired_stack.0, shuffled_stack.0, shuffled_stack.1, shuffled_stack.2, shuffled_stack.3, shuffled_stack.4);
            }
        }
        let interim_stack: (u128, u16, u16, u8, [u128; 26], [u128; 26]) = zk_bitwise_stack_v0_0_1.leo/pop(shuffled_stack.0, shuffled_stack.1, shuffled_stack.2, shuffled_stack.3, shuffled_stack.4);
        let t0: u128 = interim_stack.0;
        
        interim_stack = zk_bitwise_stack_v0_0_1.leo/pop(interim_stack.1, interim_stack.2, interim_stack.3, interim_stack.4, interim_stack.5);
        let t1: u128 = interim_stack.0;
        
        interim_stack = zk_bitwise_stack_v0_0_1.leo/pop(interim_stack.1, interim_stack.2, interim_stack.3, interim_stack.4, interim_stack.5);
        let t2: u128 = interim_stack.0;
        
        interim_stack = zk_bitwise_stack_v0_0_1.leo/pop(interim_stack.1, interim_stack.2, interim_stack.3, interim_stack.4, interim_stack.5);
        let t3: u128 = interim_stack.0;
        
        interim_stack = zk_bitwise_stack_v0_0_1.leo/pop(interim_stack.1, interim_stack.2, interim_stack.3, interim_stack.4, interim_stack.5);
        let t4: u128 = interim_stack.0;
        
        interim_stack = zk_bitwise_stack_v0_0_1.leo/pop(interim_stack.1, interim_stack.2, interim_stack.3, interim_stack.4, interim_stack.5);
        let t5: u128 = interim_stack.0;
        
        interim_stack = zk_bitwise_stack_v0_0_1.leo/pop(interim_stack.1, interim_stack.2, interim_stack.3, interim_stack.4, interim_stack.5);
        let t6: u128 = interim_stack.0;
        
        interim_stack = zk_bitwise_stack_v0_0_1.leo/pop(interim_stack.1, interim_stack.2, interim_stack.3, interim_stack.4, interim_stack.5);
        let t7: u128 = interim_stack.0;
        
        interim_stack = zk_bitwise_stack_v0_0_1.leo/pop(interim_stack.1, interim_stack.2, interim_stack.3, interim_stack.4, interim_stack.5);
        let t8: u128 = interim_stack.0;
        
        interim_stack = zk_bitwise_stack_v0_0_1.leo/pop(interim_stack.1, interim_stack.2, interim_stack.3, interim_stack.4, interim_stack.5);
        let t9: u128 = interim_stack.0;
        
        interim_stack = zk_bitwise_stack_v0_0_1.leo/pop(interim_stack.1, interim_stack.2, interim_stack.3, interim_stack.4, interim_stack.5);
        let t10: u128 = interim_stack.0;
        
        interim_stack = zk_bitwise_stack_v0_0_1.leo/pop(interim_stack.1, interim_stack.2, interim_stack.3, interim_stack.4, interim_stack.5);
        let t11: u128 = interim_stack.0;
        
        interim_stack = zk_bitwise_stack_v0_0_1.leo/pop(interim_stack.1, interim_stack.2, interim_stack.3, interim_stack.4, interim_stack.5);
        let t12: u128 = interim_stack.0;
        
        interim_stack = zk_bitwise_stack_v0_0_1.leo/pop(interim_stack.1, interim_stack.2, interim_stack.3, interim_stack.4, interim_stack.5);
        let t13: u128 = interim_stack.0;
        
        interim_stack = zk_bitwise_stack_v0_0_1.leo/pop(interim_stack.1, interim_stack.2, interim_stack.3, interim_stack.4, interim_stack.5);
        let t14: u128 = interim_stack.0;
        
        interim_stack = zk_bitwise_stack_v0_0_1.leo/pop(interim_stack.1, interim_stack.2, interim_stack.3, interim_stack.4, interim_stack.5);
        let t15: u128 = interim_stack.0;
        
        interim_stack = zk_bitwise_stack_v0_0_1.leo/pop(interim_stack.1, interim_stack.2, interim_stack.3, interim_stack.4, interim_stack.5);
        let t16: u128 = interim_stack.0;
        
        interim_stack = zk_bitwise_stack_v0_0_1.leo/pop(interim_stack.1, interim_stack.2, interim_stack.3, interim_stack.4, interim_stack.5);
        let t17: u128 = interim_stack.0;
        
        interim_stack = zk_bitwise_stack_v0_0_1.leo/pop(interim_stack.1, interim_stack.2, interim_stack.3, interim_stack.4, interim_stack.5);
        let t18: u128 = interim_stack.0;
        
        interim_stack = zk_bitwise_stack_v0_0_1.leo/pop(interim_stack.1, interim_stack.2, interim_stack.3, interim_stack.4, interim_stack.5);
        let t19: u128 = interim_stack.0;
        
        interim_stack = zk_bitwise_stack_v0_0_1.leo/pop(interim_stack.1, interim_stack.2, interim_stack.3, interim_stack.4, interim_stack.5);
        let t20: u128 = interim_stack.0;
        
        interim_stack = zk_bitwise_stack_v0_0_1.leo/pop(interim_stack.1, interim_stack.2, interim_stack.3, interim_stack.4, interim_stack.5);
        let t21: u128 = interim_stack.0;
        
        interim_stack = zk_bitwise_stack_v0_0_1.leo/pop(interim_stack.1, interim_stack.2, interim_stack.3, interim_stack.4, interim_stack.5);
        let t22: u128 = interim_stack.0;
        
        interim_stack = zk_bitwise_stack_v0_0_1.leo/pop(interim_stack.1, interim_stack.2, interim_stack.3, interim_stack.4, interim_stack.5);
        let t23: u128 = interim_stack.0;
        
        interim_stack = zk_bitwise_stack_v0_0_1.leo/pop(interim_stack.1, interim_stack.2, interim_stack.3, interim_stack.4, interim_stack.5);
        let t24: u128 = interim_stack.0;
        
        interim_stack = zk_bitwise_stack_v0_0_1.leo/pop(interim_stack.1, interim_stack.2, interim_stack.3, interim_stack.4, interim_stack.5);
        let t25: u128 = interim_stack.0;
        
        interim_stack = zk_bitwise_stack_v0_0_1.leo/pop(interim_stack.1, interim_stack.2, interim_stack.3, interim_stack.4, interim_stack.5);
        let t26: u128 = interim_stack.0;
        
        interim_stack = zk_bitwise_stack_v0_0_1.leo/pop(interim_stack.1, interim_stack.2, interim_stack.3, interim_stack.4, interim_stack.5);
        let t27: u128 = interim_stack.0;
        
        interim_stack = zk_bitwise_stack_v0_0_1.leo/pop(interim_stack.1, interim_stack.2, interim_stack.3, interim_stack.4, interim_stack.5);
        let t28: u128 = interim_stack.0;
        
        interim_stack = zk_bitwise_stack_v0_0_1.leo/pop(interim_stack.1, interim_stack.2, interim_stack.3, interim_stack.4, interim_stack.5);
        let t29: u128 = interim_stack.0;
        
        interim_stack = zk_bitwise_stack_v0_0_1.leo/pop(interim_stack.1, interim_stack.2, interim_stack.3, interim_stack.4, interim_stack.5);
        let t30: u128 = interim_stack.0;
        
        interim_stack = zk_bitwise_stack_v0_0_1.leo/pop(interim_stack.1, interim_stack.2, interim_stack.3, interim_stack.4, interim_stack.5);
        let t31: u128 = interim_stack.0;
        
        interim_stack = zk_bitwise_stack_v0_0_1.leo/pop(interim_stack.1, interim_stack.2, interim_stack.3, interim_stack.4, interim_stack.5);
        let t32: u128 = interim_stack.0;
        
        interim_stack = zk_bitwise_stack_v0_0_1.leo/pop(interim_stack.1, interim_stack.2, interim_stack.3, interim_stack.4, interim_stack.5);
        let t33: u128 = interim_stack.0;
        
        interim_stack = zk_bitwise_stack_v0_0_1.leo/pop(interim_stack.1, interim_stack.2, interim_stack.3, interim_stack.4, interim_stack.5);
        let t34: u128 = interim_stack.0;
        
        interim_stack = zk_bitwise_stack_v0_0_1.leo/pop(interim_stack.1, interim_stack.2, interim_stack.3, interim_stack.4, interim_stack.5);
        let t35: u128 = interim_stack.0;
        
        interim_stack = zk_bitwise_stack_v0_0_1.leo/pop(interim_stack.1, interim_stack.2, interim_stack.3, interim_stack.4, interim_stack.5);
        let t36: u128 = interim_stack.0;
        
        interim_stack = zk_bitwise_stack_v0_0_1.leo/pop(interim_stack.1, interim_stack.2, interim_stack.3, interim_stack.4, interim_stack.5);
        let t37: u128 = interim_stack.0;
        
        interim_stack = zk_bitwise_stack_v0_0_1.leo/pop(interim_stack.1, interim_stack.2, interim_stack.3, interim_stack.4, interim_stack.5);
        let t38: u128 = interim_stack.0;
        
        interim_stack = zk_bitwise_stack_v0_0_1.leo/pop(interim_stack.1, interim_stack.2, interim_stack.3, interim_stack.4, interim_stack.5);
        let t39: u128 = interim_stack.0;
        
        interim_stack = zk_bitwise_stack_v0_0_1.leo/pop(interim_stack.1, interim_stack.2, interim_stack.3, interim_stack.4, interim_stack.5);
        let t40: u128 = interim_stack.0;
        
        interim_stack = zk_bitwise_stack_v0_0_1.leo/pop(interim_stack.1, interim_stack.2, interim_stack.3, interim_stack.4, interim_stack.5);
        let t41: u128 = interim_stack.0;
        
        interim_stack = zk_bitwise_stack_v0_0_1.leo/pop(interim_stack.1, interim_stack.2, interim_stack.3, interim_stack.4, interim_stack.5);
        let t42: u128 = interim_stack.0;
        
        interim_stack = zk_bitwise_stack_v0_0_1.leo/pop(interim_stack.1, interim_stack.2, interim_stack.3, interim_stack.4, interim_stack.5);
        let t43: u128 = interim_stack.0;
        
        interim_stack = zk_bitwise_stack_v0_0_1.leo/pop(interim_stack.1, interim_stack.2, interim_stack.3, interim_stack.4, interim_stack.5);
        let t44: u128 = interim_stack.0;
        
        interim_stack = zk_bitwise_stack_v0_0_1.leo/pop(interim_stack.1, interim_stack.2, interim_stack.3, interim_stack.4, interim_stack.5);
        let t45: u128 = interim_stack.0;
        
        interim_stack = zk_bitwise_stack_v0_0_1.leo/pop(interim_stack.1, interim_stack.2, interim_stack.3, interim_stack.4, interim_stack.5);
        let t46: u128 = interim_stack.0;
        
        interim_stack = zk_bitwise_stack_v0_0_1.leo/pop(interim_stack.1, interim_stack.2, interim_stack.3, interim_stack.4, interim_stack.5);
        let t47: u128 = interim_stack.0;
        
        interim_stack = zk_bitwise_stack_v0_0_1.leo/pop(interim_stack.1, interim_stack.2, interim_stack.3, interim_stack.4, interim_stack.5);
        let t48: u128 = interim_stack.0;
        
        interim_stack = zk_bitwise_stack_v0_0_1.leo/pop(interim_stack.1, interim_stack.2, interim_stack.3, interim_stack.4, interim_stack.5);
        let t49: u128 = interim_stack.0;
        
        interim_stack = zk_bitwise_stack_v0_0_1.leo/pop(interim_stack.1, interim_stack.2, interim_stack.3, interim_stack.4, interim_stack.5);
        let t50: u128 = interim_stack.0;
        
        interim_stack = zk_bitwise_stack_v0_0_1.leo/pop(interim_stack.1, interim_stack.2, interim_stack.3, interim_stack.4, interim_stack.5);
        let t51: u128 = interim_stack.0;
        

        return [[t0, t1, t2, t3, t4, t5, t6, t7, t8, t9, t10, t11, t12, t13, t14, t15, t16, t17, t18, t19, t20, t21, t22, t23, t24, t25],
                [t26, t27, t28, t29, t30, t31, t32, t33, t34, t35, t36, t37, t38, t39, t40, t41, t42, t43, t44, t45, t46, t47, t48, t49, t50, t51]];
    }

    transition test_pop_u8() -> (u128, u16, u16, u8, [u128; 26], [u128; 26]) {
        let member_size: u8 = 8u8;
        // let member_size: u8 = 16u8;
        // let member_size: u8 = 32u8;
        // let member_size: u8 = 64u8;
        // let member_size: u8 = 128u8;

        let max_size: u16 = member_size as u16;
        let capacity: u16 = 6656u16 / max_size;
        // Check for overflow
        assert(capacity > 0u16);
        assert(capacity <= 832u16);
        assert(member_size > 0u8);
        assert(member_size <= 128u8);
        assert_eq(member_size % 8u8, 0u8);
        let a1: (u16, u16, u8, [u128; 26], [u128; 26]) = (capacity, 0u16, member_size, [0u128, 0u128, 0u128, 0u128, 0u128, 0u128,0u128, 0u128, 0u128, 0u128, 0u128, 0u128, 0u128,
                 0u128, 0u128, 0u128, 0u128, 0u128, 0u128, 0u128, 0u128, 0u128, 0u128, 0u128, 0u128, 0u128], [0u128, 0u128, 0u128, 0u128, 0u128, 0u128,0u128, 0u128, 0u128, 0u128, 0u128, 0u128, 0u128,
                 0u128, 0u128, 0u128, 0u128, 0u128, 0u128, 0u128, 0u128, 0u128, 0u128, 0u128, 0u128, 0u128]);
        let a2: (u16, u16, u8, [u128; 26], [u128; 26]) = zk_bitwise_stack_v0_0_1.leo/push(1u128, a1.0, a1.1, a1.2, a1.3, a1.4);
        let a3: (u16, u16, u8, [u128; 26], [u128; 26]) = zk_bitwise_stack_v0_0_1.leo/push(2u128, a2.0, a2.1, a2.2, a2.3, a2.4);
        let a4: (u16, u16, u8, [u128; 26], [u128; 26]) = zk_bitwise_stack_v0_0_1.leo/push(3u128, a3.0, a3.1, a3.2, a3.3, a3.4);
        let a5: (u16, u16, u8, [u128; 26], [u128; 26]) = zk_bitwise_stack_v0_0_1.leo/push(4u128, a4.0, a4.1, a4.2, a4.3, a4.4);
        let a6: (u16, u16, u8, [u128; 26], [u128; 26]) = zk_bitwise_stack_v0_0_1.leo/push(5u128, a5.0, a5.1, a5.2, a5.3, a5.4);
        let a7: (u16, u16, u8, [u128; 26], [u128; 26]) = zk_bitwise_stack_v0_0_1.leo/push(6u128, a6.0, a6.1, a6.2, a6.3, a6.4);
        let a8: (u16, u16, u8, [u128; 26], [u128; 26]) = zk_bitwise_stack_v0_0_1.leo/push(7u128, a7.0, a7.1, a7.2, a7.3, a7.4);
        let a9: (u16, u16, u8, [u128; 26], [u128; 26]) = zk_bitwise_stack_v0_0_1.leo/push(8u128, a8.0, a8.1, a8.2, a8.3, a8.4);
        let a10: (u16, u16, u8, [u128; 26], [u128; 26]) = zk_bitwise_stack_v0_0_1.leo/push(9u128, a9.0, a9.1, a9.2, a9.3, a9.4);
        let a11: (u16, u16, u8, [u128; 26], [u128; 26]) = zk_bitwise_stack_v0_0_1.leo/push(10u128, a10.0, a10.1, a10.2, a10.3, a10.4);
        let a12: (u16, u16, u8, [u128; 26], [u128; 26]) = zk_bitwise_stack_v0_0_1.leo/push(11u128, a11.0, a11.1, a11.2, a11.3, a11.4);
        let a13: (u16, u16, u8, [u128; 26], [u128; 26]) = zk_bitwise_stack_v0_0_1.leo/push(12u128, a12.0, a12.1, a12.2, a12.3, a12.4);
        let a14: (u16, u16, u8, [u128; 26], [u128; 26]) = zk_bitwise_stack_v0_0_1.leo/push(13u128, a13.0, a13.1, a13.2, a13.3, a13.4);
        let a15: (u16, u16, u8, [u128; 26], [u128; 26]) = zk_bitwise_stack_v0_0_1.leo/push(14u128, a14.0, a14.1, a14.2, a14.3, a14.4);
        let a16: (u16, u16, u8, [u128; 26], [u128; 26]) = zk_bitwise_stack_v0_0_1.leo/push(15u128, a15.0, a15.1, a15.2, a15.3, a15.4);
        let a17: (u16, u16, u8, [u128; 26], [u128; 26]) = zk_bitwise_stack_v0_0_1.leo/push(16u128, a16.0, a16.1, a16.2, a16.3, a16.4);
        let a18: (u16, u16, u8, [u128; 26], [u128; 26]) = zk_bitwise_stack_v0_0_1.leo/push(17u128, a17.0, a17.1, a17.2, a17.3, a17.4);
        let a19: (u16, u16, u8, [u128; 26], [u128; 26]) = zk_bitwise_stack_v0_0_1.leo/push(18u128, a18.0, a18.1, a18.2, a18.3, a18.4);
        let a20: (u16, u16, u8, [u128; 26], [u128; 26]) = zk_bitwise_stack_v0_0_1.leo/push(19u128, a19.0, a19.1, a19.2, a19.3, a19.4);
        let a21: (u16, u16, u8, [u128; 26], [u128; 26]) = zk_bitwise_stack_v0_0_1.leo/push(20u128, a20.0, a20.1, a20.2, a20.3, a20.4);
        let a22: (u16, u16, u8, [u128; 26], [u128; 26]) = zk_bitwise_stack_v0_0_1.leo/push(21u128, a21.0, a21.1, a21.2, a21.3, a21.4);
        let a23: (u16, u16, u8, [u128; 26], [u128; 26]) = zk_bitwise_stack_v0_0_1.leo/push(22u128, a22.0, a22.1, a22.2, a22.3, a22.4);
        let a24: (u16, u16, u8, [u128; 26], [u128; 26]) = zk_bitwise_stack_v0_0_1.leo/push(23u128, a23.0, a23.1, a23.2, a23.3, a23.4);
        let a25: (u16, u16, u8, [u128; 26], [u128; 26]) = zk_bitwise_stack_v0_0_1.leo/push(24u128, a24.0, a24.1, a24.2, a24.3, a24.4);
        let a26: (u16, u16, u8, [u128; 26], [u128; 26]) = zk_bitwise_stack_v0_0_1.leo/push(25u128, a25.0, a25.1, a25.2, a25.3, a25.4);
        let a27: (u16, u16, u8, [u128; 26], [u128; 26]) = zk_bitwise_stack_v0_0_1.leo/push(26u128, a26.0, a26.1, a26.2, a26.3, a26.4);
        let a28: (u16, u16, u8, [u128; 26], [u128; 26]) = zk_bitwise_stack_v0_0_1.leo/push(27u128, a27.0, a27.1, a27.2, a27.3, a27.4);
        let tuple_b1: (u128, u16, u16, u8, [u128; 26], [u128; 26]) = zk_bitwise_stack_v0_0_1.leo/pop(a28.0, a28.1, a28.2, a28.3, a28.4);
        let tuple_b2: (u128, u16, u16, u8, [u128; 26], [u128; 26]) = zk_bitwise_stack_v0_0_1.leo/pop(tuple_b1.1, tuple_b1.2, tuple_b1.3, tuple_b1.4, tuple_b1.5);
        let tuple_b3: (u128, u16, u16, u8, [u128; 26], [u128; 26]) = zk_bitwise_stack_v0_0_1.leo/pop(tuple_b2.1, tuple_b2.2, tuple_b2.3, tuple_b2.4, tuple_b2.5);
        let tuple_b4: (u128, u16, u16, u8, [u128; 26], [u128; 26]) = zk_bitwise_stack_v0_0_1.leo/pop(tuple_b3.1, tuple_b3.2, tuple_b3.3, tuple_b3.4, tuple_b3.5);
        let tuple_b5: (u128, u16, u16, u8, [u128; 26], [u128; 26]) = zk_bitwise_stack_v0_0_1.leo/pop(tuple_b4.1, tuple_b4.2, tuple_b4.3, tuple_b4.4, tuple_b4.5);
        let tuple_b6: (u128, u16, u16, u8, [u128; 26], [u128; 26]) = zk_bitwise_stack_v0_0_1.leo/pop(tuple_b5.1, tuple_b5.2, tuple_b5.3, tuple_b5.4, tuple_b5.5);
        let tuple_b7: (u128, u16, u16, u8, [u128; 26], [u128; 26]) = zk_bitwise_stack_v0_0_1.leo/pop(tuple_b6.1, tuple_b6.2, tuple_b6.3, tuple_b6.4, tuple_b6.5);
        let tuple_b8: (u128, u16, u16, u8, [u128; 26], [u128; 26]) = zk_bitwise_stack_v0_0_1.leo/pop(tuple_b7.1, tuple_b7.2, tuple_b7.3, tuple_b7.4, tuple_b7.5);
        let tuple_b9: (u128, u16, u16, u8, [u128; 26], [u128; 26]) = zk_bitwise_stack_v0_0_1.leo/pop(tuple_b8.1, tuple_b8.2, tuple_b8.3, tuple_b8.4, tuple_b8.5);
        let tuple_b10: (u128, u16, u16, u8, [u128; 26], [u128; 26]) = zk_bitwise_stack_v0_0_1.leo/pop(tuple_b9.1, tuple_b9.2, tuple_b9.3, tuple_b9.4, tuple_b9.5);
        let tuple_b11: (u128, u16, u16, u8, [u128; 26], [u128; 26]) = zk_bitwise_stack_v0_0_1.leo/pop(tuple_b10.1, tuple_b10.2, tuple_b10.3, tuple_b10.4, tuple_b10.5);
        let tuple_b12: (u128, u16, u16, u8, [u128; 26], [u128; 26]) = zk_bitwise_stack_v0_0_1.leo/pop(tuple_b11.1, tuple_b11.2, tuple_b11.3, tuple_b11.4, tuple_b11.5);
        let tuple_b13: (u128, u16, u16, u8, [u128; 26], [u128; 26]) = zk_bitwise_stack_v0_0_1.leo/pop(tuple_b12.1, tuple_b12.2, tuple_b12.3, tuple_b12.4, tuple_b12.5);
        let tuple_b14: (u128, u16, u16, u8, [u128; 26], [u128; 26]) = zk_bitwise_stack_v0_0_1.leo/pop(tuple_b13.1, tuple_b13.2, tuple_b13.3, tuple_b13.4, tuple_b13.5);
        let tuple_b15: (u128, u16, u16, u8, [u128; 26], [u128; 26]) = zk_bitwise_stack_v0_0_1.leo/pop(tuple_b14.1, tuple_b14.2, tuple_b14.3, tuple_b14.4, tuple_b14.5);
        let tuple_b16: (u128, u16, u16, u8, [u128; 26], [u128; 26]) = zk_bitwise_stack_v0_0_1.leo/pop(tuple_b15.1, tuple_b15.2, tuple_b15.3, tuple_b15.4, tuple_b15.5);
        let tuple_b17: (u128, u16, u16, u8, [u128; 26], [u128; 26]) = zk_bitwise_stack_v0_0_1.leo/pop(tuple_b16.1, tuple_b16.2, tuple_b16.3, tuple_b16.4, tuple_b16.5);
        let tuple_b18: (u128, u16, u16, u8, [u128; 26], [u128; 26]) = zk_bitwise_stack_v0_0_1.leo/pop(tuple_b17.1, tuple_b17.2, tuple_b17.3, tuple_b17.4, tuple_b17.5);
        let tuple_b19: (u128, u16, u16, u8, [u128; 26], [u128; 26]) = zk_bitwise_stack_v0_0_1.leo/pop(tuple_b18.1, tuple_b18.2, tuple_b18.3, tuple_b18.4, tuple_b18.5);
        let tuple_b20: (u128, u16, u16, u8, [u128; 26], [u128; 26]) = zk_bitwise_stack_v0_0_1.leo/pop(tuple_b19.1, tuple_b19.2, tuple_b19.3, tuple_b19.4, tuple_b19.5);
        let tuple_b21: (u128, u16, u16, u8, [u128; 26], [u128; 26]) = zk_bitwise_stack_v0_0_1.leo/pop(tuple_b20.1, tuple_b20.2, tuple_b20.3, tuple_b20.4, tuple_b20.5);
        let tuple_b22: (u128, u16, u16, u8, [u128; 26], [u128; 26]) = zk_bitwise_stack_v0_0_1.leo/pop(tuple_b21.1, tuple_b21.2, tuple_b21.3, tuple_b21.4, tuple_b21.5);
        let tuple_b23: (u128, u16, u16, u8, [u128; 26], [u128; 26]) = zk_bitwise_stack_v0_0_1.leo/pop(tuple_b22.1, tuple_b22.2, tuple_b22.3, tuple_b22.4, tuple_b22.5);
        let tuple_b24: (u128, u16, u16, u8, [u128; 26], [u128; 26]) = zk_bitwise_stack_v0_0_1.leo/pop(tuple_b23.1, tuple_b23.2, tuple_b23.3, tuple_b23.4, tuple_b23.5);
        let tuple_b25: (u128, u16, u16, u8, [u128; 26], [u128; 26]) = zk_bitwise_stack_v0_0_1.leo/pop(tuple_b24.1, tuple_b24.2, tuple_b24.3, tuple_b24.4, tuple_b24.5);
        let tuple_b26: (u128, u16, u16, u8, [u128; 26], [u128; 26]) = zk_bitwise_stack_v0_0_1.leo/pop(tuple_b25.1, tuple_b25.2, tuple_b25.3, tuple_b25.4, tuple_b25.5);
        let tuple_b27: (u128, u16, u16, u8, [u128; 26], [u128; 26]) = zk_bitwise_stack_v0_0_1.leo/pop(tuple_b26.1, tuple_b26.2, tuple_b26.3, tuple_b26.4, tuple_b26.5);
        return tuple_b27;
    }

    transition test_push_pop() -> (u16, u16, u8, [u128; 26], [u128; 26], u16, u16, u8, [u128; 26], [u128; 26], u16, u16, u8, [u128; 26], [u128; 26], u128) {
        let member_size: u8 = 8u8;
        // let member_size: u8 = 16u8;
        // let member_size: u8 = 32u8;
        // let member_size: u8 = 64u8;
        // let member_size: u8 = 128u8;

        let max_size: u16 = member_size as u16;
        let capacity: u16 = 6656u16 / max_size;
        // Check for overflow
        assert(capacity > 0u16);
        assert(capacity <= 832u16);
        assert(member_size > 0u8);
        assert(member_size <= 128u8);
        assert_eq(member_size % 8u8, 0u8);
        let a0: (u16, u16, u8, [u128; 26], [u128; 26]) = (capacity, 0u16, member_size, [0u128, 0u128, 0u128, 0u128, 0u128, 0u128,0u128, 0u128, 0u128, 0u128, 0u128, 0u128, 0u128,
                 0u128, 0u128, 0u128, 0u128, 0u128, 0u128, 0u128, 0u128, 0u128, 0u128, 0u128, 0u128, 0u128], [0u128, 0u128, 0u128, 0u128, 0u128, 0u128,0u128, 0u128, 0u128, 0u128, 0u128, 0u128, 0u128,
                 0u128, 0u128, 0u128, 0u128, 0u128, 0u128, 0u128, 0u128, 0u128, 0u128, 0u128, 0u128, 0u128]);
        let a1: (u16, u16, u8, [u128; 26], [u128; 26]) = zk_bitwise_stack_v0_0_1.leo/push(1u128, a0.0, a0.1, a0.2, a0.3, a0.4);
        let tuple_b1: (u128, u16, u16, u8, [u128; 26], [u128; 26]) = zk_bitwise_stack_v0_0_1.leo/pop(a1.0, a1.1, a1.2, a1.3, a1.4);
        return (a0.0, a0.1, a0.2, a0.3, a0.4, a1.0, a1.1, a1.2, a1.3, a1.4, tuple_b1.1, tuple_b1.2, tuple_b1.3, tuple_b1.4, tuple_b1.5, tuple_b1.0);
    }

    transition test_series_buffer_indexes_u8() -> (u8, u8) {
        let (series_index, buffer_index): (u8, u8) = get_series_buffer_indexes(0u16, 8u8);
        assert(series_index == 0u8);
        assert(buffer_index == 0u8);
        let (series_index1, buffer_index1): (u8, u8) = get_series_buffer_indexes(1u16, 8u8);
        assert(series_index1 == 0u8);
        assert(buffer_index1 == 0u8);
        let (series_index2, buffer_index2): (u8, u8) = get_series_buffer_indexes(2u16, 8u8);
        assert(series_index2 == 0u8);
        assert(buffer_index2 == 0u8);
        let (series_index3, buffer_index3): (u8, u8) = get_series_buffer_indexes(3u16, 8u8);
        assert(series_index3 == 0u8);
        assert(buffer_index3 == 0u8);
        let (series_index4, buffer_index4): (u8, u8) = get_series_buffer_indexes(4u16, 8u8);
        assert(series_index4 == 0u8);
        assert(buffer_index4 == 0u8);
        let (series_index5, buffer_index5): (u8, u8) = get_series_buffer_indexes(5u16, 8u8);
        assert(series_index5 == 0u8);
        assert(buffer_index5 == 0u8);
        let (series_index6, buffer_index6): (u8, u8) = get_series_buffer_indexes(6u16, 8u8);
        assert(series_index6 == 0u8);
        assert(buffer_index6 == 0u8);
        let (series_index7, buffer_index7): (u8, u8) = get_series_buffer_indexes(7u16, 8u8);
        assert(series_index7 == 0u8);
        assert(buffer_index7 == 0u8);
        let (series_index8, buffer_index8): (u8, u8) = get_series_buffer_indexes(8u16, 8u8);
        assert(series_index8 == 0u8);
        assert(buffer_index8 == 0u8);
        let (series_index9, buffer_index9): (u8, u8) = get_series_buffer_indexes(3u16, 64u8);
        assert(series_index9 == 0u8);
        assert(buffer_index9 == 1u8);
        let (series_index10, buffer_index10): (u8, u8) = get_series_buffer_indexes(25u16, 128u8);
        assert (series_index10 == 0u8);
        assert (buffer_index10 == 25u8);
        return (series_index10, buffer_index10);
    }
}