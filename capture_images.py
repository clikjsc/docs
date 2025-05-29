from playwright.sync_api import sync_playwright
import os
import time

def capture_screenshots():
    with sync_playwright() as p:
        browser = p.chromium.launch(headless=False)
        context = browser.new_context(viewport={'width': 1280, 'height': 800})
        page = context.new_page()
        
        # Create images directory if it doesn't exist
        os.makedirs('images/huong-dan', exist_ok=True)
        
        # Capture Registration Page
        page.goto('https://jega.vn/vi')
        page.click('text="ĐĂNG KÝ TRẢI NGHIỆM"')
        time.sleep(2)
        page.screenshot(path='images/huong-dan/dang-ky-tai-khoan-1.png')
        
        # Capture Account Setup Example
        page.goto('https://jega.vn/vi/trung-tam-huong-dan')
        page.screenshot(path='images/huong-dan/trung-tam-huong-dan.png')
        
        # Capture Basic Interface
        page.goto('https://jega.vn/vi/jega-cloud-design')
        time.sleep(2)
        page.screenshot(path='images/huong-dan/giao-dien-chinh.png')
        
        # Close the browser
        browser.close()

if __name__ == "__main__":
    capture_screenshots()
