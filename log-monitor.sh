#!/bin/bash

# Function to handle Ctrl+C
function ctrl_c() {
    echo -e "\nMonitoring interrupted. Exiting."
    exit 0
}

# Function to analyze log file
function analyze_log() {
    echo "Analyzing log file..."
    # Count occurrences of INFO, WARNING, and ERROR messages
    info_count=$(grep -c "INFO" "$log_file")
    warning_count=$(grep -c "WARN" "$log_file")
    error_count=$(grep -c "ERROR" "$log_file")

    echo "Number of INFO messages: $info_count"
    echo "Number of WARNING messages: $warning_count"
    echo "Number of ERROR messages: $error_count"

    # Displays top messages for each type
    top_info=$(grep "INFO" "$log_file" | head -5)
    top_warning=$(grep "WARN" "$log_file" | head -5)
    top_errors=$(grep "ERROR" "$log_file" | head -5)

    echo -e "\nTop 5 INFO messages:"
    echo "$top_info"
    echo -e "\nTop 5 WARNING messages:"
    echo "$top_warning"
    echo -e "\nTop 5 ERROR messages:"
    echo "$top_errors"
}

# Main function for log monitoring
function monitor_log() {
    echo "Monitoring log file..."
    tail -n 0 -f "$log_file" | while read line; do
        echo "$line"  # Display new log entries
    done
}

# Set log file path
log_file="/var/log/syslog"

# Trap Ctrl+C
trap ctrl_c SIGINT

# Check if log file exists
if [ ! -f "$log_file" ]; then
    echo "Error: Log file $log_file does not exist."
    exit 1
fi

# Start log analysis in background
analyze_log &

# Start log monitoring
monitor_log
