#!/bin/bash

# Collect all the .c files in the current directory
c_files=$(find . -maxdepth 1 -type f -name "*.c")

# Compile each .c file and generate corresponding object files
for file in $c_files; do
    gcc -c "$file" -o "${file%.c}.o"
done

# Create the static library using ar
ar rcs liball.a *.o

# Clean up the generated object files
rm -f *.o
