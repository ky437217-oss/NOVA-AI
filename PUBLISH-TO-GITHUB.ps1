$ErrorActionPreference = 'Stop'
$Repo = 'ky437217-oss/NOVA-AI'

Write-Host 'NOVA AI — GitHub publish helper' -ForegroundColor Cyan
Write-Host 'This will create a PUBLIC repository and push the current folder.' -ForegroundColor Yellow
Write-Host 'Review README.md, LICENSE, NOTICE, LICENSING.md and third-party notices first.'

if (-not (Get-Command git -ErrorAction SilentlyContinue)) { throw 'Git is not installed or not on PATH.' }
if (-not (Get-Command gh -ErrorAction SilentlyContinue)) { throw 'GitHub CLI (gh) is not installed. Install it and retry.' }
& gh auth status
if ($LASTEXITCODE -ne 0) { throw 'GitHub CLI is not authenticated. Run: gh auth login' }

$Root = (Get-Location).Path
if (-not (Test-Path -LiteralPath (Join-Path $Root 'package.json')) -or -not (Test-Path -LiteralPath (Join-Path $Root 'NOVA-AI-CHANGES.md'))) {
  throw 'Run this script from the NOVA-AI project root (package.json and NOVA-AI-CHANGES.md must exist).'
}
if (Test-Path -LiteralPath (Join-Path $Root '.git')) { throw 'A .git directory already exists. This script will not reuse or overwrite an existing repository.' }
if (-not (Test-Path -LiteralPath (Join-Path $Root '.gitignore'))) { throw 'Expected .gitignore was not found.' }

$Remote = & gh repo view $Repo --json name --jq .name 2>$null
if ($LASTEXITCODE -eq 0 -and $Remote) { throw "GitHub repository $Repo already exists. Nothing was pushed; review and publish manually to avoid overwriting it." }

Write-Host "Target: https://github.com/$Repo (PUBLIC)" -ForegroundColor Yellow
$Confirmation = Read-Host 'Type PUBLISH to create the public repo and push this source'
if ($Confirmation -cne 'PUBLISH') { Write-Host 'Cancelled. No repository was created.'; exit 0 }

& git init
if ($LASTEXITCODE -ne 0) { throw 'git init failed.' }
& git branch -M main
if ($LASTEXITCODE -ne 0) { throw 'Could not set main branch.' }
& git add --all
if ($LASTEXITCODE -ne 0) { throw 'git add failed.' }
& git commit -m 'Initial NOVA AI source import'
if ($LASTEXITCODE -ne 0) { throw 'git commit failed. Configure git user.name/user.email if needed, then review status before retrying.' }
& gh repo create $Repo --public --source $Root --remote origin --push
if ($LASTEXITCODE -ne 0) { throw 'GitHub create/push did not complete. Check gh output and git status; do not rerun blindly.' }
Write-Host "Published: https://github.com/$Repo" -ForegroundColor Green
