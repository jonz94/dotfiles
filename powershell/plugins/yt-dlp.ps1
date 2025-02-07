function yt-thumbnail {
  yt-dlp $args[0] --skip-download --write-thumbnail
}

function yt-thumbnail-echo {
  Write-Host "yt-dlp `$args[0] --skip-download --write-thumbnail"
}
