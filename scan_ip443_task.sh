#!/bin/bash

set -e

while true; do
    # Get the current date in the format YYYY-MM-DD
    current_date=$(date +"%Y-%m-%d")

    # Set the output file path with the date prefix
    output_file="ip443open-$current_date.txt"
    touch "$output_file"
    # Run zmap with the desired options
    zmap -p 443 -o "$output_file" -B 100M --blacklist-file=blacklist.txt

    # Zip the output file
    zip "$output_file.zip" "$output_file"

    # Git commands to add, commit, and push
    git add "$output_file.zip"
    git commit -m "Update by bot: Compressed $output_file"
    git push origin main  # Assuming your branch is named 'main', adjust if necessary

    # Optionally, you can add more commands or actions here after running Git commands
    # For example, you might want to process the output file or perform other tasks.
    # echo "Zmap scan completed!"

    # Sleep for a while before the next iteration (adjust the sleep duration as needed)
    sleep 5m
done
