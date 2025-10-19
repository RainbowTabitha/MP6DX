# Insert at 80500180

start:
lis r14, 0x802C
ori r14, r14, 0x254
cmpwi r14, 0x7A
beq startBlockCheck
cmpwi r14, 0x7B
beq startBlockCheck
b end

startBlockCheck:
lis r14, 0x8026
ori r14, r14, 0x575C
lhz r15, 0(r14)
lhz r16, 264(r14)
lhz r17, 528(r14)
lhz r14, 792(r14)
addi r14, r14, 0x1
addi r15, r15, 0x1
addi r16, r16, 0x1
addi r17, r17, 0x1
lis r19, 0x802C
ori r19, r19, 0xE44
lwz r19, 0(r19)
mulli r14, r14, 0x70
mulli r15, r15, 0x70
mulli r16, r16, 0x70
mulli r17, r17, 0x70
add r14, r14, r19
add r15, r15, r19
add r16, r16, r19
add r17, r17, r19
addi r14, r14, 0x30
addi r15, r15, 0x30
addi r16, r16, 0x30
addi r17, r17, 0x30
lhz r14, 0(r14)
lhz r15, 0(r15)
lhz r16, 0(r16)
lhz r17, 0(r17)
cmplwi r14, 7
beq runBlock
cmplwi r15, 7
beq runBlock
cmplwi r16, 7
beq runBlock
cmplwi r17, 7
beq runBlock
b end

runBlock:
lis r14, 0x8026
ori r14, r14, 0x5B91
lbz r15, 0(r14)
addi r15, r15, 0x1
stb r15, 0(r14)
b start

end:
li r17, 0x0
li r19, 0x0
li r16, 0x0
li r15, 0x0
li r14, 0x0
li r3, 0x80