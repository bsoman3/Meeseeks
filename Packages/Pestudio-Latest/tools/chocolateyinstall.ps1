$ErrorActionPreference = 'Stop';
 
$packageName = 'Pestudio-Latest'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url = 'https://www.winitor.com/tools/pestudio/current/pestudio.zip'
 
$packageArgs = @{
  packageName   = $packageName
  unziplocation = $toolsDir
  fileType      = 'exe'
  url           = $url
  silentArgs  = "/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-"
  softwareName  = '*Pestudio-Latest*'
  validExitCodes = @(0, 3010, 1641)
}
 
Install-ChocolateyZipPackage @packageArgs

