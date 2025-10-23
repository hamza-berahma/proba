#!/bin/bash

REPO_DIR="/home/hamza/projects/proba"
LOG_FILE="$REPO_DIR/auto_commit.log"

cd "$REPO_DIR" || exit

# Only commit if there are changes
if ! git diff-index --quiet HEAD --; then
    git add .
    git commit -m "Auto commit: $(date '+%Y-%m-%d %H:%M:%S')"
    git push origin main >> "$LOG_FILE" 2>&1
    echo "$(date '+%Y-%m-%d %H:%M:%S') - Changes committed and pushed." >> "$LOG_FILE"
else
    echo "$(date '+%Y-%m-%d %H:%M:%S') - No changes to commit." >> "$LOG_FILE"
fi
