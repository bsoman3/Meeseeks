# Description: Malware Analysis Victim VM
# Author: Bhavna Soman <bhavna.soman@gmail.com>
# Last Updated: 2018-08-19
#
# To install everything, run:
#   Set-ExecutionPolicy Bypass -Scope Process -Force; iex Carrie.ps1
#
 
write-output "Installing Chocolatey"
Set-ExecutionPolicy Bypass -Scope Process -Force; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1')) 

#--- Apps ---
write-output "Installing a few apps"
choco install -y googlechrome notepadplusplus winscp winrar mingw 7zip dotnet4.6.1 

refreshenv

#---- RE Tools ---
write-output "Installing the RE tools"

choco install -y  regshot --allow-empty-checksums
choco install -y windbg --x86

choco install -y sysinternals 
$TargetFile = "C:\ProgramData\chocolatey\lib\sysinternals\tools\"
$ShortcutFile = "$env:Public\Desktop\Sysinternals.lnk"
$WScriptShell = New-Object -ComObject WScript.Shell
$Shortcut = $WScriptShell.CreateShortcut($ShortcutFile)
$Shortcut.TargetPath = $TargetFile
$Shortcut.Save()

$TargetFile = "C:\ProgramData\chocolatey\lib\sysinternals\tools\Procmon.exe"
$ShortcutFile = "$env:Public\Desktop\Procmon.lnk"
$WScriptShell = New-Object -ComObject WScript.Shell
$Shortcut = $WScriptShell.CreateShortcut($ShortcutFile)
$Shortcut.TargetPath = $TargetFile
$Shortcut.Save()

$TargetFile = "C:\ProgramData\chocolatey\lib\sysinternals\tools\procexp.exe"
$ShortcutFile = "$env:Public\Desktop\Procexp.lnk"
$WScriptShell = New-Object -ComObject WScript.Shell
$Shortcut = $WScriptShell.CreateShortcut($ShortcutFile)
$Shortcut.TargetPath = $TargetFile
$Shortcut.Save()

choco install -y dependencywalker 
$TargetFile = "C:\ProgramData\chocolatey\lib\dependencywalker\content\depends.exe"
$ShortcutFile = "$env:Public\Desktop\DependencyWalker.lnk"
$WScriptShell = New-Object -ComObject WScript.Shell
$Shortcut = $WScriptShell.CreateShortcut($ShortcutFile)
$Shortcut.TargetPath = $TargetFile
$Shortcut.Save()

choco install -y ollydbg 
$TargetFile = "C:\Program Files\OllyDbg\OLLYDBG.EXE"
$ShortcutFile = "$env:Public\Desktop\OllyDbg.lnk"
$WScriptShell = New-Object -ComObject WScript.Shell
$Shortcut = $WScriptShell.CreateShortcut($ShortcutFile)
$Shortcut.TargetPath = $TargetFile
$Shortcut.Save()

choco install -y wireshark 
$TargetFile = "C:\Program Files\Wireshark\Wireshark.exe"
$ShortcutFile = "$env:Public\Desktop\Wireshark.lnk"
$WScriptShell = New-Object -ComObject WScript.Shell
$Shortcut = $WScriptShell.CreateShortcut($ShortcutFile)
$Shortcut.TargetPath = $TargetFile
$Shortcut.Save()

choco install -y hxd 
$TargetFile = "C:\Program Files\HxD\HxD.exe"
$ShortcutFile = "$env:Public\Desktop\HxD.lnk"
$WScriptShell = New-Object -ComObject WScript.Shell
$Shortcut = $WScriptShell.CreateShortcut($ShortcutFile)
$Shortcut.TargetPath = $TargetFile
$Shortcut.Save()

choco install -y javadecompiler-gui 
$TargetFile = "C:\ProgramData\chocolatey\lib\javadecompiler-gui\tools\jd-gui-windows-1.4.0\jd-gui.exe" 
$ShortcutFile = "$env:Public\Desktop\Javadecompiler-Gui.lnk"
$WScriptShell = New-Object -ComObject WScript.Shell
$Shortcut = $WScriptShell.CreateShortcut($ShortcutFile)
$Shortcut.TargetPath = $TargetFile
$Shortcut.Save()

