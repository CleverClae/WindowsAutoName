Computer Rename Script

This PowerShell script renames a computer to include its OU names and serial number, and prompts the user for domain administrator credentials to perform the rename. The new computer name is generated in the following format:

OU1-OU2-WXXXXXXX

Where OU1 and OU2 are the names of the first and third organizational units (OUs) that the computer is a member of, and XXXXXXX is the seven-character serial number of the computer. The script assumes that the computer is already joined to a domain.

Usage

Copy the script to the computer that you want to rename.
Open PowerShell as an administrator and navigate to the folder where the script is located.
Run the script by entering .\autoname.ps1 and pressing Enter.
A message box will appear asking you to confirm the computer rename. Click OK to continue or Cancel to cancel the rename.
If you click OK, another message box will appear asking you to enter your domain administrator credentials. Enter the credentials and click OK.
The computer will be renamed and restarted.

Requirements

PowerShell 5.1 or later.
The computer must be joined to a domain.
The Active Directory Lightweight Directory Services (AD LDS) feature must be installed on the computer. The script will install it if it isn't already installed.

Disclaimer

This script is provided as-is without any warranty or support. Use at your own risk.
