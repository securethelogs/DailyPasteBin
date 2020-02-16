# DailyPasteBin
![Securethelogs.com](https://ctrla1tdel.files.wordpress.com/2020/02/dailypastebin.gif)

Pastebin is used by multiple people, including malicious parties. 
Dailypastebin.ps1 can help pull recent public pastes, display and extract anything of value in them. 

If you wanted to add your own keywords, simply expand on line 103 "-or $contenturl -like "*your keyword*"

<b> To Run </b>

Either download and run locally or to run remotely, run:

powershell –nop –c “iex(New-Object Net.WebClient).DownloadString(‘https://raw.githubusercontent.com/securethelogs/DailyPasteBin/master/DailyPastebin.ps1’)”




