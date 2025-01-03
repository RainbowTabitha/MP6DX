# =================================
# Custom Random Bonus Stars
# By Tabitha
# =================================

# To be inserted at 805031DC

# Function to generate a random number
.set RNG_FUNC, 0x8003FB68

# Values for Minigame Star Replacement
.set BLUE_STAR, 0x88830014
.set RED_STAR, 0x88830015
.set CHAR_SPACE_STAR, 0x88830016
.set HAPPENING_STAR, 0x88830017
.set BOWSER_STAR, 0x88830018
.set CHANCE_STAR, 0x8883001A
.set DONKEY_STAR, 0x8883001B
.set COIN_STAR, 0xA8830022
.SET ORB_STAR, 0xA8830034

# Values for Orb Star Replacement
.set BLUE_STAR_2, 0x88C70014
.set RED_STAR_2, 0x88C70015
.set CHAR_SPACE_STAR_2, 0x88C70016
.set HAPPENING_STAR_2, 0x88C70017
.set BOWSER_STAR_2, 0x88C70018
.set CHANCE_STAR_2, 0x88C7001A
.set DONKEY_STAR_2, 0x88C7001B
.set COIN_STAR_2, 0xA8C70022
.SET MINIGAME_STAR_2, 0xA8C7001E

# Values for Happ Star Replacement
.set BLUE_STAR_3, 0x88040014
.set RED_STAR_3, 0x88040015
.set CHAR_SPACE_STAR_3, 0x88040016
.set BOWSER_STAR_3, 0x88040018
.set CHANCE_STAR_3, 0x8804001A
.set DONKEY_STAR_3, 0x8804001B
.set COIN_STAR_3, 0xA8040022
.SET ORB_STAR_3, 0xA8040034
.SET MINIGAME_STAR_3, 0xA804001E

# Values for Star LOC
.set STAR_TYPE_1, 0x804ECF10
.set STAR_TYPE_1_ASCII, 0x805305CC
.set STAR_TYPE_2, 0x804ECF4C
.set STAR_TYPE_2_ASCII, 0x805312D4
.set STAR_TYPE_3, 0x804ECF88
.set STAR_TYPE_3_ASCII, 0x805308F4

lis r15, 0x8014
ori r15, r15, 0xD348
mtctr r15 #Store RNG function on the ctr

# Generate three unique random numbers
li r3, 10  # Total possible values (0-9)
bctrl
mr r14, r3  # Store the first random number

# Generate the second unique number
li r3, 9  # 0-8, 9 possible
bctrl
cmpw r3, r14
beq gen_unique_second  # If the second number equals the first, regenerate
mr r16, r3  # Store the second unique number

# Generate the third unique number
li r3, 8  # 0-7, 8 possible
bctrl
cmpw r3, r14
beq gen_unique_third  # If the third number equals the first, regenerate
cmpw r3, r16
beq gen_unique_third  # If the third number equals the second, regenerate
mr r15, r3  # Store the third unique number
b check_1  # Jump to check_1 after successful generation

# Label to regenerate the second unique number
gen_unique_second:
li r3, 9  # 0-8, 9 possible
bctrl
cmpw r3, r14
beq gen_unique_second  # If it equals the first, regenerate
mr r16, r3  # Store the second unique number

# Now generate the third unique number
gen_unique_third:
li r3, 8  # 0-7, 8 possible
bctrl
cmpw r3, r14
beq gen_unique_third  # If it equals the first, regenerate
cmpw r3, r16
beq gen_unique_third  # If it equals the second, regenerate
mr r15, r3  # Store the third unique number
b check_1  # Jump to check_1 after successful generation

check_1:
lis r15, STAR_TYPE_1_ASCII@h
ori r15, r15, STAR_TYPE_1_ASCII@l

# Check if r14 is X
cmpwi r14, 0
beq .write_blue1
cmpwi r14, 1
beq .write_red1
cmpwi r14, 2
beq .write_char1
cmpwi r14, 3
beq .write_happening1
cmpwi r14, 4
beq .write_bowser1
cmpwi r14, 5
beq .write_chance1
cmpwi r14, 6
beq .write_donkey1
cmpwi r14, 7
beq .write_coin1
cmpwi r14, 8
beq .write_orb1
cmpwi r14, 9
beq .check_2 # minigame

