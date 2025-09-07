#!/bin/bash

# Set the log file path

# Function to handle script termination gracefully
cleanup() {
    echo "$(date)"
    exit 0
}

# Trap SIGINT (Ctrl+C) and SIGTERM to cleanup gracefully
trap cleanup SIGINT SIGTERM

# Main logging loop
while true; do
    echo "$(date)"
    sleep 10
done