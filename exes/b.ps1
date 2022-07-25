$LocalTempDir = $env:TEMP
$ChromeInstaller = "ChromeInstaller.exe"
$Version = (New-Object Net.WebClient).DownloadString('https://raw.githubusercontent.com/ungoogled-software/ungoogled-chromium/master/chromium_version.txt') #couldnt find their pages page somehow so im not really sure it will get updated over time, current version is 103.0.5060.134 if it gets updated then it works
$bod = $Version -replace "`n","" -replace "`r",""
$Url = "https://github.com/ungoogled-software/ungoogled-chromium-windows/releases/download/$bod-1.1/ungoogled-chromium_$bod-1.1_installer_x64.exe"
(new-object System.Net.WebClient).DownloadFile($Url, "$LocalTempDir\$ChromeInstaller")
& "$LocalTempDir\$ChromeInstaller" /silent /install; $Process2Monitor = "ChromeInstaller"; Do { $ProcessesFound = Get-Process | ?{$Process2Monitor -contains $_.Name} | Select-Object -ExpandProperty Name; If ($ProcessesFound) { "Still running: $($ProcessesFound -join ', ')" | Write-Host; Start-Sleep -Seconds 2 } else { rm "$LocalTempDir\$ChromeInstaller" -ErrorAction SilentlyContinue -Verbose } } Until (!$ProcessesFound)