.write_blue1:
lis r14, BLUE_STAR@h 
ori r14, r14, BLUE_STAR@l

lis r16, 0x0342
ori r16, r16, 0x6C75
stw r16, 0(r15)

lis r16, 0x6505
ori r16, r16, 0x0505
stw r16, 4(r15)

lis r16, 0x0505
ori r16, r16, 0x1053
stw r16, 8(r15)

lis r16, 0x426C
ori r16, r16, 0x7565
stw r16, 0x5C(r15)

lis r16, 0x0505
ori r16, r16, 0x0505
stw r16, 0x60(r15)

lis r16, 0x0510
ori r16, r16, 0x5374
stw r16, 0x64(r15)
b .write_1

.write_red1:
lis r14, RED_STAR@h 
ori r14, r14, RED_STAR@l

lis r16, 0x0352
ori r16, r16, 0x6564
stw r16, 0(r15)

lis r16, 0x1005
ori r16, r16, 0x0505
stw r16, 4(r15)

lis r16, 0x0505
ori r16, r16, 0x1053
stw r16, 8(r15)

lis r16, 0x5265
ori r16, r16, 0x6405
stw r16, 0x5C(r15)

lis r16, 0x0505
ori r16, r16, 0x0505
stw r16, 0x60(r15)

lis r16, 0x0510
ori r16, r16, 0x5374
stw r16, 0x64(r15)
b .write_1

.write_char1:
lis r14, CHAR_SPACE_STAR@h 
ori r14, r14, CHAR_SPACE_STAR@l

lis r16, 0x0343
ori r16, r16, 0x6861
stw r16, 0(r15)

lis r16, 0x7261
ori r16, r16, 0x6374
stw r16, 4(r15)

lis r16, 0x6572
ori r16, r16, 0x1053
stw r16, 8(r15)

lis r16, 0x4368
ori r16, r16, 0x6172
stw r16, 0x5C(r15)

lis r16, 0x6163
ori r16, r16, 0x7465
stw r16, 0x60(r15)

lis r16, 0x7210
ori r16, r16, 0x5374
stw r16, 0x64(r15)
b .write_1

.write_happening1:
lis r14, HAPPENING_STAR@h  # Load upper 16 bits of HAPPENING_STAR into r14
ori r14, r14, HAPPENING_STAR@l  # Load lower 16 bits of HAPPENING_STAR into r14

lis r16, 0x0341
ori r16, r16, 0x6374
stw r16, 0(r15)

lis r16, 0x696F
ori r16, r16, 0x6E05
stw r16, 4(r15)

lis r16, 0x0505
ori r16, r16, 0x1053
stw r16, 8(r15)

lis r16, 0x4163
ori r16, r16, 0x7469
stw r16, 0x5C(r15)

lis r16, 0x6F6E
ori r16, r16, 0x0505
stw r16, 0x60(r15)

lis r16, 0x0510
ori r16, r16, 0x5374
stw r16, 0x64(r15)
b .write_1

.write_bowser1:
lis r14, BOWSER_STAR@h  # Load upper 16 bits of BOWSER_STAR into r14
ori r14, r14, BOWSER_STAR@l  # Load lower 16 bits of BOWSER_STAR into r14

lis r16, 0x0342
ori r16, r16, 0x6F77
stw r16, 0(r15)

lis r16, 0x7365
ori r16, r16, 0x7205
stw r16, 4(r15)

lis r16, 0x0505
ori r16, r16, 0x1053
stw r16, 8(r15)

lis r16, 0x426F
ori r16, r16, 0x7773
stw r16, 0x5C(r15)

lis r16, 0x6572
ori r16, r16, 0x0505
stw r16, 0x60(r15)

lis r16, 0x0510
ori r16, r16, 0x5374
stw r16, 0x64(r15)
b .write_1

.write_chance1:
lis r14, CHANCE_STAR@h  # Load upper 16 bits of CHANCE_STAR into r14
ori r14, r14, CHANCE_STAR@l  # Load lower 16 bits of CHANCE_STAR into r14

lis r16, 0x0343
ori r16, r16, 0x6861
stw r16, 0(r15)

lis r16, 0x6E63
ori r16, r16, 0x6505
stw r16, 4(r15)

lis r16, 0x0505
ori r16, r16, 0x1053
stw r16, 8(r15)

