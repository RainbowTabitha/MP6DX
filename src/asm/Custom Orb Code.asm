# Insert at 801d644c

cmpwi r4, 0x578 #Compare r4 with (Capsule used ID multiplied by 0x1C) 
beq dayNightOrb

cmpwi r4, 0x594 #Compare r4 with (Capsule used ID multiplied by 0x1C)
beq chompyOrb

cmpwi r4, 0x5B0 #Compare r4 with (Capsule used ID multiplied by 0x1C)
beq wackyWatchOrb

b notCustomOrb

dayNightOrb:
lis r3, 0x8014 # MBTimeRefresh@h
ori r3, r3, 0xBA78 # MBTimeRefresh@l
mtctr r3
bctrl # run function
b finishCustomCapsule

chompyOrb:
lis r3, 0x802C # StarMoveHook@h
ori r3, r3, 0x0E6C # StarMoveHook@l
lwz r3, 0(r3) # Load pointer StarMoveHook to StarMoveHook
mtctr r3
bctrl # run function
b finishCustomCapsule

wackyWatchOrb:
lis r3, 0x8026 # MaxTurn byte
ori r3, r3, 0x5B74 # MaxTurn byte
lbz r19, 1(r3) # load in MaxTurn to r19
subi r19, r19, 5 # right before last 5
stb r19, 0(r3)
b finishCustomCapsule

finishCustomCapsule:
lis r3, 0x801D
ori r3, r3, 0x6518
mtctr r3
bctr # Go to end of Orb Function

notCustomOrb:
lwz r3, 0(r3) # Execute original instruction
