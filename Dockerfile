# Use a slim base image for smaller size and better compatibility
FROM python:3.11

# Set working directory
WORKDIR /app

# Install Python dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy application files
COPY . .

RUN chmod +x start.sh
# Install netcat-openbsd (if standard netcat isn't available)
#RUN apt-get update && apt-get install -y netcat-openbsd && apt-get clean && rm -rf /var/lib/apt/lists/*

# Expose necessary ports
EXPOSE 8501

# Wait for FastAPI to start before launching Streamlit
CMD ["./start.sh"]