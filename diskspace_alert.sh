#!/bin/bash

# Function to check disk space
check_disk_space() {
    # Get available disk space in percentage
    disk_space=$(df -h / | awk 'NR==2 {print $5}' | cut -d'%' -f1)

    # Threshold for disk space utilization (adjust as needed)
    threshold=25

    # Check if disk space exceeds the threshold
    if [ "$disk_space" -ge "$threshold" ]; then
        return 1  # Disk space is critically low
    else
        return 0  # Disk space is normal
    fi
}

# Function to send email
send_email() {
    sender="abc@gmail.com"       # Your email address
    receiver="xyz@gmail.com"     # Recipient's email address
    gapp="yqic unmr sydl nqfz"   # Your Google App password
    sub="Disk Space Alert"
    body="Disk space is critically low. Please take necessary action."

    # Sending email using curl
    response=$(curl -s --url 'smtps://smtp.gmail.com:465' --ssl-reqd \
        --mail-from "$sender" \
        --mail-rcpt "$receiver" \
        --user "$sender:$gapp" \
        -T <(echo -e "From: $sender\nTo: $receiver\nSubject: $sub\n\n$body"))

    if [ $? -eq 0 ]; then
        echo "Email sent successfully."
    else
        echo "Failed to send email."
        echo "Response: $response"
    fi
}

# Main script
check_disk_space
if [ $? -eq 1 ]; then
    send_email
fi
