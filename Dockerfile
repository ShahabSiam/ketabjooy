# Base image با پایتون 3.11
FROM python:3.11-alpine
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1
RUN apk add --no-cache \
    build-base \
    libffi-dev \
    musl-dev \
    gcc \
    postgresql-dev \
    python3-dev \
    curl
# Set working directory
WORKDIR /app

# Copy requirements و نصب پکیج‌ها
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy کل پروژه به داخل کانتینر
COPY . .

CMD ["python", "manage.py", "runserver", "0.0.0.0:80"]
