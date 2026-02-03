#!/bin/bash
set -e

# --- CONFIGURATION ---
# Check where your files are inside the seed folder.
# If your host folder looks like: cs2-seed/game/csgo/cfg/...
# Then keep SEED_DIR as is.
SEED_DIR="/seed/game/csgo"

# FIX: Change destination from ".../game" to ".../game/csgo"
GAME_DIR="/home/steam/cs2-dedicated/game/csgo"

echo "[pre.sh] Starting mod seeding process..."
echo "[pre.sh] Source: $SEED_DIR"
echo "[pre.sh] Dest:   $GAME_DIR"

if [ -d "$SEED_DIR" ]; then
    # Create the destination directory if it doesn't exist (just in case)
    mkdir -p "$GAME_DIR"
    
    # Copy contents recursively (-r), usually overwrite (-f) or update (-u)
    # We use 'cp -rT' if available to treat source as the contents, 
    # but standard 'cp -r' with / at the end works safely here.
    cp -r "$SEED_DIR/." "$GAME_DIR/"
    
    echo "[pre.sh] Mod seeding completed."
    
    # Optional: Verify file placement
    echo "[pre.sh] DEBUG: Listing destination root..."
    ls -d "$GAME_DIR"/* | head -n 5
else
    echo "[pre.sh] WARNING: No seed files found in $SEED_DIR."
    echo "[pre.sh] Please check your host folder structure."
fi
