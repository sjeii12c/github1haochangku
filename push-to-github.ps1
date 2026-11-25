Write-Host "=== GitHub Push ===" -ForegroundColor Green
Write-Host ""

$token = (Read-Host "Enter your GitHub token (starts with ghp_)").Trim()
Write-Host ("Token length: " + $token.Length + " | starts: " + $token.Substring(0, [Math]::Min(7, $token.Length))) -ForegroundColor Cyan
if (-not $token.StartsWith("ghp_")) {
    Write-Host "Invalid token format. Must start with ghp_" -ForegroundColor Red
    Read-Host "Press Enter to exit"
    exit 1
}

Write-Host ""
Write-Host "Logging in..." -ForegroundColor Yellow
$token | & "C:\Program Files\GitHub CLI\gh.exe" auth login --with-token
if ($LASTEXITCODE -ne 0) {
    Write-Host "Login failed. Check your token and repo scope." -ForegroundColor Red
    Read-Host "Press Enter to exit"
    exit 1
}

Write-Host "Auth status:" -ForegroundColor Yellow
& "C:\Program Files\GitHub CLI\gh.exe" auth status
Write-Host ""

Write-Host "Creating repo and pushing..." -ForegroundColor Yellow
Set-Location "D:\1.-workbuddy\GitHubchangku\zhuti\github1haochangku"
& "C:\Program Files\GitHub CLI\gh.exe" repo create github1haochangku --public --source=. --remote=origin --push

Write-Host ""
Write-Host "=== Done ===" -ForegroundColor Green
Read-Host "Press Enter to exit"
