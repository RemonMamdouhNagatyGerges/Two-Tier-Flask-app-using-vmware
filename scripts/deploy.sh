#!/bin/bash

# Deployment script

echo "Starting deployment..."

# Pull latest changes
git pull origin main

# Restart application
if [ -f docker-compose.yml ]; then
    docker-compose down
    docker-compose up -d --build
    echo "Application deployed using Docker Compose"
else
    # Traditional deployment
    source venv/bin/activate
    pip install -r requirements.txt
    # Use process manager like systemd or supervisor in production
    echo "Traditional deployment completed"
fi

echo "Deployment finished!"