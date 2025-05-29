# Script to generate placeholder images for JEGA documentation
# This script uses Chrome to open the placeholder HTML and capture screenshots

# Create the images/huong-dan directory if it doesn't exist
$imageDir = "e:\Program\Mintlify\docs\images\huong-dan"
if (-not (Test-Path $imageDir)) {
    New-Item -ItemType Directory -Path $imageDir -Force
}

# Get the full path to the HTML file
$htmlPath = "e:\Program\Mintlify\docs\create_placeholders.html"
$htmlFullPath = (Resolve-Path $htmlPath).Path

# Open Chrome in app mode with the HTML file
$chromeExe = "C:\Program Files\Google\Chrome\Application\chrome.exe"

if (-not (Test-Path $chromeExe)) {
    # Try alternative Chrome path
    $chromeExe = "C:\Program Files (x86)\Google\Chrome\Application\chrome.exe"
    
    if (-not (Test-Path $chromeExe)) {
        Write-Host "Chrome not found. Please install Chrome or modify this script to use another browser."
        exit 1
    }
}

Write-Host "Opening placeholder template in Chrome..."
Write-Host "INSTRUCTIONS:"
Write-Host "1. Each placeholder will appear in the browser window"
Write-Host "2. Take a screenshot of each placeholder (press Windows+Shift+S, then select the area)"
Write-Host "3. Save each screenshot with the corresponding ID in the images/huong-dan folder"
Write-Host "4. Press Alt+Tab to return to PowerShell when done"
Write-Host ""
Write-Host "Here are the IDs for each placeholder:"

# Extract div IDs from HTML file to help with naming
$html = Get-Content $htmlPath -Raw
$matches = [regex]::Matches($html, 'id="([^"]+)"')
foreach ($match in $matches) {
    $id = $match.Groups[1].Value
    Write-Host "- $id.png"
}

# Launch Chrome with the HTML file
Start-Process $chromeExe -ArgumentList "--app=file:///$htmlFullPath"

Write-Host ""
Write-Host "When you're done capturing all placeholders, press Enter to continue..."
Read-Host

Write-Host "Checking for generated images..."
$imageCount = (Get-ChildItem "$imageDir\*.png").Count
Write-Host "Found $imageCount image(s) in $imageDir"