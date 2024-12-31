#To be inserted at 801C986C
#CPUs normally can't use orbs with an ID of 0x20 or higher. This code allows them to use them.
#If r0 and r20 have the same value, CPUs use the orb. Hence enabling them to use an orb works by copying the value of r20 into r0.
cmpwi r20, 0x20
blt end

#Check current time, goto end if PinkBoo and not Nighttime
lis r3, 0x8026
ori r3, r3, 0x5B80
lbz r3, 0 (r3)

#Check if it's nighttime before using the Boo Orb
cmpwi r20, 0x2E
beq boo_test

#Let the CPU use the orb if it gets there.
b enable_orb

#Boo test. Since the Boo Orb does nothing at daytime, check if it's nighttime first. If it is, let the CPUs use the Boo orb. If it isn't, don't let them use it.
boo_test:
cmpwi r3, 0x40
beq enable_orb

cmpwi r3, 0xC0
beq enable_orb

cmpwi r3, 0xF0
beq enable_orb
b end

enable_orb:
mr r0, r20

end:
#Execute original instruction
cmpw r0, r20