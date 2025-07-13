import re


from playwright.sync_api import Page, expect


def test_amazon_homepage_title(page: Page):
    page.goto("https://www.amazon.com/")
    expect(page).to_have_title(re.compile("Amazon"))
