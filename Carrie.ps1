# Description: Malware Analysis Victim VM
# Author: Bhavna Soman <bhavna.soman@gmail.com>
# Last Updated: 2018-08-13
#
# Install chocolatey:
#   Set-ExecutionPolicy Bypass -Scope Process -Force; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
#
# Install and run boxstarter:
#   choco install -y boxstarter
#   BoxstarterShell
# 
# Run this boxstarter package:
# 	Install-BoxstarterPackage -PackageName https://raw.githubusercontent.com/bsoman3/Meeseeks/master/Carrie.ps1 -DisableReboots
#
# Learn more: http://boxstarter.org/Learn/WebLauncher

$Boxstarter.RebootOk=$false 

#---- TEMPORARY ---
write-output "Disabling UAC"
Disable-UAC

#--- Apps ---
write-output "Installing a few apps"
choco install -y googlechrome notepadplusplus winscp 7zip

#---- RE Tools ---
write-output "Installing the RE tools"
choco install -y sysinternals winscp filezilla.commandline windbg procexp processhacker regshot tcpview dotnet4.7.1 vcredist2015 ida-free ollydbg wireshark hxd explorersuite fakenet ilspy pestudio javadecompiler-gui upx

Set-WindowsExplorerOptions -EnableShowHiddenFilesFoldersDrives -EnableShowProtectedOSFiles -EnableShowFileExtensions

# Disable Firewall
Function DisableFirewall {
    Write-Host "Disabling Firewall..."
    If (!(Test-Path "HKLM:\SOFTWARE\Policies\Microsoft\WindowsFirewall\StandardProfile")) {
        New-Item -Path "HKLM:\SOFTWARE\Policies\Microsoft\WindowsFirewall\StandardProfile" -Force | Out-Null
    }
    Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\WindowsFirewall\StandardProfile" -Name "EnableFirewall" -Type DWord -Value 0
}
DisableFirewall
# Disable Windows Defender Cloud
Function DisableDefenderCloud {
    Write-Host "Disabling Windows Defender Cloud..."
    If (!(Test-Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows Defender\Spynet")) {
        New-Item -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows Defender\Spynet" -Force | Out-Null
    }
    Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows Defender\Spynet" -Name "SpynetReporting" -Type DWord -Value 0
    Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows Defender\Spynet" -Name "SubmitSamplesConsent" -Type DWord -Value 2
}
DisableDefenderCloud
# Disable Windows Defender
Function DisableDefender {
    Write-Host "Disabling Windows Defender..."
    If (!(Test-Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows Defender")) {
        New-Item -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows Defender" -Force | Out-Null
    }
    Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows Defender" -Name "DisableAntiSpyware" -Type DWord -Value 1
    Remove-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Run" -Name "SecurityHealth" -ErrorAction SilentlyContinue
}
DisableDefender

#--- IP settings ---
write-output "Configuring Static IP"
$IPv4Address = "192.168.12.2"
$IPv4Mask = "255.255.255.0"
$IPv4Gateway = "192.168.12.1"
$IPv4DNS = "192.168.12.1"

$wmi = Get-WmiObject Win32_NetworkAdapterConfiguration -Filter "IpEnabled = 'true'"
if ($wmi -ne $null) {
  $wmi.EnableStatic($IPv4Address, $IPv4Mask)
  $wmi.SetGateways($IPv4Gateway, 1)
  $wmi.SetDNSServerSearchOrder($IPv4DNS)
}
else {
  write-output "error: no active network adapter found"
}

#--- Restore Temporary Settings ---

Enable-UAC

if (Test-PendingReboot) { Invoke-Reboot }

