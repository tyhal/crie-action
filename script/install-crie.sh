#!/bin/sh
set -eu

if command -v crie >/dev/null 2>&1; then
    echo "✅ crie is already installed"
    exit 0
else
    echo "📦 Installing crie v${CRIE_VERSION}..."
fi

CRIE_VERSION="${CRIE_VERSION:-0.20.2}"
INSTALL_DIR="${INSTALL_DIR:-/usr/local/bin}"

# Detect architecture
ARCH=$(uname -m)
case $ARCH in
    x86_64) ARCH="amd64" ;;
    aarch64) ARCH="arm64" ;;
    *) echo "❌ Unsupported architecture: $ARCH" && exit 1 ;;
esac

# Create temp directory
TEMP_DIR=$(mktemp -d)

# Download and install
wget -O "$TEMP_DIR/crie.tar.gz" \
    "https://github.com/tyhal/crie/releases/download/v${CRIE_VERSION}/crie_${CRIE_VERSION}_linux_${ARCH}.tar.gz"

cd "$TEMP_DIR"
tar -xzf crie.tar.gz
chmod +x crie

# Install (use sudo if needed)
if [ -w "$INSTALL_DIR" ]; then
    mv crie "$INSTALL_DIR/"
else
    sudo mv crie "$INSTALL_DIR/"
fi

# Cleanup
cd /
rm -rf "$TEMP_DIR"

echo "✅ crie v${CRIE_VERSION} installed successfully to $INSTALL_DIR"