lis r16, 0x4368
ori r16, r16, 0x616E
stw r16, 0x5C(r15)

lis r16, 0x6365
ori r16, r16, 0x0505
stw r16, 0x60(r15)

lis r16, 0x0510
ori r16, r16, 0x5374
stw r16, 0x64(r15)
b .write_1


.write_donkey1:
lis r14, DONKEY_STAR@h  # Load upper 16 bits of DONKEY_STAR into r14
ori r14, r14, DONKEY_STAR@l  # Load lower 16 bits of DONKEY_STAR into r14

lis r16, 0x0344
ori r16, r16, 0x4B05
stw r16, 0(r15)

lis r16, 0x0505
ori r16, r16, 0x0505
stw r16, 4(r15)

lis r16, 0x0505
ori r16, r16, 0x1053
stw r16, 8(r15)

lis r16, 0x444B
ori r16, r16, 0x0505
stw r16, 0x5C(r15)

lis r16, 0x0505
ori r16, r16, 0x0505
stw r16, 0x60(r15)

lis r16, 0x0510
ori r16, r16, 0x5374
stw r16, 0x64(r15)
b .write_1

.write_coin1:
lis r14, COIN_STAR@h  # Load upper 16 bits of COIN_STAR into r14
ori r14, r14, COIN_STAR@l  # Load lower 16 bits of COIN_STAR into r14

lis r16, 0x0343
ori r16, r16, 0x6F69
stw r16, 0(r15)

lis r16, 0x6E05
ori r16, r16, 0x0505
stw r16, 4(r15)

lis r16, 0x0505
ori r16, r16, 0x1053
stw r16, 8(r15)

lis r16, 0x436F
ori r16, r16, 0x696E
stw r16, 0x5C(r15)

lis r16, 0x0505
ori r16, r16, 0x0505
stw r16, 0x60(r15)

lis r16, 0x0510
ori r16, r16, 0x5374
stw r16, 0x64(r15)
b .write_1

.write_orb1:
lis r14, ORB_STAR@h  # Load upper 16 bits of ORB_STAR into r14
ori r14, r14, ORB_STAR@l  # Load lower 16 bits of ORB_STAR into r14

lis r16, 0x034F
ori r16, r16, 0x7262
stw r16, 0(r15)

lis r16, 0x0505
ori r16, r16, 0x0505
stw r16, 4(r15)

lis r16, 0x0505
ori r16, r16, 0x1053
stw r16, 8(r15)

lis r16, 0x4F72
ori r16, r16, 0x6205
stw r16, 0x5C(r15)

lis r16, 0x0505
ori r16, r16, 0x0505
stw r16, 0x60(r15)

lis r16, 0x0510
ori r16, r16, 0x5374
stw r16, 0x64(r15)
b .write_1

.write_1:
lis r17, STAR_TYPE_1@h
ori r17, r17, STAR_TYPE_1@l
stw r14, 0(r17)

.check_2:
lis r15, STAR_TYPE_2_ASCII@h
ori r15, r15, STAR_TYPE_2_ASCII@l

lis r14, 0x5374
ori r14, r14, 0x6172
stw r14, 0xC(r15)

lis r14, 0x101E
ori r14, r14, 0x0869
stw r14, 0x10(r15)

lis r14, 0x7305
ori r14, r14, 0x0505
stw r14, 0x14(r15)

lis r14, 0x0505
ori r14, r14, 0x0505
stw r14, 0x18(r15)

lis r14, 0x6172
ori r14, r14, 0x1E08
stw r14, 0x64(r15)

lis r14, 0x0510
ori r14, r14, 0x7769
stw r14, 0x68(r15)

lis r14, 0x6E6E
ori r14, r14, 0x6572
stw r14, 0x6C(r15)

lis r14, 0x1069
ori r14, r14, 0x7385
stw r14, 0x70(r15)

lis r14, 0xFF00
ori r14, r14, 0x0210
stw r14, 0x74(r15)

# Check if r16 is X
cmpwi r16, 0
beq .write_blue2
cmpwi r16, 1    
beq .write_red2
cmpwi r16, 2
beq .write_char2
cmpwi r16, 3
beq .write_happening2
cmpwi r16, 4
beq .write_bowser2
cmpwi r16, 5
beq .write_chance2
cmpwi r16, 6
beq .write_donkey2
cmpwi r16, 7
beq .write_coin2
cmpwi r16, 8
beq .check_3
cmpwi r16, 9
beq .write_minigame2

