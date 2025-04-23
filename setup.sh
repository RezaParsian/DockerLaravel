#!/bin/bash

echo "🔧 Setting up Docker for Laravel..."

cp -r .docker ../.docker
cp docker-compose.yaml ../docker-compose.yaml
cp .dockerignore ../.dockerignore

echo "✅ Docker setup copied to Laravel project root."

