function gpoat { git push origin --all && git push origin --tags }
function sud { scoop update && scoop status }
function ud { scoop update && scoop status }

Remove-Item Alias:\gcm -Force *> $null
function gcm { git checkout main $args || git checkout master $args }