.write_blue2:
lis r16, BLUE_STAR_2@h  # Load upper 16 bits of MINIGAME into r16
ori r16, r16, BLUE_STAR_2@l  # Load lower 16 bits of MINIGAME into r16

lis r14, 0x1E06
ori r14, r14, 0x426C
stw r14, 0(r15)

lis r14, 0x7565
ori r14, r14, 0x0505
stw r14, 4(r15)

lis r14, 0x0505
ori r14, r14, 0x0510
stw r14, 8(r15)

lis r14, 0x426C
ori r14, r14, 0x7565
stw r14, 0x58(r15)

lis r14, 0x0505
ori r14, r14, 0x0505
stw r14, 0x5C(r15)

lis r14, 0x0510
ori r14, r14, 0x5374
stw r14, 0x60(r15)

b .write_2

.write_red2:
lis r16, RED_STAR_2@h  # Load upper 16 bits of MINIGAME into r16
ori r16, r16, RED_STAR_2@l  # Load lower 16 bits of MINIGAME into r16

lis r14, 0x1E06
ori r14, r14, 0x5265
stw r14, 0(r15)

lis r14, 0x6405
ori r14, r14, 0x0505
stw r14, 4(r15)

lis r14, 0x0505
ori r14, r14, 0x0510
stw r14, 8(r15)

lis r14, 0x5265
ori r14, r14, 0x6405
stw r14, 0x58(r15)

lis r14, 0x0505
ori r14, r14, 0x0505
stw r14, 0x5C(r15)

lis r14, 0x0510
ori r14, r14, 0x5374
stw r14, 0x60(r15)
b .write_2

.write_char2:
lis r16, CHAR_SPACE_STAR@h 
ori r16, r16, CHAR_SPACE_STAR@l

lis r14, 0x1E06
ori r14, r14, 0x4368
stw r14, 0(r15)

lis r14, 0x6172
ori r14, r14, 0x6163
stw r14, 4(r15)

lis r14, 0x7465
ori r14, r14, 0x7210
stw r14, 8(r15)

lis r14, 0x4368
ori r14, r14, 0x6172
stw r14, 0x58(r15)

lis r14, 0x6163
ori r14, r14, 0x7465
stw r14, 0x5C(r15)

lis r14, 0x7210
ori r14, r14, 0x5374
stw r14, 0x60(r15)
b .write_2

.write_happening2:
lis r16, HAPPENING_STAR_2@h  # Load upper 16 bits of HAPPENING_STAR_2 into r16
ori r16, r16, HAPPENING_STAR_2@l  # Load lower 16 bits of HAPPENING_STAR_2 into r16

lis r14, 0x1E06
ori r14, r14, 0x4163
stw r14, 0(r15)

lis r14, 0x7469
ori r14, r14, 0x6F6E
stw r14, 4(r15)

lis r14, 0x0505
ori r14, r14, 0x0510
stw r14, 8(r15)

lis r14, 0x4163
ori r14, r14, 0x7469
stw r14, 0x58(r15)

lis r14, 0x6F6E
ori r14, r14, 0x0505
stw r14, 0x5C(r15)

lis r14, 0x0510
ori r14, r14, 0x5374
stw r14, 0x60(r15)
b .write_2

.write_bowser2:
lis r16, BOWSER_STAR_2@h  # Load upper 16 bits of BOWSER_STAR_2 into r16
ori r16, r16, BOWSER_STAR_2@l  # Load lower 16 bits of BOWSER_STAR_2 into r16

lis r14, 0x1E06
ori r14, r14, 0x426F
stw r14, 0(r15)

lis r14, 0x7773
ori r14, r14, 0x6572
stw r14, 4(r15)

lis r14, 0x0505
ori r14, r14, 0x1048
stw r14, 8(r15)

lis r14, 0x6170
ori r14, r14, 0x7065
stw r14, 0x58(r15)

lis r14, 0x6E69
ori r14, r14, 0x6E67
stw r14, 0x5C(r15)

lis r14, 0x1053
ori r14, r14, 0x0574
stw r14, 0x60(r15)
b .write_2

