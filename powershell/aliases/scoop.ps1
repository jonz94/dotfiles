# scoop aliases
function i { scoop install $args }
function scl { scoop cleanup $args }
function scl* { scoop cleanup * }
function si { scoop info $args }

Remove-Item Alias:\sls -Force *> $null
function sls { scoop list }

function ss { scoop search $args }
function sst { scoop status }

function sup { scoop update $args }

function sug { scoop upgrade }
function ug { scoop upgrade }
