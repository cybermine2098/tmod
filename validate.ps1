# Run this in your mod folder (where main.lua is)
$main = Get-Content .\main.lua -Raw
$jokerDefs = ($main -split "local joker_defs = \{")[1] -split "\}" | Select-Object -First 1
$jokerNames = ($jokerDefs -split "`n") | ForEach-Object {
    $_.Trim() -replace "[',]", ""
} | Where-Object { $_ -ne "" }

# Remove any comments or empty lines
$jokerNames = $jokerNames | Where-Object { $_ -match "^[a-zA-Z0-9_]+$" }

# Check for missing files
$missing = @()
foreach ($joker in $jokerNames) {
    $file = ".\jokers\$($joker.ToLower()).lua"
    if (-not (Test-Path $file)) {
        $missing += $file
    }
}

$allFiles = Get-ChildItem .\jokers\*.lua | ForEach-Object { $_.BaseName.ToLower() }
$extra = $allFiles | Where-Object { $_ -notin ($jokerNames | ForEach-Object { $_.ToLower() }) }
$notLowercase = Get-ChildItem .\jokers\*.lua | Where-Object { $_.Name -cmatch '[A-Z]' }

Write-Host "=== Validation Results ==="
if ($missing.Count -gt 0) {
    Write-Host "Missing files for joker_defs:" -ForegroundColor Red
    $missing | ForEach-Object { Write-Host $_ -ForegroundColor Red }
} else {
    Write-Host "All joker_defs have corresponding files." -ForegroundColor Green
}
if ($extra.Count -gt 0) {
    Write-Host "Extra files in jokers/ not referenced in joker_defs:" -ForegroundColor Yellow
    $extra | ForEach-Object { Write-Host $_ -ForegroundColor Yellow }
} else {
    Write-Host "No extra files in jokers/." -ForegroundColor Green
}
if ($notLowercase.Count -gt 0) {
    Write-Host "Files in jokers/ that are not all lowercase:" -ForegroundColor Magenta
    $notLowercase | ForEach-Object { Write-Host $_.Name -ForegroundColor Magenta }
} else {
    Write-Host "All files in jokers/ are lowercase." -ForegroundColor Green
}