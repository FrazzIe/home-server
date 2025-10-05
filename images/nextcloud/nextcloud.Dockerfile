FROM nextcloud:31.0.9

# Install runtime packages (previews + office docs + media)
RUN set -ex; \
    apt-get update; \
    apt-get install -y --no-install-recommends \
        ffmpeg \
        ghostscript \
        libreoffice \
    ; \
    rm -rf /var/lib/apt/lists/*

# Build and enable PHP extensions (bz2)
RUN set -ex; \
    savedAptMark="$(apt-mark showmanual)"; \
    apt-get update; \
    apt-get install -y --no-install-recommends \
        libbz2-dev \
    ; \
    docker-php-ext-install \
        bz2 \
    ; \
    \
    # clean up build deps
    apt-mark auto '.*' > /dev/null; \
    apt-mark manual $savedAptMark; \
    apt-get purge -y --auto-remove -o APT::AutoRemove::RecommendsImportant=false; \
    rm -rf /var/lib/apt/lists/*

ENV NEXTCLOUD_UPDATE=1

