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
leo run shuffle_deck -- -- -4i8 8u16 \
                 "[[63u128, 62u128, 61u128, 60u128, 59u128, 58u128, 57u128, 56u128, 55u128, 54u128, 53u128, 52u128, 51u128, 50u128, 49u128, 48u128, 47u128, 46u128, 45u128, 44u128, 43u128, 42u128, 41u128, 40u128, 39u128, 38u128],
                   [37u128, 36u128, 35u128, 34u128, 33u128, 32u128, 31u128, 30u128, 29u128, 28u128, 27u128, 26u128, 25u128, 24u128, 23u128, 22u128, 21u128, 20u128, 19u128, 18u128, 17u128, 16u128, 15u128, 14u128, 13u128, 12u128]]"
       Leo ✅ Compiled 'main.leo' into Aleo instructions

⛓  Constraints

 •  'zk_deck_shuffle_v0_0_1.aleo/shuffle_deck' - 7,379,453 constraints (called 1 time)

➡️  Output

 • [
  [
    63u128,
    62u128,
    61u128,
    60u128,
    37u128,
    59u128,
    36u128,
    58u128,
    35u128,
    57u128,
    34u128,
    56u128,
    33u128,
    55u128,
    32u128,
    54u128,
    31u128,
    53u128,
    30u128,
    52u128,
    29u128,
    51u128,
    28u128,
    50u128,
    27u128,
    49u128
  ],
  [
    26u128,
    48u128,
    25u128,
    47u128,
    24u128,
    46u128,
    23u128,
    45u128,
    22u128,
    44u128,
    21u128,
    43u128,
    20u128,
    42u128,
    19u128,
    41u128,
    18u128,
    40u128,
    17u128,
    39u128,
    16u128,
    38u128,
    15u128,
    14u128,
    13u128,
    12u128
  ]
]

       Leo ✅ Finished 'zk_deck_shuffle_v0_0_1.aleo/shuffle_deck'
```

```bash
zk_deck_shuffle % leo run shuffle_deck 4i8 8u16 \
                 "[[63u128, 62u128, 61u128, 60u128, 59u128, 58u128, 57u128, 56u128, 55u128, 54u128, 53u128, 52u128, 51u128, 50u128, 49u128, 48u128, 47u128, 46u128, 45u128, 44u128, 43u128, 42u128, 41u128, 40u128, 39u128, 38u128],
                   [37u128, 36u128, 35u128, 34u128, 33u128, 32u128, 31u128, 30u128, 29u128, 28u128, 27u128, 26u128, 25u128, 24u128, 23u128, 22u128, 21u128, 20u128, 19u128, 18u128, 17u128, 16u128, 15u128, 14u128, 13u128, 12u128]]"
       Leo ✅ Compiled 'main.leo' into Aleo instructions

⛓  Constraints

 •  'zk_deck_shuffle_v0_0_1.aleo/shuffle_deck' - 7,379,453 constraints (called 1 time)

➡️  Output

 • [
  [
    37u128,
    36u128,
    35u128,
    34u128,
    63u128,
    33u128,
    62u128,
    32u128,
    61u128,
    31u128,
    60u128,
    30u128,
    59u128,
    29u128,
    58u128,
    28u128,
    57u128,
    27u128,
    56u128,
    26u128,
    55u128,
    25u128,
    54u128,
    24u128,
    53u128,
    23u128
  ],
  [
    52u128,
    22u128,
    51u128,
    21u128,
    50u128,
    20u128,
    49u128,
    19u128,
    48u128,
    18u128,
    47u128,
    17u128,
    46u128,
    16u128,
    45u128,
    15u128,
    44u128,
    14u128,
    43u128,
    13u128,
    42u128,
    12u128,
    41u128,
    40u128,
    39u128,
    38u128
  ]
]

       Leo ✅ Finished 'zk_deck_shuffle_v0_0_1.aleo/shuffle_deck'
```

After optimization

```bash
leo run shuffle_deck -- -- -4i8 8u16 \
                 "[[63field, 62field, 61field, 60field, 59field, 58field, 57field, 56field, 55field, 54field, 53field, 52field, 51field, 50field, 49field, 48field, 47field, 46field, 45field, 44field, 43field, 42field, 41field, 40field, 39field, 38field],
                   [37field, 36field, 35field, 34field, 33field, 32field, 31field, 30field, 29field, 28field, 27field, 26field, 25field, 24field, 23field, 22field, 21field, 20field, 19field, 18field, 17field, 16field, 15field, 14field, 13field, 12field]]"

⛓  Constraints

 •  'zk_deck_shuffle_v0_0_1.aleo/shuffle_deck' - 841,960 constraints (called 1 time)

➡️  Output

 • [
  [
    63field,
    62field,
    61field,
    60field,
    37field,
    59field,
    36field,
    58field,
    35field,
    57field,
    34field,
    56field,
    33field,
    55field,
    32field,
    54field,
    31field,
    53field,
    30field,
    52field,
    29field,
    51field,
    28field,
    50field,
    27field,
    49field
  ],
  [
    26field,
    48field,
    25field,
    47field,
    24field,
    46field,
    23field,
    45field,
    22field,
    44field,
    21field,
    43field,
    20field,
    42field,
    19field,
    41field,
    18field,
    40field,
    17field,
    39field,
    16field,
    38field,
    15field,
    14field,
    13field,
    12field
  ]
]

       Leo ✅ Finished 'zk_deck_shuffle_v0_0_1.aleo/shuffle_deck' (in "/Users/arosboro/git/zk_deck_shuffle/build")