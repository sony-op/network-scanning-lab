#!/bin/bash

# Network Scanning Lab Setup Script
# This script sets up the complete lab environment

set -e

echo "==============================================="
echo "   Network Scanning Lab Setup Script"
echo "==============================================="
echo ""

# Color codes
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Check if Docker is installed
echo -e "${YELLOW}[*]${NC} Checking Docker installation..."
if ! command -v docker &> /dev/null; then
    echo -e "${RED}[✗]${NC} Docker not found! Please install Docker first."
    echo "Visit: https://docs.docker.com/get-docker/"
    exit 1
fi
echo -e "${GREEN}[✓]${NC} Docker found!"

# Check if docker-compose is installed
echo -e "${YELLOW}[*]${NC} Checking Docker Compose installation..."
if ! command -v docker-compose &> /dev/null; then
    echo -e "${RED}[✗]${NC} Docker Compose not found! Please install docker-compose first."
    echo "Visit: https://docs.docker.com/compose/install/"
    exit 1
fi
echo -e "${GREEN}[✓]${NC} Docker Compose found!"
echo ""

# Create necessary directories
echo -e "${YELLOW}[*]${NC} Creating directories..."
mkdir -p scan-results
mkdir -p scripts
mkdir -p data
mkdir -p docs
echo -e "${GREEN}[✓]${NC} Directories created!"
echo ""

# Pull Docker images
echo -e "${YELLOW}[*]${NC} Pulling Docker images (this may take a few minutes)..."
echo -e "${YELLOW}[*]${NC} Pulling Kali Linux image..."
docker pull kalilinux/kali-rolling
echo -e "${GREEN}[✓]${NC} Kali Linux image pulled!"

echo -e "${YELLOW}[*]${NC} Pulling Metasploitable2 image..."
docker pull tleemcjr/metasploitable2
echo -e "${GREEN}[✓]${NC} Metasploitable2 image pulled!"
echo ""

# Build custom Kali image
echo -e "${YELLOW}[*]${NC} Building custom Kali Linux image with all tools..."
docker build -t kali-scanner:latest .
echo -e "${GREEN}[✓]${NC} Custom Kali image built!"
echo ""

# Start the lab environment
echo -e "${YELLOW}[*]${NC} Starting lab environment..."
docker-compose up -d
echo -e "${GREEN}[✓]${NC} Lab environment started!"
echo ""

# Get container IPs
echo -e "${YELLOW}[*]${NC} Getting container information..."
KALI_IP=$(docker inspect -f '{{range.NetworkSettings.Networks}}{{.IPAddress}}{{end}}' kali-scanner)
META_IP=$(docker inspect -f '{{range.NetworkSettings.Networks}}{{.IPAddress}}{{end}}' metasploitable-target)

echo ""
echo "==============================================="
echo -e "${GREEN}   ✓ Lab Setup Complete!${NC}"
echo "==============================================="
echo ""
echo -e "${YELLOW}📌 Container Information:${NC}"
echo "   Kali Linux IP: $KALI_IP"
echo "   Metasploitable IP: $META_IP"
echo ""
echo -e "${YELLOW}📌 To access Kali Linux:${NC}"
echo "   docker exec -it kali-scanner bash"
echo ""
echo -e "${YELLOW}📌 To access Metasploitable:${NC}"
echo "   docker exec -it metasploitable-target bash"
echo ""
echo -e "${YELLOW}📌 To stop the lab:${NC}"
echo "   docker-compose down"
echo ""
echo -e "${YELLOW}📌 To view logs:${NC}"
echo "   docker-compose logs -f"
echo ""
echo -e "${YELLOW}📌 Scan results will be saved in:${NC}"
echo "   ./scan-results/"
echo ""
echo -e "${GREEN}Happy Scanning! 🔍${NC}"
echo ""