.write_chance2:
lis r16, CHANCE_STAR_2@h  # Load upper 16 bits of CHANCE_STAR_2 into r16
ori r16, r16, CHANCE_STAR_2@l  # Load lower 16 bits of CHANCE_STAR_2 into r16

lis r14, 0x1E06
ori r14, r14, 0x4368
stw r14, 0(r15)

lis r14, 0x616E
ori r14, r14, 0x6365
stw r14, 4(r15)

lis r14, 0x0505
ori r14, r14, 0x0510
stw r14, 8(r15)

lis r14, 0x4368
ori r14, r14, 0x616E
stw r14, 0x58(r15)

lis r14, 0x6365
ori r14, r14, 0x0505
stw r14, 0x5C(r15)

lis r14, 0x0510
ori r14, r14, 0x5374
stw r14, 0x60(r15)
b .write_2

.write_donkey2:
lis r16, DONKEY_STAR_2@h  # Load upper 16 bits of DONKEY_STAR_2 into r16
ori r16, r16, DONKEY_STAR_2@l  # Load lower 16 bits of DONKEY_STAR_2 into r16

lis r14, 0x1E06
ori r14, r14, 0x444B
stw r14, 0(r15)

lis r14, 0x0505
ori r14, r14, 0x0505
stw r14, 4(r15)

lis r14, 0x0505
ori r14, r14, 0x0510
stw r14, 8(r15)

lis r14, 0x444B
ori r14, r14, 0x0505
stw r14, 0x58(r15)

lis r14, 0x0505
ori r14, r14, 0x0505
stw r14, 0x5C(r15)

lis r14, 0x0510
ori r14, r14, 0x5374
stw r14, 0x60(r15)
b .write_2

.write_coin2:
lis r16, COIN_STAR_2@h  # Load upper 16 bits of COIN_STAR_2 into r16
ori r16, r16, COIN_STAR_2@l  # Load lower 16 bits of COIN_STAR_2 into r16

lis r14, 0x1E06
ori r14, r14, 0x436F
stw r14, 0(r15)

lis r14, 0x696E
ori r14, r14, 0x0505
stw r14, 4(r15)

lis r14, 0x0505
ori r14, r14, 0x0510
stw r14, 8(r15)

lis r14, 0x436f
ori r14, r14, 0x696E
stw r14, 0x58(r15)

lis r14, 0x0505
ori r14, r14, 0x0505
stw r14, 0x5C(r15)

lis r14, 0x0510
ori r14, r14, 0x5374
stw r14, 0x60(r15)
b .write_2

.write_minigame2:
lis r16, MINIGAME_STAR_2@h  # Load upper 16 bits of ORB_STAR_2 into r16
ori r16, r16, MINIGAME_STAR_2@l  # Load lower 16 bits of ORB_STAR_2 into r16

lis r14, 0x1E06
ori r14, r14, 0x4D69
stw r14, 0(r15)

lis r14, 0x6E69
ori r14, r14, 0x3D67
stw r14, 4(r15)

lis r14, 0x616D
ori r14, r14, 0x6510
stw r14, 8(r15)

lis r14, 0x4D69
ori r14, r14, 0x6E69
stw r14, 0x58(r15)

lis r14, 0x3D67
ori r14, r14, 0x616D
stw r14, 0x5C(r15)

lis r14, 0x6510
ori r14, r14, 0x5374
stw r14, 0x60(r15)
b .write_2

.write_2:
lis r17, STAR_TYPE_2@h
ori r17, r17, STAR_TYPE_2@l
stw r16, 0(r17)

.check_3:

lis r16, STAR_TYPE_3_ASCII@h
ori r16, r16, STAR_TYPE_3_ASCII@l

lis r14, 0x5374
ori r14, r14, 0x6172
stw r14, 0xC(r16)

lis r14, 0x1E08
ori r14, r14, 0x0505
stw r14, 0x10(r16)

lis r14, 0x0510
ori r14, r14, 0x6973
stw r14, 0x14(r16)

lis r14, 0x0510
ori r14, r14, 0x6973
stw r14, 0x74(r16)

lis r14, 0x0505
ori r14, r14, 0x0505
stw r14, 0x78(r16)

lis r14, 0x5374
ori r14, r14, 0x6172
stw r14, 0x7C(r16)

lis r14, 0x101E
ori r14, r14, 0x0810
stw r14, 0x80(r16)

