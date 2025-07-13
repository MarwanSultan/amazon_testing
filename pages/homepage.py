from playwright.sync_api import Page
from pages.base_page import BasePage


class HomePage(BasePage):
    URL = "https://www.amazon.com/"
    SEARCH_BOX = "input#twotabsearchtextbox"
    SEARCH_BUTTON = "input#nav-search-submit-button"
    TITLE_KEYWORD = "Amazon"

    def load(self):
        self.goto(self.URL)

    def get_title(self):
        return self.page.title()

    def search_product(self, product_name: str):
        self.page.fill(self.SEARCH_BOX, product_name)
        self.page.click(self.SEARCH_BUTTON)
