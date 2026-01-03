# -------- BASE --------
FROM python:3.12-slim AS base

WORKDIR /app

COPY requirements.txt .

RUN apt-get update && apt-get install -y build-essential && \
    pip install --no-cache-dir -r requirements.txt

# -------- DEV --------
FROM base AS dev

COPY app/app.py .

CMD ["python", "app.py"]

# -------- PROD --------
FROM python:3.12-slim AS prod

WORKDIR /app

COPY --from=base /usr/local/lib/python3.12 /usr/local/lib/python3.12
COPY app/app.py .

CMD ["python", "app.py"]
