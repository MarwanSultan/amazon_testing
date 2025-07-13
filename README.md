# 🧪 Amazon UI Test Automation Framework (Pytest + Selenium)

A robust UI test automation framework for Amazon.com, built with **Python**, **Selenium WebDriver**, and **Pytest**. It supports scalable test development using the Page Object Model (POM), Docker-based execution, and HTML reporting.

---

## ✅ Features

- **Python + Selenium** for browser automation  
- **Pytest** for structured test execution  
- **Page Object Model** design for maintainability  
- **Docker** support for isolated test runs  
- **HTML reporting** with `pytest-html`  
- Easy to extend and integrate with CI tools

---

## 🗂️ Project Structure

## Create a virtual environment and install dependencies
python -m venv venv
source venv/bin/activate  # or venv\Scripts\activate on Windows
pip install -r requirements.txt

## Run Tests
pytest --html=reports/report.html --self-contained-html

### Run Tests in Docker

## Build docker image
docker build -t amazon-tests .

## Run tests
docker run -rm amazon-tests

## Output test report to host machine
docker run --rm -v $(pwd)/reports:/app/reports amazon-tests
