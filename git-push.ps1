# Git Push Script with GitHub Authentication
# This script helps you stage, commit, and push changes to GitHub

Write-Host "=== Git Push Helper ===" -ForegroundColor Green
Write-Host ""

# Check if we're in a git repository
if (-not (Test-Path ".git")) {
    Write-Host "Error: Not a git repository!" -ForegroundColor Red
    exit 1
}

# GitHub Authentication
Write-Host "GitHub Authentication" -ForegroundColor Cyan
Write-Host "Enter your GitHub credentials:" -ForegroundColor Yellow
$username = Read-Host "GitHub Username"
$token = Read-Host "GitHub Personal Access Token (PAT)" -AsSecureString

# Convert secure string to plain text for git
$BSTR = [System.Runtime.InteropServices.Marshal]::SecureStringToBSTR($token)
$plainToken = [System.Runtime.InteropServices.Marshal]::PtrToStringAuto($BSTR)
Write-Host ""
Write-Host "=== Staging Changes ===" -ForegroundColor Cyan

# Stage all changes
git add .

if ($LASTEXITCODE -ne 0) {
    Write-Host "Error: Failed to stage changes!" -ForegroundColor Red
    exit 1
}

Write-Host "All changes staged successfully!" -ForegroundColor Green
Write-Host ""

# Show status
Write-Host "Current Status:" -ForegroundColor Cyan
git status --short
Write-Host ""

# Get commit message
Write-Host "=== Commit ===" -ForegroundColor Cyan
$commitMessage = Read-Host "Enter commit message"

if ([string]::IsNullOrWhiteSpace($commitMessage)) {
    Write-Host "Error: Commit message cannot be empty!" -ForegroundColor Red
    exit 1
}

# Commit changes
git commit -m "$commitMessage"

if ($LASTEXITCODE -ne 0) {
    Write-Host "Error: Failed to commit changes!" -ForegroundColor Red
    exit 1
}

Write-Host "Changes committed successfully!" -ForegroundColor Green
Write-Host ""

# Push to main branch
Write-Host "=== Pushing to GitHub ===" -ForegroundColor Cyan
Write-Host "Pushing to main branch..." -ForegroundColor Yellow

# Get the remote URL
$remoteUrl = git config --get remote.origin.url

# If it's HTTPS, inject credentials
if ($remoteUrl -like "https://*") {
    $urlWithAuth = $remoteUrl -replace "https://", "https://$username`:$plainToken@"
    git push $urlWithAuth main
} else {
    git push origin main
}

if ($LASTEXITCODE -ne 0) {
    Write-Host "Error: Failed to push changes!" -ForegroundColor Red
    Write-Host ""
    Write-Host "You may need to authenticate manually or check your credentials." -ForegroundColor Yellow
    exit 1
}

Write-Host ""
Write-Host "=== Success! ===" -ForegroundColor Green
Write-Host "Changes have been pushed to GitHub successfully!" -ForegroundColor Green
Write-Host ""

# Clear credentials from memory
$plainToken = $null
[System.GC]::Collect()
