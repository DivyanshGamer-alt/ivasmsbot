FROM python:3.9-slim-bullseye

WORKDIR /app

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY . .

# Install Chrome and Chromedriver
RUN apt-get update && apt-get install -y \
    chromium \
    chromium-driver \
    --no-install-recommends && \
    rm -rf /var/lib/apt/lists/*

# Chromium is in /usr/bin on bullseye/bookworm
ENV PATH="/usr/bin:${PATH}"

CMD ["python", "app.py"]
