// Node.js script to automatically generate placeholder images using Puppeteer
const puppeteer = require('puppeteer');
const fs = require('fs');
const path = require('path');

// Function to extract IDs from the HTML file
function extractIdsFromHtml(htmlContent) {
  const regex = /id="([^"]+)"/g;
  const matches = htmlContent.matchAll(regex);
  const ids = [];
  
  for (const match of matches) {
    ids.push(match[1]);
  }
  
  return ids;
}

async function generateImages() {
  // Create the output directory if it doesn't exist
  const outputDir = path.join(__dirname, 'images', 'huong-dan');
  if (!fs.existsSync(outputDir)) {
    fs.mkdirSync(outputDir, { recursive: true });
  }
  
  // Read the HTML file
  const htmlPath = path.join(__dirname, 'create_placeholders.html');
  const htmlContent = fs.readFileSync(htmlPath, 'utf8');
  
  // Extract IDs from the HTML
  const ids = extractIdsFromHtml(htmlContent);
  console.log(`Found ${ids.length} placeholders to generate`);
  
  // Launch the browser
  const browser = await puppeteer.launch({
    headless: true,
    defaultViewport: {
      width: 800,
      height: 500
    }
  });
  
  const page = await browser.newPage();
  
  // Load the HTML file
  await page.goto(`file://${htmlPath}`);
  
  // Generate screenshots for each placeholder
  for (const id of ids) {
    console.log(`Generating image for: ${id}`);
    
    // Skip if the file already exists
    const outputPath = path.join(outputDir, `${id}.png`);
    if (fs.existsSync(outputPath)) {
      console.log(`Image already exists: ${outputPath}`);
      continue;
    }
    
    // Scroll to the element
    await page.evaluate((elemId) => {
      const element = document.getElementById(elemId);
      if (element) {
        element.scrollIntoView();
      }
    }, id);
    
    // Wait a moment for any animations
    await new Promise(resolve => setTimeout(resolve, 100));
    
    // Take a screenshot of just that element
    const element = await page.$(`#${id}`);
    if (element) {
      await element.screenshot({
        path: outputPath,
        omitBackground: false
      });
      console.log(`Saved: ${outputPath}`);
    } else {
      console.error(`Could not find element with ID: ${id}`);
    }
  }
  
  await browser.close();
  console.log('All images generated successfully!');
}

// Run the function
generateImages().catch(err => {
  console.error('Error generating images:', err);
  process.exit(1);
});
