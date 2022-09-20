# google chrome

# credits: https://stackoverflow.com/questions/3102819/disable-same-origin-policy-in-chrome
function chrome-with-cors-disabled {
  New-Item -ItemType Directory -ErrorAction SilentlyContinue "${Env:USERPROFILE}\chrome-with-cors-disabled" > $null

  Start-Job -ScriptBlock {
    cmd.exe /C "`"C:\Program Files\Google\Chrome\Application\chrome.exe`" --disable-web-security --disable-gpu --user-data-dir=`"%USERPROFILE%\chrome-with-cors-disabled`""
  } > $null
}
