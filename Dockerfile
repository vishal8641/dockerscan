# Use an official Python image as the base
FROM python:3.8.10

# Set the working directory in the container
WORKDIR /vulnerabilities
# Set environment variables for Flask
ENV FLASK_APP=app.py
ENV FLASK_RUN_HOST=0.0.0.0
ENV FLASK_ENV=production

# Copy requirements.txt file to install dependencies
COPY requirements.txt ./

# Instapt-get install -y --no-instll dependencies
RUN pip install --no-cache-dir -r requirements.txt \
    && apt-get clean

# Copy the rest of the application code
COPY . .

# Expose the port the app runs on
EXPOSE 5000


# Run the Flask application
CMD ["python", "main.py"]
