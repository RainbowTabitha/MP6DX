#!/bin/bash

# Create directories
mkdir -p tmp
mkdir -p dist
mkdir -p dist/store

# Compile and process assembly files
wine "compiler/codewrite/powerpc-gekko-as.exe" -a32 -mbig -mregnames -mgekko "src/asm/CPU Can Use All Orbs.asm" && python "compiler/gecko.py" a.out 801C986C tmp/cpu_can_use_all_orbs.txt1
wine "compiler/codewrite/powerpc-gekko-as.exe" -a32 -mbig -mregnames -mgekko "src/asm/Custom Orb Code.asm" && python "compiler/gecko.py" a.out 801D644C tmp/custom_orb_code.txt1

wine "compiler/codewrite/powerpc-gekko-as.exe" -a32 -mbig -mregnames -mgekko "src/asm/Bowser Orb/Bowser Orb Byte Checker.asm" && python "compiler/gecko.py" a.out 801BE538 tmp/bowser_orb_byte_checker.txt1
wine "compiler/codewrite/powerpc-gekko-as.exe" -a32 -mbig -mregnames -mgekko "src/asm/Bowser Orb/Bowser Orb Rewrite.asm" && python "compiler/gecko.py" a.out 801BE730 tmp/bowser_orb_rewrite.txt1
wine "compiler/codewrite/powerpc-gekko-as.exe" -a32 -mbig -mregnames -mgekko "src/asm/Bowser Orb/Bowser Orb Pointer.asm" && python "compiler/gecko.py" a.out 80249B64 tmp/bowser_orb_pointer.txt1 -ow

wine "compiler/codewrite/powerpc-gekko-as.exe" -a32 -mbig -mregnames -mgekko "src/asm/Chance Orb/Chance Orb Pointer.asm" && python "compiler/gecko.py" a.out 80249B3C tmp/chance_orb_pointer.txt1 -ow

wine "compiler/codewrite/powerpc-gekko-as.exe" -a32 -mbig -mregnames -mgekko "src/asm/Chomp Call/Chomp Call Orb Pointer.asm" && python "compiler/gecko.py" a.out 80249CA4 tmp/chomp_call_orb_pointer.txt1 -ow

wine "compiler/codewrite/powerpc-gekko-as.exe" -a32 -mbig -mregnames -mgekko "src/asm/DK and Pink Boo Orb/DK and Pink Boo Orb Shell.asm" && python "compiler/gecko.py" a.out 8024ABB8 tmp/dk_and_pink_boo_orb_shell.txt1 -ow
wine "compiler/codewrite/powerpc-gekko-as.exe" -a32 -mbig -mregnames -mgekko "src/asm/DK and Pink Boo Orb/DK Orb Pointer.asm" && python "compiler/gecko.py" a.out 80249B8C tmp/dk_orb_pointer.txt1 -ow
wine "compiler/codewrite/powerpc-gekko-as.exe" -a32 -mbig -mregnames -mgekko "src/asm/DK and Pink Boo Orb/Pink Boo Orb Fixer.asm" && python "compiler/gecko.py" a.out 801B1C60 tmp/pink_boo_orb_fixer.txt1
wine "compiler/codewrite/powerpc-gekko-as.exe" -a32 -mbig -mregnames -mgekko "src/asm/DK and Pink Boo Orb/Pink Boo Orb Pointer.asm" && python "compiler/gecko.py" a.out 80249BDC tmp/pink_boo_orb_pointer.txt1 -ow

wine "compiler/codewrite/powerpc-gekko-as.exe" -a32 -mbig -mregnames -mgekko "src/asm/Duel Orb/Duel Orb Fixer.asm" && python "compiler/gecko.py" a.out 801B9C60 tmp/duel_orb_fixer.txt1
wine "compiler/codewrite/powerpc-gekko-as.exe" -a32 -mbig -mregnames -mgekko "src/asm/Duel Orb/Duel Orb Pointer.asm" && python "compiler/gecko.py" a.out 80249B14 tmp/duel_orb_pointer.txt1 -ow

wine "compiler/codewrite/powerpc-gekko-as.exe" -a32 -mbig -mregnames -mgekko "src/asm/Soluna Orb/Soluna Orb Pointer.asm" && python "compiler/gecko.py" a.out 80249C7C tmp/soluna_orb_pointer.txt1 -ow
wine "compiler/codewrite/powerpc-gekko-as.exe" -a32 -mbig -mregnames -mgekko "src/asm/Soluna Orb/Soluna Orb Shell.asm" && python "compiler/gecko.py" a.out 8024ABBC tmp/soluna_orb_shell.txt1 -ow

wine "compiler/codewrite/powerpc-gekko-as.exe" -a32 -mbig -mregnames -mgekko "src/asm/Wacky Watch Orb/Wacky Watch Orb Pointer.asm" && python "compiler/gecko.py" a.out 80249CCC tmp/wacky_watch_orb_pointer.txt1 -ow


# Copy the text file
cp "src/asm/MP6DX 18 - Debug Orb Enablers.txt" tmp/debug_orb_enablers.txt1
cp "src/asm/MP6DX 19 - Orb Tables.txt" tmp/orb_tables.txt1

# Remove the temporary object file
rm -f a.out

# Change to tmp directory and process files
cd tmp
echo '$MP6DX' >> ../dist/store/codes.txt
for f in *.txt1; do
    if [ -f "$f" ]; then
        cat "$f" >> ../dist/store/codes.txt
        echo "" >> ../dist/store/codes.txt
    fi
done

# Return to parent directory
cd ..

# Copy tools directory
cp -r tools dist/

# Copy files directory
cp -r src/files dist/store/

# Copy patch script (convert to .sh if needed)
cp src/patch.bat dist/
cp src/patch.sh dist/

echo "Build completed successfully!"
