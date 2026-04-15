FROM python:3.10-slim

# Set working directory
WORKDIR /app

# Copy only requirements first (better caching)
COPY requirements.txt .

# Install dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy remaining files
COPY . .

# Expose port (Flask default)
EXPOSE 5000

# Run app
CMD ["python", "app.py"]
