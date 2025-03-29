#!/bin/sh

# Правим командите в toybox налични
export PATH="$1/bin"

# Променливи за по-удобно четене
bash="$2/bin/bash" name="$3" text="$4" path="$5"

# Създаваме /nix/store/HASH-page_lines/bin
mkdir -p "$out/bin"

# Създаваме /nix/store/HASH-page_lines/bin/page_lines
cat <<EOF > "$out/bin/$name"
#!$bash

export PATH="$path:\$PATH"

$text
EOF

# Правим /nix/store/HASH-page_lines/bin/page_lines изпълним
chmod +x "$out/bin/$name"
