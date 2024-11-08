# Use a lightweight base image
FROM python:3.9-slim

# Install necessary packages
RUN apt-get update && apt-get install -y \
    git \
    && rm -rf /var/lib/apt/lists/*

# Install dbt and required dependencies
RUN pip install dbt-core dbt-bigquery

# Set the working directory to the root
WORKDIR /

# Copy all files from the root of the repository into the container
COPY . .

# Install dbt dependencies specified in packages.yml
RUN dbt deps

# Default command to run dbt snapshot
CMD ["dbt", "snapshot"]
