FROM debian:trixie-slim

    # Install necessary packages
    RUN apt-get update && apt-get install -y \
        git \
        curl \
        build-essential \
        npm \
        # Add other tools/dependencies as needed
        && rm -rf /var/lib/apt/lists/*

    RUN npm i -g @adguard/hostlist-compiler@v1.0.39
    COPY --chmod=+x ./scripts/build-list.sh /usr/local/bin/build-list.sh
    COPY --chmod=+rwx hostlist-compiler-config.json /hostlist-compiler-config.json
    #ENTRYPOINT ["/usr/local/bin/compile-hostlist", "-c hostlist-compiler-config.json", "-o blocklist"]
    ENTRYPOINT ["/usr/local/bin/build-list.sh"]

    # Set a working directory
    WORKDIR /workspaces
