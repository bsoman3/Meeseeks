
$ErrorActionPreference = 'Stop'; # stop on all errors
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$url        = 'https://download.spybot.info/FileAlyzer/filealyz-2.0.5.57.exe' # download url, HTTPS preferred

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'exe'
  url           = $url
  #file         = $fileLocation

  softwareName  = 'FileAlyzer*' #part or all of the Display Name as you see it in Programs and Features. It should be enough to be unique
  # MSI
  silentArgs    = "/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-" # ALLUSERS=1 DISABLEDESKTOPSHORTCUT=1 ADDDESKTOPICON=0 ADDSTARTMENU=0
  validExitCodes= @(0, 3010, 1641)

}

Install-ChocolateyPackage @packageArgs 
  