lis r14, 0x676F
ori r14, r14, 0x6573
stw r14, 0x84(r16)

lis r14, 0x1074
ori r14, r14, 0x6F10
stw r14, 0x88(r16)

# Check if r15 is X
cmpwi r15, 0
beq .write_blue3
cmpwi r15, 1
beq .write_red3
cmpwi r15, 2
beq .write_char3
cmpwi r15, 3
beq end
cmpwi r15, 4
beq .write_bowser3
cmpwi r15, 5
beq .write_chance3
cmpwi r15, 6
beq .write_donkey3
cmpwi r15, 7
beq .write_coin3
cmpwi r15, 8
beq .write_orb3
cmpwi r15, 9
beq .write_minigame3

.write_blue3:
lis r15, BLUE_STAR_3@h  # Load upper 16 bits of MINIGAME into r15
ori r15, r15, BLUE_STAR_3@l  # Load lower 16 bits of MINIGAME into r15

lis r14, 0x1E05
ori r14, r14, 0x426C
stw r14, 0(r16)

lis r14, 0x7565
ori r14, r14, 0x0505
stw r14, 4(r16)

lis r14, 0x0505
ori r14, r14, 0x0510
stw r14, 8(r16)

lis r14, 0x1E05
ori r14, r14, 0x426C
stw r14, 0x6C(r16)

lis r14, 0x7565
ori r14, r14, 0x0505
stw r14, 0x70(r16)

lis r14, 0x0505
ori r14, r14, 0x0510
stw r14, 0x74(r16)

b .write_3

.write_red3:
lis r15, RED_STAR_3@h  # Load upper 16 bits of MINIGAME into r15
ori r15, r15, RED_STAR_3@l  # Load lower 16 bits of MINIGAME into r15

lis r14, 0x1E05
ori r14, r14, 0x5265
stw r14, 0(r16)

lis r14, 0x6405
ori r14, r14, 0x0505
stw r14, 4(r16)

lis r14, 0x0505
ori r14, r14, 0x0510
stw r14, 8(r16)

lis r14, 0x5264
ori r14, r14, 0x426C
stw r14, 0x6C(r16)

lis r14, 0x6405
ori r14, r14, 0x0505
stw r14, 0x70(r16)

lis r14, 0x0505
ori r14, r14, 0x0510
stw r14, 0x74(r16)
b .write_3

.write_char3:
lis r15, CHAR_SPACE_STAR@h 
ori r15, r15, CHAR_SPACE_STAR@l

lis r14, 0x1E05
ori r14, r14, 0x4368
stw r14, 0(r16)

lis r14, 0x6172
ori r14, r14, 0x6163
stw r14, 4(r16)

lis r14, 0x7465
ori r14, r14, 0x7210
stw r14, 8(r16)

lis r14, 0x1E05
ori r14, r14, 0x4368
stw r14, 0x6C(r16)

lis r14, 0x6172
ori r14, r14, 0x6163
stw r14, 0x70(r16)

lis r14, 0x7465
ori r14, r14, 0x7210
stw r14, 0x74(r16)
b .write_3

.write_happening3:
lis r15, HAPPENING_STAR_3@h  # Load upper 16 bits of HAPPENING_STAR_3 into r15
ori r15, r15, HAPPENING_STAR_3@l  # Load lower 16 bits of HAPPENING_STAR_3 into r15

lis r14, 0x1E05
ori r14, r14, 0x4861
stw r14, 0(r16)

lis r14, 0x7070
ori r14, r14, 0x656E
stw r14, 4(r16)

lis r14, 0x696E
ori r14, r14, 0x6710
stw r14, 8(r16)

lis r14, 0x5264
ori r14, r14, 0x426C
stw r14, 0x6C(r16)

lis r14, 0x6405
ori r14, r14, 0x0505
stw r14, 0x70(r16)

lis r14, 0x0505
ori r14, r14, 0x0510
stw r14, 0x74(r16)
b .write_3

.write_bowser3:
lis r15, BOWSER_STAR_3@h  # Load upper 16 bits of BOWSER_STAR_3 into r15
ori r15, r15, BOWSER_STAR_3@l  # Load lower 16 bits of BOWSER_STAR_3 into r15

lis r14, 0x1E05
ori r14, r14, 0x426F
stw r14, 0(r16)

