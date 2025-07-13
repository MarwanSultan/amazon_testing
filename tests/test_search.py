import re
from pages.homepage import HomePage

def test_amazon_homepage_title(page):
    homepage = HomePage(page)
    homepage.load()
    title = homepage.get_title()
    assert re.search(HomePage.TITLE_KEYWORD, title, re.IGNORECASE)
