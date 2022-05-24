# jabba installer script
# https://github.com/shyiko/jabba

# install jabba or update jabba to latest version
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
Invoke-Expression (
  Invoke-WebRequest 'https://github.com/shyiko/jabba/raw/master/install.ps1' -UseBasicParsing
).Content
