#To be inserted at 801d644c

cmpwi r4, 0x578 #Compare r4 with (Capsule used ID multiplied by 0x1C) 
beq dayNightOrb

cmpwi r4, 0x594 #Compare r4 with (Capsule used ID multiplied by 0x1C)
beq chompyOrb
b notCustomOrb

dayNightOrb:
lis r3, 0x8014 # MBTimeRefresh@h
ori r3, r3, 0xBA78 # MBTimeRefresh@l
mtctr r3
bctrl # move the star
b finishCustomCapsule

chompyOrb:
lis r3, 0x802C # StarMoveHook@h
ori r3, r3, 0x0E6C # StarMoveHook@l
lwz r3, 0(r3) # Load pointer StarMoveHook to StarMoveHook
mtctr r3
bctrl # run func

finishCustomCapsule:
lis r3, 0x801D
ori r3, r3, 0x6518
mtctr r3
bctr # Go to end of Orb Function

notCustomOrb:
lwz r3, 0 (r3) # Execute original instruction
