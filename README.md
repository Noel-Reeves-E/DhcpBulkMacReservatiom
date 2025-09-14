# DhcpBulkMacReservation
This Script helps to create multiple MAC reservation in MS DHCP server remotely.

This repository provides a simple way to add and delete DHCP reservations on a Windows DHCP server using PowerShell and a CSV file.

📂 Files
MacList.csv
-----------
CSV file containing reservation details.

Columns:
IpAddress → The IP address to reserve
MacAddress → The client MAC address (no separators, e.g. aabbccddeeff)
Name → Reservation name (usually hostname)
Description → A short description of the device
DeleteMac → MAC address used when deleting reservations


DhcpScript.ps1
--------------
PowerShell script with a menu for managing DHCP reservations.

Features:
Add Reservation → Imports from MacList.csv and adds reservations.
Delete Reservation MAC → Deletes reservations listed in DeleteMac column.
Delete All Reservations in Scope → Removes every reservation in the specified scope.
Exit → Ends the script.

DhcpReservation.bat
-------------------
Batch file to easily launch the PowerShell script:

PowerShell.exe -NoProfile -ExecutionPolicy Bypass -File "C:\Script\DhcpScript.ps1"

Run this .bat file to start the reservation menu without opening PowerShell manually.


🚀 Usage
Place all files in a folder and adjust paths inside the scripts.
Edit MacList.csv with your reservation details.
Double-click DhcpReservation.bat.
Choose an option from the menu.

⚠️ Requirements
Windows Server with DHCP role installed.
PowerShell with DhcpServer module available.

📝 Notes
MAC addresses in the CSV should be in compact format (aabbccddeeff).
The script will automatically format them to aa-bb-cc-dd-ee-ff.