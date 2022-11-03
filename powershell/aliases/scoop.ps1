# scoop aliases
function i { scoop install $args }
function scl { scoop cleanup $args }
function scla { scoop cleanup --all }
function scl* { scoop cleanup --all }
function si { scoop info $args }

Remove-Item Alias:\sls -Force *> $null
function sls { scoop list }

function ss { scoop search $args }
function sst { scoop status }

function sup { scoop update $args }

function sug { scoop update --all }
function ug { scoop update --all }
