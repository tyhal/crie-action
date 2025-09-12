#!/bin/sh
set -eu

has_command() {
        command -v "$1" >/dev/null 2>&1
}

if has_command podman; then
    echo "✅ podman is already installed"
    exit 0
else
    echo "📦 Installing podman..."
fi

install_brew() {
  brew install podman
}

install_apt() {
  export DEBIAN_FRONTEND=noninteractive
  apt-get update
  apt-get -y install podman
}

if has_command brew; then
  install_brew
elif has_command apt-get; then
  install_apt
else
  echo "unknown package manager"
fi

