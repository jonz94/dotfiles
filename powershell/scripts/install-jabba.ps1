# jabba installer script
# https://github.com/Jabba-Team/jabba

# install jabba or update jabba to latest version
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
Invoke-Expression (
  Invoke-WebRequest 'https://github.com/Jabba-Team/jabba/raw/main/install.ps1' -UseBasicParsing
).Content
