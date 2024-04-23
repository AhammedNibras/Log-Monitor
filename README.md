# Log File Analysis and Monitoring Script

This Bash script monitors a specified log file for new entries and performs basic log analysis.

## Usage
- Clone or download the script from the GitHub repository.
- Set the log file path in the script to the desired log file location.
- Make the script executable using the following command: chmod 777 log-monitor.sh
- Run the script using './log-monitor.sh'.

## Testing
- Deploy the script on an Ubuntu EC2 instance or any other Linux environment.
- Check the log file path and ensure it exists.
- Run the script and observe the real-time monitoring and log analysis.

## Expected Output
- The script will perform basic analysis on log entries, including counting occurrences of INFO, WARNING, and ERROR messages.
- It will display the top 5 messages for each log level.
- It will continuously monitor the log file and display new log entries.


