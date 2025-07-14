import requests
import pytest

def test_mock_amazon_product_search(requests_mock):
    requests_mock.get(
        "https://amazon.com/api/products/B07FZ8S74R",
        json={"title": "Echo Dot", "price": "$49.99"},
        status_code=200
    )

    response = requests.get("https://amazon.com/api/products/B07FZ8S74R")
    assert response.status_code == 200
    assert response.json()["title"] == "Echo Dot"
