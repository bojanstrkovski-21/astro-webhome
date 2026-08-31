# Git Push Script
# Stages, commits, and pushes changes to GitHub using the credential manager
# already configured for this repo (git config credential.helper) - no manual
# username/token entry needed.

Write-Host "=== Git Push Helper ===" -ForegroundColor Green
Write-Host ""

# Check if we're in a git repository
if (-not (Test-Path ".git")) {
    Write-Host "Error: Not a git repository!" -ForegroundColor Red
    exit 1
}

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

git push origin main

if ($LASTEXITCODE -ne 0) {
    Write-Host "Error: Failed to push changes!" -ForegroundColor Red
    Write-Host ""
    Write-Host "Run 'git push origin main' manually to see the full error." -ForegroundColor Yellow
    exit 1
}

Write-Host ""
Write-Host "=== Success! ===" -ForegroundColor Green
Write-Host "Changes have been pushed to GitHub successfully!" -ForegroundColor Green
Write-Host ""
