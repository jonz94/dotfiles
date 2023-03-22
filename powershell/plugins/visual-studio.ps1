function vs. {
  if ((Get-Command fd -ErrorAction SilentlyContinue).Count -gt 0) {
    $solutions = $(fd --absolute-path ".sln")
  } else {
    $solutions = $(Get-ChildItem -Filter *.sln -Recurse | ForEach-Object { $_.FullName })
  }

  if ($solutions.Count -lt 1) {
    Write-Host 'No .sln file was found' -ForegroundColor Red
    return
  }

  if ($solutions.Count -eq 1) {
    explorer.exe $solutions
    return
  }

  $selectedSolution = $($solutions | fzf)

  if ($selectedSolution) {
    explorer.exe $selectedSolution
  }
}
