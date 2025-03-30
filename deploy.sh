#!/bin/bash

# Update system packages
sudo apt-get update -y

# Install Python and pip
sudo apt-get install -y python3 python3-pip

# Install dependencies from requirements.txt
pip3 install -r requirements.txt

# Install gunicorn for production
pip3 install gunicorn

# Set environment variables
if [ -f ".env" ]; then
    export $(grep -v '^#' .env | xargs)
fi

# Run the FastAPI application using uvicorn in production mode
uvicorn test_bedrock:app --host 0.0.0.0 --port 8000 --workers 4
