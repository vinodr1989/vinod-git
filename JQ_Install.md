# Install jq on Windows
## Pre requisites:
 * [git](https://git-scm.com/download/win)

## Steps
  * Open Power shell
  * Run the following command to install winget
```
$progressPreference = 'silentlyContinue'
Write-Information "Downloading WinGet and its dependencies..."
Invoke-WebRequest -Uri https://aka.ms/getwinget -OutFile Microsoft.DesktopAppInstaller_8wekyb3d8bbwe.msixbundle
Invoke-WebRequest -Uri https://aka.ms/Microsoft.VCLibs.x64.14.00.Desktop.appx -OutFile Microsoft.VCLibs.x64.14.00.Desktop.appx
Invoke-WebRequest -Uri https://github.com/microsoft/microsoft-ui-xaml/releases/download/v2.8.6/Microsoft.UI.Xaml.2.8.x64.appx -OutFile Microsoft.UI.Xaml.2.8.x64.appx
Add-AppxPackage Microsoft.VCLibs.x64.14.00.Desktop.appx
Add-AppxPackage Microsoft.UI.Xaml.2.8.x64.appx
Add-AppxPackage Microsoft.DesktopAppInstaller_8wekyb3d8bbwe.msixbundle
```
  * Once the execution completes open Git Bash
  * Search the version available on winget  ` winget search jq `
  * Install jq using winget ` winget install jqlang.jq `
  * Relaunch the Git bash 
  * Check for the Installation using  ` jq --version `

## Reff: 
  * jq: https://jqlang.github.io/jq/download/
  * winget: https://learn.microsoft.com/en-us/windows/package-manager/winget/install?source=recommendations
