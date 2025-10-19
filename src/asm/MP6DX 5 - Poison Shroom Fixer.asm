#To be inserted at 8019F538

mr r20, r3 # backup cur player id

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

p4Target:
li r3, 3
b end

p1Target:
li r3, 0
b end

p2Target:
li r3, 1
b end

p3Target:
li r3, 2

end: