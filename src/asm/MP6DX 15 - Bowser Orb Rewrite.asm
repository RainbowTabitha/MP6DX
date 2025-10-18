#To be injected at 0x801BE730

mr r20, r3 # backup cur player id


lis r19, 0x802C
ori r19, r19, 0x0257
lbz r19, 0(r19)

cmpwi r19, 0x7B
beq treetop

cmpwi r19, 0x7C
beq egadd

cmpwi r19, 0x7D
beq faire

cmpwi r19, 0x7E
beq snowflake

cmpwi r19, 0x7F
beq bay

cmpwi r19, 0x80
beq castle

b og

treetop:
lis r19, 0x805E
ori r19, r19, 0xF338
cmpw r19, r1
bne og
b reroll

egadd:
lis r19, 0x805F
ori r19, r19, 0xA9D8
cmpw r19, r1
bne og
b reroll

faire:
lis r19, 0x805E
ori r19, r19, 0x91B8
cmpw r19, r1
bne og
b reroll

snowflake:
lis r19, 0x805E
ori r19, r19, 0xCC38
cmpw r19, r1
bne og
b reroll

bay:
lis r19, 0x8061
ori r19, r19, 0xC698
cmpw r19, r1
bne og
b reroll

castle:
lis r19, 0x805E
ori r19, r19, 0x3C18
cmpw r19, r1
bne og

reroll:
lis r29, 0x8003
ori r29, r29, 0xFCD4
mtctr r29
li r3, 3
bctrl # run frandmod

cmpw r3, r20 # if player id matches frandmod
beq reroll

cmpwi r3, 1 # if frandmod = 0
beq p1Target

cmpwi r3, 2 # if frandmod = 1
beq p2Target

cmpwi r3, 3 # if frandmod = 2
beq p3Target

cmpwi r3, 4 # if frandmod = 3
beq p4Target

p1Target:
li r29, 0
b end

p2Target:
li r29, 1
b end

p3Target:
li r29, 2
b end

p4Target:
li r29, 3
b end

og:
lwz r29, 0(r28) # og instr

end:
li r19, 0
li r20, 0