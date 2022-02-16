FROM debian:bullseye-slim

RUN set -eux; \
	apt-get update; \
	apt-get install -y --no-install-recommends \
		debian-ports-archive-keyring \
		debootstrap \
		wget ca-certificates \
		xz-utils \
		\
		gnupg dirmngr \
	; \
	rm -rf /var/lib/apt/lists/*

# fight the tyrrany of HSTS (which destroys our ability to transparently cache snapshot.debian.org responses)
ENV WGETRC /.wgetrc
RUN echo 'hsts=0' >> "$WGETRC"

# https://github.com/debuerreotype/debuerreotype/issues/100
# https://tracker.debian.org/pkg/distro-info-data
# http://snapshot.debian.org/package/distro-info-data/
# http://snapshot.debian.org/package/distro-info-data/0.51/
RUN set -eux; \
	wget -O distro-info-data.deb 'http://snapshot.debian.org/archive/debian/20210724T033023Z/pool/main/d/distro-info-data/distro-info-data_0.51_all.deb'; \
	echo 'c5f4a3bd999d3d79612dfec285e4afc4f6248648 *distro-info-data.deb' | sha1sum --strict --check -; \
	apt-get install -y ./distro-info-data.deb; \
	rm distro-info-data.deb; \
	[ -s /usr/share/distro-info/debian.csv ]

# https://salsa.debian.org/installer-team/debootstrap/-/merge_requests/63
RUN set -eux; \
	apt-get update; \
	apt-get install -y --no-install-recommends patch; \
	rm -rf /var/lib/apt/lists/*; \
	wget -O debootstrap-download-main.patch 'https://salsa.debian.org/installer-team/debootstrap/-/merge_requests/63.diff'; \
	awk '$1 == "diff" { p = ($3 == "a/functions") } p { print }' debootstrap-download-main.patch > functions.patch; \
	patch --input=functions.patch /usr/share/debootstrap/functions; \
	rm debootstrap-download-main.patch functions.patch

# see ".dockerignore"
COPY . /opt/debuerreotype
RUN set -eux; \
	cd /opt/debuerreotype/scripts; \
	for f in debuerreotype-*; do \
		ln -svL "$PWD/$f" "/usr/local/bin/$f"; \
	done; \
	version="$(debuerreotype-version)"; \
	[ "$version" != 'unknown' ]; \
	echo "debuerreotype version $version"

WORKDIR /tmp
