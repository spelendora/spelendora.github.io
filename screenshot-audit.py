#!/usr/bin/env python3
"""Capture full-page screenshots of all pages at desktop and mobile viewports."""

from playwright.sync_api import sync_playwright
from pathlib import Path
import time

OUTPUT_DIR = Path(__file__).parent / "screenshots"
OUTPUT_DIR.mkdir(exist_ok=True)

PAGES = [
    ("home", "https://spelendora.com/"),
    ("photography", "https://spelendora.com/photography"),
    ("devops", "https://spelendora.com/devops"),
    ("shoot-vietnam", "https://spelendora.com/shoot?id=tet-hanoi-2026"),
    ("shoot-personal", "https://spelendora.com/shoot?id=personal"),
]

VIEWPORTS = [
    ("desktop", 1440, 900),
    ("mobile", 390, 844),  # iPhone 14
]

def main():
    with sync_playwright() as p:
        browser = p.chromium.launch()

        for vp_name, width, height in VIEWPORTS:
            context = browser.new_context(
                viewport={"width": width, "height": height},
                device_scale_factor=2 if vp_name == "mobile" else 1,
                is_mobile=vp_name == "mobile",
                has_touch=vp_name == "mobile",
            )
            page = context.new_page()

            for page_name, url in PAGES:
                print(f"  Capturing {page_name} @ {vp_name} ({width}x{height})...")
                page.goto(url, wait_until="networkidle", timeout=30000)
                # Wait for loader to disappear and animations to settle
                time.sleep(3)

                # Full page screenshot
                filename = f"{page_name}-{vp_name}.png"
                page.screenshot(path=str(OUTPUT_DIR / filename), full_page=True)
                print(f"    Saved: {filename}")

            context.close()

        browser.close()
    print(f"\nAll screenshots saved to: {OUTPUT_DIR}/")


if __name__ == "__main__":
    main()
