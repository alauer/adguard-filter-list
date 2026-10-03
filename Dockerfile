FROM ubuntu:noble

    # Install necessary packages
    RUN apt-get update && apt-get install -y \
        git \
        curl \
        npm \
        # Add other tools/dependencies as needed
        && rm -rf /var/lib/apt/lists/*

    RUN npm i -g @adguard/hostlist-compiler@v2.1.1
    COPY --chmod=+x ./scripts/build-list.sh /usr/local/bin/build-list.sh
    COPY --chmod=+rwx hostlist-compiler-config.json /hostlist-compiler-config.json
    ENTRYPOINT ["/usr/local/bin/build-list.sh"]

    # Set a working directory
    WORKDIR /workspaces
