# Gemini CLI A2A Server Makefile

.PHONY: help install build build-sandbox build-all test lint format preflight clean start debug release run-npx create-alias run

# Default target
help:
	@echo "Gemini CLI A2A Server - Available commands:"
	@echo ""
	@echo "A2A Server Commands:"
	@echo "  make install           - Install dependencies"
	@echo "  make build             - Build all packages"
	@echo "  make run               - Start the A2A server (port 41242)"
	@echo "  make clean             - Clean build artifacts"
	@echo ""
	@echo "Gemini CLI Commands:"
	@echo "  make install          - Install npm dependencies"
	@echo "  make build            - Build the main project"
	@echo "  make build-all        - Build the main project and sandbox"
	@echo "  make test             - Run the test suite"
	@echo "  make lint             - Lint the code"
	@echo "  make format           - Format the code"
	@echo "  make preflight        - Run formatting, linting, and tests"
	@echo "  make clean            - Remove generated files"
	@echo "  make start            - Start the Gemini CLI"
	@echo "  make debug            - Start the Gemini CLI in debug mode"
	@echo ""
	@echo "  make run-npx          - Run the CLI using npx (for testing the published package)"
	@echo "  make create-alias     - Create a 'gemini' alias for your shell"
	@echo ""

# Install dependencies
install:
	@echo "Installing dependencies..."
	npm install
	cd packages/a2a-server && npm install

# Build all packages
build:
	@echo "Building packages..."
	npm run build
	cd packages/a2a-server && npm run build

# Start the A2A server
run:
	@echo "Starting A2A server on port 41242..."
	@echo "Server will be available at: http://localhost:41242"
	@echo "Agent card: http://localhost:41242/.well-known/agent-card.json"
	@echo "Press Ctrl+C to stop the server"
	@echo ""
	GEMINI_MODEL=gemini-2.0-flash CODER_AGENT_PORT=41242 node packages/a2a-server/dist/src/http/server.js

clean:
	@echo "Cleaning build artifacts..."
	npm run clean
	cd packages/a2a-server && npm run clean



# Makefile for gemini-cli
install:
	npm install

build:
	npm run build


build-all:
	npm run build:all

test:
	npm run test

lint:
	npm run lint

format:
	npm run format

preflight:
	npm run preflight

clean:
	npm run clean

start:
	npm run start

debug:
	npm run debug


run-npx:
	npx https://github.com/google-gemini/gemini-cli

create-alias:
	scripts/create_alias.sh
