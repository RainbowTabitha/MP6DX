#To be overwritten at 801d644c

cmpwi r4, 0x578 #Compare r4 with (Capsule used ID multiplied by 0x1C), in this case Debug Cam's 
bne not_custom_orb

lis r3, 0x8014
ori r3, r3, 0xBA78
mtctr r3
bctrl #Execute NightDay change func

lis r3, 0x801D
ori r3, r3, 0x6518
mtctr r3
bctr #Go to end of custom orb func now


not_custom_orb:
lwz r3, 0 (r3) #Execute original instruction
