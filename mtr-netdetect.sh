#!/bin/bash
host=${1:-google.com}
api_key="API-KEY HERE"  # Your API key
packet_count=5  # Number of packets to send per hop
packet_interval=0.5  # Reduce time interval for faster updates
row_limit=15  # Limit the number of hops displayed to 15

# Function to format and display rows with fixed-width columns
format_row() {
    printf " %-4s | %-22.22s | %-7s | %-5s | %-7s | %-7s | %-7s | %-7s | %-7s | %-18.18s | %-12.12s | %-18.18s | %-3s | %-10.10s | %-4s\n" \
    "$1" "$2" "$3" "$4" "$5" "$6" "$7" "$8" "$9" "${10}" "${11}" "${12}" "${13}" "${14}" "${15}"
}

# Function to display a welcome message
print_welcome_message() {
    tput clear  # Clear the screen
    echo "======================================================================================================================================================================================="
    echo "                                                                Welcome to MTR NetDetect                                          "
    echo "                                                           Developer: cybersecuritysolution                                    "
    echo "                                                                  Date: $(date +"%m/%d/%Y")                                       "
    echo "======================================================================================================================================================================================="
}

# Print table header with consistent alignment
print_table_header() {
    echo " Hops  | Host                   | Loss%   | Sent  | Last    | Avg     | Best    | Wrst    | StDev   | Country            | State        | City               | VPN | ASN        | Risk"
    echo "======================================================================================================================================================================================="
}

# Update specific row dynamically
update_row() {
    row=$1
    shift
    tput cup $((row + 6))  # Adjust rows to account for the welcome message and header
    format_row "$@"
}

# Parse MTR output
parse_mtr_output() {
    local row=1
    sudo mtr -n -r -c "$packet_count" --interval "$packet_interval" "$host" | sed '/HOST:/d' | tail -n +2 | while read -r line; do
        # Break if row limit (15 hops) is reached
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
        stdev=$(echo "$line" | awk '{print $9}')

        # Handle unresolved hosts
        if [[ ! $ip =~ ^[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+$ ]]; then
            update_row "$row" "$hop" "N/A" "N/A" "N/A" "N/A" "N/A" "N/A" "N/A" "N/A" "N/A" "N/A" "N/A" "N/A"
            ((row++))
            continue
        fi

        # Fetch ProxyCheck data asynchronously
        (
            response=$(curl -s "https://proxycheck.io/v2/$ip?key=$api_key&vpn=1&asn=1&risk=1&time=1")
            country=$(echo "$response" | jq -r ".\"$ip\".country // \"N/A\"")
            state=$(echo "$response" | jq -r ".\"$ip\".region // \"N/A\"")
            city=$(echo "$response" | jq -r ".\"$ip\".city // \"N/A\"")
            proxy=$(echo "$response" | jq -r ".\"$ip\".proxy // \"N/A\"")
            asn=$(echo "$response" | jq -r ".\"$ip\".asn // \"N/A\"")
            risk=$(echo "$response" | jq -r ".\"$ip\".risk // \"N/A\"")

            # Update the row with aligned data
            update_row "$row" "$hop" "$ip" "$loss" "$sent" "$last" "$avg" "$best" "$worst" "$stdev" \
            "$country" "$state" "$city" "$proxy" "$asn" "$risk"
        ) &
        ((row++))
    done
    wait  # Wait for all ProxyCheck.io queries to finish
}

# Cleanup function for Ctrl+C
cleanup() {
    tput clear  # Clear the screen
    echo ""
    exit 0
}

# Main function
main() {
    # Trap SIGINT (Ctrl+C) and call cleanup
    trap cleanup SIGINT
    print_welcome_message  # Display the welcome message
    print_table_header     # Print the table header
    while true; do
        parse_mtr_output
    done
}

main
