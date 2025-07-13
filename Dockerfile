# Use official Python slim image
FROM python:3.10-slim

# Install OS dependencies for Playwright browsers and tools
RUN apt-get update && apt-get install -y \
    wget gnupg libnss3 libatk-bridge2.0-0 libgtk-3-0 libxss1 libasound2 \
    libxshmfence-dev libgbm-dev libx11-xcb1 xvfb && rm -rf /var/lib/apt/lists/*

WORKDIR /app

# Copy and install python dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Install Playwright browsers
RUN python -m playwright install --with-deps

# Install code quality tools (black, flake8, bandit)
RUN pip install black flake8 bandit

# Copy project files
COPY . .

# Run code formatting, linting, security checks, then tests
CMD black --check . && flake8 . && bandit -r . && pytest --headless
