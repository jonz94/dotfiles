# opt-out dotnet sdk and dotnet cli telemetry
# https://aka.ms/dotnet-cli-telemetry

gsudo { [Environment]::SetEnvironmentVariable('DOTNET_CLI_TELEMETRY_OPTOUT', 1, 'Machine') }
