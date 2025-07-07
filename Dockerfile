# Base image با پایتون 3.11
FROM python:3.11-slim

# Set working directory
WORKDIR /app

# Copy requirements و نصب پکیج‌ها
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy کل پروژه به داخل کانتینر
COPY . .

# ساخت پوشه uploads در کانتینر
RUN mkdir -p uploads

# پورت برنامه
EXPOSE 80

# متغیر محیطی برای Flask

# اجرای برنامه
CMD ["gunicorn", "--bind", "0.0.0.0:5000", "app:app", "--workers", "3"]
