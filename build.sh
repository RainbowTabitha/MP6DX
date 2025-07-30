#!/bin/bash

# Create directories
mkdir -p tmp
mkdir -p dist
mkdir -p dist/store

# Compile and process assembly files
wine "compiler/codewrite/powerpc-gekko-as.exe" -a32 -mbig -mregnames -mgekko "src/asm/MP6DX 1 - CPU Can Use All Orbs.asm" && python "compiler/gecko.py" a.out 801C986C tmp/1.txt1
wine "compiler/codewrite/powerpc-gekko-as.exe" -a32 -mbig -mregnames -mgekko "src/asm/MP6DX 2 - Duel Orb Fixer.asm" && python "compiler/gecko.py" a.out 801B9C60 tmp/2.txt1
wine "compiler/codewrite/powerpc-gekko-as.exe" -a32 -mbig -mregnames -mgekko "src/asm/MP6DX 3 - Pink Boo Orb Fixer.asm" && python "compiler/gecko.py" a.out 801B1C60 tmp/3.txt1
wine "compiler/codewrite/powerpc-gekko-as.exe" -a32 -mbig -mregnames -mgekko "src/asm/MP6DX 4 - Custom Orbs.asm" && python "compiler/gecko.py" a.out 801D644C tmp/4.txt1
wine "compiler/codewrite/powerpc-gekko-as.exe" -a32 -mbig -mregnames -mgekko "src/asm/MP6DX 5 - Poison Shroom Fixer.asm" && python "compiler/gecko.py" a.out 8019F538 tmp/5.txt1
wine "compiler/codewrite/powerpc-gekko-as.exe" -a32 -mbig -mregnames -mgekko "src/asm/MP6DX 6 - Debug Custom Orb Enabler.asm" && python "compiler/gecko.py" a.out 80249B14 tmp/6.txt1 -ow 
wine "compiler/codewrite/powerpc-gekko-as.exe" -a32 -mbig -mregnames -mgekko "src/asm/MP6DX 7 - Misc1.asm" && python "compiler/gecko.py" a.out 80249C7C tmp/7.txt1 -ow 
wine "compiler/codewrite/powerpc-gekko-as.exe" -a32 -mbig -mregnames -mgekko "src/asm/MP6DX 8 - Pink Boo Orb Color.asm" && python "compiler/gecko.py" a.out 8024ABB8 tmp/8.txt1 -ow 
wine "compiler/codewrite/powerpc-gekko-as.exe" -a32 -mbig -mregnames -mgekko "src/asm/MP6DX 9 - Misc3.asm" && python "compiler/gecko.py" a.out 8024AEB0 tmp/9.txt1 -ow 

# Copy the text file
cp "src/asm/MP6DX 10 - Orb Tables.txt" tmp/10.txt1

# Remove the temporary object file
rm -f a.out

# Change to tmp directory and process files
cd tmp
echo "$MP6DX" >> ../dist/store/codes.txt
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

echo "Build completed successfully!"
