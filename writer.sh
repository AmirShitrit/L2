#!/bin/bash

# Set the log file path
LOG_FILE=$1

# Function to handle script termination gracefully
cleanup() {
    echo "$(date)" >> "$LOG_FILE"
    exit 0
}

# Trap SIGINT (Ctrl+C) and SIGTERM to cleanup gracefully
trap cleanup SIGINT SIGTERM

echo "$(date): Starting datetime logger..." >> "$LOG_FILE"
echo "Logging to: $LOG_FILE"
echo "Press Ctrl+C to stop"

# Main logging loop
while true; do
    echo "$(date)" >> "$LOG_FILE"
    sleep 10
done