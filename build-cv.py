#!/usr/bin/env python3
# /// script
# requires-python = ">=3.10"
# dependencies = ["Jinja2"]
# ///
"""Build CV website and PDFs from cv-data.json.

Reads cv-data.json, renders devops/template.html -> devops/index.html using Jinja2,
and optionally generates PDF variants via generate-cv-pdf.py.

Usage:
    uv run build-cv.py              # Build HTML only
    uv run build-cv.py --pdf        # Build HTML + all PDF styles
    uv run build-cv.py --pdf 1      # Build HTML + specific PDF style
"""

import json
import sys
from pathlib import Path

from jinja2 import Environment, FileSystemLoader

ROOT = Path(__file__).parent
DATA_FILE = ROOT / "cv-data.json"
TEMPLATE_DIR = ROOT / "devops"
TEMPLATE_FILE = "template.html"
OUTPUT_FILE = ROOT / "devops" / "index.html"


def load_data() -> dict:
    """Load CV data from JSON file."""
    with open(DATA_FILE) as f:
        return json.load(f)


def format_notifications_json(notifications: list) -> str:
    """Format notifications array as JavaScript array literal.

    Produces output matching the original hand-written JS array format
    with proper indentation and Unicode escape sequences.
    """
    lines = []
    lines.append("[")
    for i, n in enumerate(notifications):
        # Convert special characters to Unicode escapes to match original
        text = n["text"]
        text_escaped = text.replace("\u2192", "\\u2192").replace("\u2014", "\\u2014")
        comma = "," if i < len(notifications) - 1 else ""
        lines.append(f"      {{ type: '{n['type']}', text: '{text_escaped}' }}{comma}")
    lines.append("    ]")
    return "\n".join(lines)


def build_html(data: dict) -> str:
    """Render the Jinja2 template with CV data."""
    env = Environment(
        loader=FileSystemLoader(str(TEMPLATE_DIR)),
        autoescape=False,  # Data already contains HTML entities
        keep_trailing_newline=True,
        trim_blocks=True,
        lstrip_blocks=True,
    )

    template = env.get_template(TEMPLATE_FILE)

    # Prepare notifications JSON for inline JS
    notifications_json = format_notifications_json(data["notifications"])

    render_vars = {
        **data,
        "notifications_json": notifications_json,
    }

    return template.render(**render_vars)


def build_pdfs(style_num: int = None):
    """Generate PDF variants using generate-cv-pdf.py logic."""
    try:
        # Import from the existing script
        sys.path.insert(0, str(ROOT))
        import importlib
        pdf_module = importlib.import_module("generate-cv-pdf")

        pdf_module.OUTPUT_DIR.mkdir(exist_ok=True)
        data = pdf_module.load_data()

        if style_num is not None:
            pdf_module.generate(style_num, data)
        else:
            print("Generating 5 CV PDF styles...")
            for n in pdf_module.STYLES:
                pdf_module.generate(n, data)
            print(f"  All PDFs saved to: {pdf_module.OUTPUT_DIR}/")
    except ImportError as e:
        print(f"  Warning: Could not import generate-cv-pdf: {e}")
        print("  Install weasyprint to generate PDFs: pip install weasyprint")
    except Exception as e:
        print(f"  Error generating PDFs: {e}")


def main():
    """Main entry point."""
    data = load_data()

    # Build HTML
    print("Building devops/index.html from template...")
    html = build_html(data)
    OUTPUT_FILE.write_text(html)
    print(f"  Generated: {OUTPUT_FILE}")

    # Build PDFs if requested
    if "--pdf" in sys.argv:
        pdf_idx = sys.argv.index("--pdf")
        if pdf_idx + 1 < len(sys.argv) and sys.argv[pdf_idx + 1].isdigit():
            build_pdfs(int(sys.argv[pdf_idx + 1]))
        else:
            build_pdfs()

    print("Done.")


if __name__ == "__main__":
    main()
