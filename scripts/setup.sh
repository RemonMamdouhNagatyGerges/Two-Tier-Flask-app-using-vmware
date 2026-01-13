#!/bin/bash

# Setup script for Flask application

echo "Setting up Flask 2-Tier Application..."

# Create virtual environment
python3 -m venv venv

# Activate virtual environment
source venv/bin/activate

# Install dependencies
pip install --upgrade pip
pip install -r requirements.txt

# Initialize database
python3 -c "
from run import app
from app.models import db
with app.app_context():
    db.create_all()
    print('Database initialized successfully')
"

echo "Setup completed!"
echo "To run the application: source venv/bin/activate && python run.py"