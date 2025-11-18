#!/bin/bash

# Deploy script for Portfolio AI Prediction
# This script is designed to be run on a home server

set -e

echo "======================================"
echo "Portfolio AI Prediction Deployment"
echo "======================================"

# Navigate to the infra directory
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$SCRIPT_DIR"

# Pull latest changes (optional - uncomment if deploying from git)
# echo "Pulling latest changes from git..."
# cd ..
# git pull origin main
# cd infra

# Stop existing containers
echo "Stopping existing containers..."
docker-compose down

# Remove old images (optional - uncomment to save disk space)
# echo "Removing old images..."
# docker-compose rm -f

# Build and start services
echo "Building and starting services..."
docker-compose up -d --build

# Show running containers
echo "======================================"
echo "Deployment completed!"
echo "======================================"
docker-compose ps

# Show logs (optional)
echo ""
echo "To view logs, run: docker-compose logs -f"
echo "To stop services, run: docker-compose down"
echo ""
echo "Services:"
echo "  - Admin: http://localhost:3001"
echo "  - API: http://localhost:3000"
echo "  - Web: http://localhost:3002"
echo "  - AI: http://localhost:8000"
