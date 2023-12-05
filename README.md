# zk_deck_shuffle.aleo

## Build Guide

To compile this Aleo program, run:

```bash
leo build
```

To execute this Aleo program, run:

The program considers the following 8 bit values as standard card values but values can be changed in size up to 128 bits:
63u8..12u8 (63 representing the left most bit in a u64 flipped to 1 and all 0's to the right, and 62 representing 010000... and so on)

```bash
leo run test_push_u8
leo run test_pop_u8
leo run test_push_pop
leo run test_series_buffer_indexes_u8
leo run shuffle_deck 4i8 8u16 \
                 "[63u128, 62u128, 61u128, 60u128, 59u128, 58u128, 57u128, 56u128, 55u128, 54u128, 53u128, 52u128, 51u128,
                 50u128, 49u128, 48u128, 47u128, 46u128, 45u128, 44u128, 43u128, 42u128, 41u128, 40u128, 39u128, 38u128]" \
                 "[37u128, 36u128, 35u128, 34u128, 33u128, 32u128, 31u128, 30u128, 29u128, 28u128, 27u128, 26u128, 25u128,
                 24u128, 23u128, 22u128, 21u128, 20u128, 19u128, 18u128, 17u128, 16u128, 15u128, 14u128, 13u128, 12u128]"
```
