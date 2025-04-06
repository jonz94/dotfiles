# ni: https://github.com/antfu-collective/ni

# https://github.com/antfu-collective/ni?tab=readme-ov-file#conflicts-with-powershell
If (Test-Path Alias:\ni) {
  Remove-Item Alias:\ni -Force -ErrorAction Ignore
}
