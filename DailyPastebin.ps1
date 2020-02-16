
$logo = @(  "",
"________         .__.__         __________                  __          ",
"\______ \ _____  |__|  | ___.__.\______   \_____    _______/  |_  ____  ",
" |    |  \\__  \ |  |  |<   |  | |     ___/\__  \  /  ___/\   __\/ __ \ ",
" |    `   \/ __ \|  |  |_\___  | |    |     / __ \_\___ \  |  | \  ___/ ",
"/_______  (____  /__|____/ ____| |____|    (____  /____  > |__|  \___  >",
"        \/     \/        \/                     \/     \/            \/ ",
"",

"Creator: https://securethelogs.com / @securethelogs",
"",
"*If you run multiple times within a short window, your IP will most likely be blocked",
"")


$logo


$filetosave = ""
$askstore = Read-Host "Would you list to store juicy findings? (Y/N)"

if ($askstore -eq "y" -or $askstore -eq "yes"){

$fileloc = Read-Host "Txt File Location:"


if ($fileloc -like "*.txt"){

# Got a Txt File

$filetosave = $fileloc


} else {

# Mistake made

Write-Output "File location wasn't txt.....continuing without..."
$filetosave = $null
Write-Output ""

}

}




$pastes = @(curl https://pastebin.com/archive).links




foreach ($i in $pastes){


$title = $i.href

# Remove the junk
if ($title -eq "/pro" -or $title -eq "/api" -or $title -eq "/tools" -or $title -eq "/faq" -or $title -eq "_blank" -or $title -eq "/login" -or $title -eq "/signup" -or $title -eq "/archives" -or $title -eq "/" -or $title -eq "/languages" -or $title -eq "/night_mode" -or $title -eq "/dmca" -or $title -eq "/contact" -or $title -eq "#0" -or $title -like "*/archive*" -or $title -like "*/tools#*" -or $title -like "*/doc_*" -or $title -like "*http://*" -or $title -like "*https://*"){



} else{

$name = $i.innerText
$link = $i.href


Write-Output ""
Write-Output "Name: $name"
Write-Output "Link: https://pastebin.com/raw$link"


$contenturl = @((curl https://pastebin.com/raw$link).content) | Out-String

$getlenght = $contenturl.Length


if ($getlenght -gt 19){$content = $contenturl.subString(0,20) |Out-String}
if ($getlenght -gt 39){$content = $contenturl.subString(0,40) |Out-String}
if ($getlenght -gt 59){$content = $contenturl.subString(0,60) |Out-String}
if ($getlenght -gt 79){$content = $contenturl.subString(0,80) |Out-String}
if ($getlenght -gt 99){$content = $contenturl.subString(0,100) |Out-String}




Write-Output ""
Write-Output "Preview:"
$content
Write-Output ""
Write-Output "-----------------------------------"
Write-Output ""
Write-Output ""



# ---- Find something Juicy -------------


if ($contenturl -like "*admin*" -or $contenturl -like "*credentials*" -or $contenturl -like "*password*" -or $contenturl -like "*rdp*" -or $contenturl -like "*login" -or $contenturl -like "*username*" -or $contenturl -like "*API*"-or $contenturl -like "*hash*" -or $contenturl -like "*database=*" ){

$storejuice = @()
$juicylink = @()

$storejuice += $contenturl
$juicylink += $i.href


}


} 
}

Write-Output "Pastes of Potential Interest (contains keywords)"
Write-Output ""

foreach ($l in $juicylink){

Write-Output "https://pastebin.com/raw$l"


}

Write-Output ""


# Save to TXT

if ($filetosave -eq $null){} else {

$storejuice >> $filetosave
Write-Output "Remember that Juicy content has been saved to $filetosave"

}


Write-Output ""