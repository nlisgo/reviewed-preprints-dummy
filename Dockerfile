# Use the official WireMock image as the base image
FROM wiremock/wiremock:3.3.1-1

# Copy local mappings directory to the container
COPY ./wiremock/mappings /home/wiremock/mappings

# Enable local response templating
CMD ["--local-response-templating"]

# Set up a health check
HEALTHCHECK --interval=5s --timeout=5s --retries=10 --start-period=30s \
  CMD curl --fail http://localhost:8080/__admin/health || exit 1

# Expose port 8080 for the WireMock server
EXPOSE 8080
