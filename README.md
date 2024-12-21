# Monitor-Disk-Space-Utilization

Monitor disk space utilization on Linux systems using Shell scripting and automate the process of sending email alerts when disk space crosses predefined thresholds. When disk space reaches critically low levels, it can lead to system crashes, data corruption, and other serious issues. Therefore, implementing a proactive approach to monitor disk space and receive alerts when thresholds are exceeded is essential for maintaining system reliability and availability.

**Explanation of the Script:**

**check_disk_space() Function:**
This function checks the disk space utilization by using the df -h / command to get information about the root file system.
It extracts the percentage of disk space used from the output using awk and cut.
The threshold for disk space utilization is set to 25% (adjustable as needed).
If the disk space exceeds the threshold, the function returns 1 indicating that disk space is critically low. Otherwise, it returns 0 indicating that disk space is normal.

**send_email() Function:**
This function sends an email alert using Gmail’s SMTP server.
It defines variables for the sender’s email address (sender), recipient’s email address (receiver), and Google App password (gapp).
The subject of the email is set to “Disk Space Alert”, and the body contains the message “Disk space is critically low. Please take necessary action.”
The email is sent using curl with the provided parameters. The response from the server is captured in the response variable.
If the email is sent successfully, it prints “Email sent successfully.” Otherwise, it prints “Failed to send email.” along with the response from the server.

**Main Script:**
The check_disk_space function is called to determine if the disk space is critically low.
If the return value of check_disk_space is 1 (indicating critically low disk space), the send_email function is called to send an email alert.
Step #4:Make file executable


**Steps to run the script:** 

Use the vi command to create a new file : 
**vi diskspace_alert.sh**

Change the file permissions to make it executable using the chmod command : 
**chmod +x diskspace_alert.sh**

Run the script by executing the following command : 
**./diskspace_alert.sh**