choco install -y upx 
$TargetFile = "C:\ProgramData\chocolatey\lib\upx\tools\upx394w\upx.exe"
$ShortcutFile = "$env:Public\Desktop\Upx.lnk"
$WScriptShell = New-Object -ComObject WScript.Shell
$Shortcut = $WScriptShell.CreateShortcut($ShortcutFile)
$Shortcut.TargetPath = $TargetFile
$Shortcut.Save()

choco install -y processhacker  

choco install -y explorersuite 
$TargetFile = "C:\Program Files\NTCore\Explorer Suite\CFF Explorer.exe"
$ShortcutFile = "$env:Public\Desktop\Cff Explorer.lnk"
$WScriptShell = New-Object -ComObject WScript.Shell
$Shortcut = $WScriptShell.CreateShortcut($ShortcutFile)
$Shortcut.TargetPath = $TargetFile
$Shortcut.Save()

choco install -y ilspy 
$TargetFile = "C:\ProgramData\chocolatey\lib\ilspy\tools\ILSpy.exe"
$ShortcutFile = "$env:Public\Desktop\ILSpy.lnk"
$WScriptShell = New-Object -ComObject WScript.Shell
$Shortcut = $WScriptShell.CreateShortcut($ShortcutFile)
$Shortcut.TargetPath = $TargetFile
$Shortcut.Save()

write-output "... in a tragic twist of events, IDA Free can no longer be installed on a 32 bit OS."
write-output "and the only free images of windows that I have found are 32 bit. SO."
write-output "clumsy hack coming up..."
write-output "
    # ─────────▄▄───────────────────▄▄──
    # ──────────▀█───────────────────▀█─
    # ──────────▄█───────────────────▄█─
    # ──█████████▀───────────█████████▀─
    # ───▄██████▄─────────────▄██████▄──
    # ─▄██▀────▀██▄─────────▄██▀────▀██▄
    # ─██────────██─────────██────────██
    # ─██───██───██─────────██───██───██
    # ─██────────██─────────██────────██
    # ──██▄────▄██───────────██▄────▄██─
    # ───▀██████▀─────────────▀██████▀──
    # ──────────────────────────────────
    # ──────────────────────────────────
    # ──────────────────────────────────
    # ───────────█████████████──────────
    # ──────────────────────────────────
    # ──────────────────────────────────
"
# choco install -y ida-free --x86
# $TargetFile = "C:\Program Files\IDA Freeware 7.0\ida.exe"
# $ShortcutFile = "$env:Public\Desktop\Ida Freeware.lnk"
# $WScriptShell = New-Object -ComObject WScript.Shell
# $Shortcut = $WScriptShell.CreateShortcut($ShortcutFile)
# $Shortcut.TargetPath = $TargetFile
# $Shortcut.Save()

choco instal -y git
git clone https://github.com/bsoman3/Meeseeks.git

choco install -y ida-5.0 -s .\Meeseeks\Packages\
$TargetFile = "C:\ProgramData\chocolatey\lib\pestudio-latest\tools\pestudio\pestudio.exe"
$ShortcutFile = "$env:Public\Desktop\Ida Free.lnk"
$WScriptShell = New-Object -ComObject WScript.Shell
$Shortcut = $WScriptShell.CreateShortcut($ShortcutFile)
$Shortcut.TargetPath = $TargetFile
$Shortcut.Save()

choco install -y Pestudio-Latest -s .\Meeseeks\Packages\
$TargetFile = "C:\ProgramData\chocolatey\lib\pestudio-latest\tools\pestudio\pestudio.exe"
$ShortcutFile = "$env:Public\Desktop\Pestudio.lnk"
$WScriptShell = New-Object -ComObject WScript.Shell
$Shortcut = $WScriptShell.CreateShortcut($ShortcutFile)
$Shortcut.TargetPath = $TargetFile
$Shortcut.Save()

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


