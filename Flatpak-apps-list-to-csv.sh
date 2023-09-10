#!/bin/bash

flatpak_output=$(flatpak list)

csv_file="flatpak_apps.csv"

if [ -n "$flatpak_output" ]; then
    # Extract the relevant columns using awk and format as CSV
    echo "$flatpak_output" | awk 'NR == 1 {gsub(/\t/, ","); print; next} {gsub(/\t/, ","); print}' > "$csv_file"
    echo "Flatpak apps data has been written to $csv_file"
else
    echo "Error"
fi