import pytest
from playwright.sync_api import sync_playwright


@pytest.fixture(scope="function")
def page():
    with sync_playwright() as p:
        browser = p.chromium.launch(headless=True)  # or True for headless mode
        context = browser.new_context()
        page = context.new_page()
        yield page
        browser.close()
