#To be injected at 0x801BE538

lis r19, 0x817F
ori r19, r19, 0xFFFF
li r20, 1
stb r20, 0(r19)
stw	r31, 0x001C (sp)
li r19, 0
li r20, 0