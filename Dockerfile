FROM python:3-bookworm

    # Install necessary packages
    RUN apt-get update && apt-get install -y \
        git \
        curl \
        build-essential \
        npm \
        # Add other tools/dependencies as needed
        && rm -rf /var/lib/apt/lists/*
    
    RUN npm i -g @adguard/hostlist-compiler@v1.0.39 \

    # Set a working directory
    WORKDIR /workspaces