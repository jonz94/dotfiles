# credits:
# - https://chatgpt.com/share/68f1a836-9eac-8001-9fe8-f0354c0fed0f
# - https://claude.ai/public/artifacts/785a771b-0b70-42b2-826d-14bc79f549e8
param(
  [string]$Hostname = "registry.npmjs.org",
  [int]$Port = 443
)

$pemOutput = ""

try {
  # create a TCP connection
  $tcpClient = New-Object System.Net.Sockets.TcpClient($Hostname, $Port)
  $sslStream = New-Object System.Net.Security.SslStream(
    $tcpClient.GetStream(),
    $false,
    # certificate validation callback - accept all to inspect
    { param($sender, $cert, $chain, $errors) return $true }
  )

  # start TLS handshake
  $sslStream.AuthenticateAsClient($Hostname)

  # get certificate chain
  $chain = New-Object System.Security.Cryptography.X509Certificates.X509Chain
  [void] $chain.Build($sslStream.RemoteCertificate)

  foreach ($element in $chain.ChainElements) {
    $certificate = $element.Certificate

    # convert to base64 with 64-character line width (matching OpenSSL)
    $base64 = [Convert]::ToBase64String($certificate.RawData)
    $pemLines = for ($i = 0; $i -lt $base64.Length; $i += 64) {
      $length = [Math]::Min(64, $base64.Length - $i)
      $base64.Substring($i, $length)
    }
    $pemOutput += @"
-----BEGIN CERTIFICATE-----
$($pemLines -join "`n")
-----END CERTIFICATE-----

"@
  }

} catch {
  Write-Error "Failed to retrieve certificates: $_"
} finally {
  if ($sslStream) { $sslStream.Close() }
  if ($tcpClient) { $tcpClient.Close() }

  Write-Host $pemOutput
}
