FROM python:3.10-slim

# Install dependencies for Allure + browsers (optional for Playwright)
RUN apt-get update && apt-get install -y \
    build-essential python3-dev wget curl unzip gnupg \
    libnss3 libxss1 libappindicator3-1 libasound2 libatk-bridge2.0-0 libgtk-3-0 libgbm-dev \
    && rm -rf /var/lib/apt/lists/*


WORKDIR /amazon_tests

COPY requirements.txt .

RUN pip install --upgrade pip
RUN pip install --no-cache-dir -r requirements.txt

COPY . .

# Create folders for allure results and final report
RUN mkdir -p allure-results allure-report

# Run tests and generate report
CMD bash -c "pytest --alluredir=allure-results && allure generate allure-results --clean -o allure-report && ls allure-report"

# Create folders for reports
RUN mkdir -p allure-results allure-report

