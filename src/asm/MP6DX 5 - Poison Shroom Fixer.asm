#To be inserted at 8019F538

lis r14, 0x8026
ori r14, r14, 0x5B7A
lbz r15, 0(r14)
lis r14, 0x8028
ori r14, r14, 0x9871
mulli r15, r15, 0x8
add r14, r14, r15
lbz r16, 0(r14)
li r14, 0x0
cmpwi r16, 0x88
beq- loc_0x54
addi r14, r14, 0x1
cmpwi r16, 0x82
beq- jump
addi r14, r14, 0x1
cmpwi r16, 0x84
beq- jump
addi r14, r14, 0x1
cmpwi r16, 0x81
beq- jump
b end

jump:
stw r14, 0(r31)

end:
li r5, 0x0
li r14, 0x0
li r15, 0x0
li r16, 0x0

