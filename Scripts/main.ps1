#requires -Module Microsoft.Graph.Authentication

[CmdletBinding()]
param()

$module = Get-Module -ListAvailable -Name Microsoft.Graph.Authentication |
    Sort-Object Version -Descending |
    Select-Object -First 1

if (-not $module) {
    Write-Error "Microsoft.Graph.Authentication module not found."
    exit 1
}

Write-Host "Microsoft.Graph.Authentication module is installed."
Write-Host "Version: $($module.Version)"
Write-Host "Path: $($module.ModuleBase)"