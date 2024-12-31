@echo off

rmdir /S /Q dist
mkdir tmp
mkdir dist
mkdir dist\store
"compiler/codewrite/powerpc-gekko-as.exe" -a32 -mbig -mregnames -mgekko "src/asm/MP6DX 1 - CPU Can Use All Orbs.asm" && python "compiler/gecko.py" a.out 801C986C tmp/1.txt1
"compiler/codewrite/powerpc-gekko-as.exe" -a32 -mbig -mregnames -mgekko "src/asm/MP6DX 2 - Duel Orb Fixer.asm" && python "compiler/gecko.py" a.out 801B9C60 tmp/2.txt1
"compiler/codewrite/powerpc-gekko-as.exe" -a32 -mbig -mregnames -mgekko "src/asm/MP6DX 3 - Pink Boo Orb Fixer.asm" && python "compiler/gecko.py" a.out 801B1C60 tmp/3.txt1
"compiler/codewrite/powerpc-gekko-as.exe" -a32 -mbig -mregnames -mgekko "src/asm/MP6DX 4 - Night Day Orb Mod.asm" && python "compiler/gecko.py" a.out 801D644C tmp/4.txt1
"compiler/codewrite/powerpc-gekko-as.exe" -a32 -mbig -mregnames -mgekko "src/asm/MP6DX 5 - Poison Shroom Fixer.asm" && python "compiler/gecko.py" a.out 8019F538 tmp/5.txt1
"compiler/codewrite/powerpc-gekko-as.exe" -a32 -mbig -mregnames -mgekko "src/asm/MP6DX 6 - Debug Custom Orb Enabler.asm" && python "compiler/gecko.py" a.out 80249B14 tmp/6.txt1 -ow 
"compiler/codewrite/powerpc-gekko-as.exe" -a32 -mbig -mregnames -mgekko "src/asm/MP6DX 7 - Misc1.asm" && python "compiler/gecko.py" a.out 80249C7C tmp/7.txt1 -ow 
"compiler/codewrite/powerpc-gekko-as.exe" -a32 -mbig -mregnames -mgekko "src/asm/MP6DX 8 - Misc2.asm" && python "compiler/gecko.py" a.out 8024ABB0 tmp/8.txt1 -ow 
"compiler/codewrite/powerpc-gekko-as.exe" -a32 -mbig -mregnames -mgekko "src/asm/MP6DX 9 - Misc3.asm" && python "compiler/gecko.py" a.out 8024AEB0 tmp/9.txt1 -ow 

del a.out

cd tmp
echo.$MP6DX >> ..\dist\store\codes.txt
for %%f in (*.txt1) do (
    type "%%f" >> ..\dist\store\codes.txt
    echo. >> ..\dist\store\codes\codes.txt
)

cd ..
xcopy /E /I tools dist\tools
xcopy /E /I src\files dist\store\files
copy src\patch.bat dist\
rmdir /S /Q tmp