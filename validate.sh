#!/bin/bash
# Run this in your mod folder (where main.lua is)

# Extract joker_defs array from main.lua
joker_defs=$(awk '/local joker_defs = {/,/}/' main.lua | grep -oE "'[A-Za-z0-9_]+'" | tr -d "'")
missing=()
for joker in $joker_defs; do
    file="jokers/${joker,,}.lua"
    if [[ ! -f "$file" ]]; then
        missing+=("$file")
    fi
done

# List all .lua files in jokers/ (lowercase, no extension)
all_files=$(find jokers -maxdepth 1 -type f -iname '*.lua' -exec basename {} .lua \; | tr '[:upper:]' '[:lower:]')
extra=()
for file in $all_files; do
    found=0
    for joker in $joker_defs; do
        if [[ "$file" == "${joker,,}" ]]; then
            found=1
            break
        fi
    done
    if [[ $found -eq 0 ]]; then
        extra+=("$file")
    fi
done

# Check for files that are not all lowercase
not_lowercase=()
while IFS= read -r f; do
    base=$(basename "$f")
    if [[ "$base" =~ [A-Z] ]]; then
        not_lowercase+=("$base")
    fi
done < <(find jokers -maxdepth 1 -type f -name '*.lua')

echo "=== Validation Results ==="
if [[ ${#missing[@]} -gt 0 ]]; then
    echo "Missing files for joker_defs:"
    for m in "${missing[@]}"; do
        echo "  $m"
    done
else
    echo "All joker_defs have corresponding files."
fi

if [[ ${#extra[@]} -gt 0 ]]; then
    echo "Extra files in jokers/ not referenced in joker_defs:"
    for e in "${extra[@]}"; do
        echo "  $e.lua"
    done
else
    echo "No extra files in jokers/."
fi

if [[ ${#not_lowercase[@]} -gt 0 ]]; then
    echo "Files in jokers/ that are not all lowercase:"
    for n in "${not_lowercase[@]}"; do
        echo "  $n"
    done
else
    echo "All files in jokers/ are lowercase."
fi