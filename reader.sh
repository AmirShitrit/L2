#!/bin/bash

# Set the log file path (should match the logger script)
LOG_FILE=$1

# Function to handle script termination gracefully
cleanup() {
    echo "Log reader terminated"
    exit 0
}

# Trap SIGINT (Ctrl+C) and SIGTERM to cleanup gracefully
trap cleanup SIGINT SIGTERM

echo "Reading from: $LOG_FILE"
echo "Checking every 7 seconds..."
echo "Press Ctrl+C to stop"
echo "---"

# Main reading loop
while true; do
    # Check if log file exists
    if [[ -f "$LOG_FILE" ]]; then
        # Read the last line and print it
        last_line=$(tail -n 1 "$LOG_FILE")
        if [[ -n "$last_line" ]]; then
            echo "Last entry: $last_line"
        else
            echo "Log file is empty"
        fi
    else
        echo "Log file not found: $LOG_FILE"
    fi
    
    sleep 7
done