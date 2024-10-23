# Use Go 1.23.2 (or higher) version as the base image
FROM golang:alpine

# Install gin for hot reload
RUN go install github.com/codegangsta/gin@latest

# Environment variables
ENV PROJECT_DIR=/app \
    GO111MODULE=on \
    CGO_ENABLED=0

# Basic setup of the container
WORKDIR /app
COPY . .

# Command to run the gin hot-reload server
ENTRYPOINT ["gin", "--appPort", "3000", "--port", "3001", "run"]
