from playwright.sync_api import Page


class SearchResultsPage:
    def __init__(self, page: Page):
        self.page = page

    def has_results(self):
        return self.page.locator("div.s-main-slot").is_visible()

    def get_first_result_text(self):
        return (
            self.page.locator(
                "div.s-main-slot div[data-component-type='s-search-result']"
            )
            .nth(0)
            .inner_text()
        )
