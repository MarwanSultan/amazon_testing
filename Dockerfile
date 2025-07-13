FROM python:3.10-slim

RUN apt-get update && apt-get install -y \
    build-essential python3-dev wget curl unzip gnupg libnss3 libxss1 libappindicator3-1 libasound2 libatk-bridge2.0-0 libgtk-3-0 libgbm-dev \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /amazon_tests

COPY requirements.txt .

RUN pip install --upgrade pip
RUN pip install --no-cache-dir -r requirements.txt

COPY . .

CMD ["pytest", "--html=reports/report.html", "--self-contained-html"]