lis r14, 0x7773
ori r14, r14, 0x6572
stw r14, 4(r16)

lis r14, 0x0505
ori r14, r14, 0x0510
stw r14, 8(r16)

lis r14, 0x1E05
ori r14, r14, 0x426F
stw r14, 0x6C(r16)

lis r14, 0x7773
ori r14, r14, 0x6572
stw r14, 0x70(r16)

lis r14, 0x0505
ori r14, r14, 0x0510
stw r14, 0x74(r16)
b .write_3

.write_chance3:
lis r15, CHANCE_STAR_3@h  # Load upper 16 bits of CHANCE_STAR_3 into r15
ori r15, r15, CHANCE_STAR_3@l  # Load lower 16 bits of CHANCE_STAR_3 into r15\

lis r14, 0x1E05
ori r14, r14, 0x4368
stw r14, 0(r16)

lis r14, 0x616E
ori r14, r14, 0x6365
stw r14, 4(r16)

lis r14, 0x0505
ori r14, r14, 0x0510
stw r14, 8(r16)

lis r14, 0x1E05
ori r14, r14, 0x4368
stw r14, 0x6C(r16)

lis r14, 0x616E
ori r14, r14, 0x6365
stw r14, 0x70(r16)

lis r14, 0x0505
ori r14, r14, 0x0510
stw r14, 0x74(r16)
b .write_3

.write_donkey3:
lis r15, DONKEY_STAR_3@h  # Load upper 16 bits of DONKEY_STAR_3 into r15
ori r15, r15, DONKEY_STAR_3@l  # Load lower 16 bits of DONKEY_STAR_3 into r15

lis r14, 0x1E05
ori r14, r14, 0x444B
stw r14, 0(r16)

lis r14, 0x0505
ori r14, r14, 0x0505
stw r14, 4(r16)

lis r14, 0x0505
ori r14, r14, 0x0510
stw r14, 8(r16)

lis r14, 0x1E05
ori r14, r14, 0x444B
stw r14, 0x6C(r16)

lis r14, 0x0505
ori r14, r14, 0x0505
stw r14, 0x70(r16)

lis r14, 0x0505
ori r14, r14, 0x0510
stw r14, 0x74(r16)
b .write_3

.write_coin3:
lis r15, COIN_STAR_3@h  # Load upper 16 bits of COIN_STAR_3 into r15
ori r15, r15, COIN_STAR_3@l  # Load lower 16 bits of COIN_STAR_3 into r15

lis r14, 0x1E05
ori r14, r14, 0x436F
stw r14, 0(r16)

lis r14, 0x696E
ori r14, r14, 0x0505
stw r14, 4(r16)

lis r14, 0x0505
ori r14, r14, 0x0510
stw r14, 8(r16)

lis r14, 0x1E05
ori r14, r14, 0x436F
stw r14, 0x6C(r16)

lis r14, 0x696E
ori r14, r14, 0x0505
stw r14, 0x70(r16)

lis r14, 0x0505
ori r14, r14, 0x0510
stw r14, 0x74(r16)
b .write_3

.write_minigame3:
lis r15, MINIGAME_STAR_3@h  # Load upper 16 bits of ORB_STAR_3 into r15
ori r15, r15, MINIGAME_STAR_3@l  # Load lower 16 bits of ORB_STAR_3 into r15

lis r14, 0x1E05
ori r14, r14, 0x4D69
stw r14, 0(r16)

lis r14, 0x6E69
ori r14, r14, 0x3D67
stw r14, 4(r16)

lis r14, 0x616D
ori r14, r14, 0x6510
stw r14, 8(r16)

lis r14, 0x1E05
ori r14, r14, 0x4D69
stw r14, 0x6C(r16)

lis r14, 0x6E69
ori r14, r14, 0x3D67
stw r14, 0x70(r16)

lis r14, 0x616D
ori r14, r14, 0x6510
stw r14, 0x74(r16)
b .write_3

.write_3:
lis r17, STAR_TYPE_3@h
ori r17, r17, STAR_TYPE_3@l
stw r15, 0(r17)
lis r15, 0x7C06
ori r15, r17, 0x0378
stw r15, 4(r17)

end:
li r14, 0
li r15, 0
li r16, 0
li r17, 0

actually_end:
li r3, 0