# PowerShell script to set up dependencies and run the image generation

# Check if Node.js is installed
try {
    $nodeVersion = node -v
    Write-Host "Node.js is installed: $nodeVersion"
} catch {
    Write-Host "Node.js is not installed. Please install Node.js from https://nodejs.org/" -ForegroundColor Red
    exit 1
}

# Set the working directory
Set-Location -Path "e:\Program\Mintlify\docs"

# Ensure dependencies are installed
Write-Host "Installing dependencies..."
npm install puppeteer --save

# Generate the images
Write-Host "Generating placeholder images..."
node generate_images.js

# Update MDX files with image references
Write-Host "Updating MDX files with image references..."
& "e:\Program\Mintlify\docs\update_mdx_files.ps1"

Write-Host "Process completed!" -ForegroundColor Green
