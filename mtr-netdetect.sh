#!/bin/bash

host=${1:-google.com}
packet_count=5
packet_interval=0.5
row_limit=10
refresh_interval=10

# Define color codes
GREEN='\033[0;32m'
RED='\033[0;31m'
ORANGE='\033[0;33m'
WHITE='\033[0;37m'
NC='\033[0m' # No color

# Function to format and display rows with fixed-width columns and colors
format_row() {
    printf " %-4s | ${GREEN}%-22s${NC} | ${RED}%-7s${NC} | ${GREEN}%-5s${NC} | ${ORANGE}%-7s${NC} | ${ORANGE}%-7s${NC} | %-7s | ${RED}%-7s${NC} | %-18s | %-18s\n" \
    "${1:-N/A}" "${2:-N/A}" "${3:-N/A}" "${4:-N/A}" "${5:-N/A}" "${6:-N/A}" "${7:-N/A}" "${8:-N/A}" "${9:-N/A}" "${10:-N/A}"
}

# Display welcome message
print_welcome_message() {
    tput clear
    echo "============================================================================================================================"
    echo "                                      Welcome to MTR NetDetect"
    echo "                                     Developer: Sergio Marquina"
    echo "                                         Date: $(date +"%m/%d/%Y")"
    echo "============================================================================================================================"
}

# Print table header
print_table_header() {
    echo " Hops  | Host                   | Loss%   | Sent  | Last    | Avg     | Best    | Wrst    | Country            | State"
    echo "============================================================================================================================"
}

# Update a specific row
update_row() {
    row=$1
    shift
    tput cup $((row + 6))
    format_row "$@"
}

# Parse MTR output
parse_mtr_output() {
    local row=1
    sudo mtr -n -r -c "$packet_count" --interval "$packet_interval" "$host" | tail -n +2 | while read -r line; do
        if [[ $row -gt $row_limit ]]; then
            break
        fi

        hop=$(echo "$line" | awk '{print $1}')
        ip=$(echo "$line" | awk '{print $2}')
        loss=$(echo "$line" | awk '{print $3}')
        sent=$packet_count
        last=$(echo "$line" | awk '{print $5}')
        avg=$(echo "$line" | awk '{print $6}')
        best=$(echo "$line" | awk '{print $7}')
        worst=$(echo "$line" | awk '{print $8}')

        if [[ $ip == "???" || $ip == "" ]]; then
            continue
        fi

        # Fetch geolocation data using ipwhois.app
        response=$(curl -s "https://ipwhois.app/json/$ip")
        country=$(echo "$response" | jq -r ".country // \"N/A\"")
        state=$(echo "$response" | jq -r ".region // \"N/A\"")

        # Update row with parsed data
        update_row "$row" "$hop" "$ip" "$loss" "$sent" "$last" "$avg" "$best" "$worst" \
        "$country" "$state"

        ((row++))
    done
    wait
}

# Cleanup on exit
cleanup() {
    tput clear
    echo ""
    exit 0
}

# Main function
main() {
    trap cleanup SIGINT
    print_welcome_message
    print_table_header

    while true; do
        tput cup 7 0
        for i in $(seq 1 $row_limit); do
            update_row "$i" "N/A" "N/A" "N/A" "N/A" "N/A" "N/A" "N/A" "N/A" "N/A" "N/A"
        done
        parse_mtr_output
        sleep "$refresh_interval"
    done
}

main
