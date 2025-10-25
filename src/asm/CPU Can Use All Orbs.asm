# Insert at 801C986C
#CPUs normally can't use orbs with an ID of 0x20 or higher. This code allows them to use them.
#If r0 and r20 have the same value, CPUs use the orb. Hence enabling them to use an orb works by copying the value of r20 into r0.
cmpwi r20, 0x20
blt end
b enable_orb

enable_orb:
mr r0, r20

end:
#Execute original instruction
cmpw r0, r20