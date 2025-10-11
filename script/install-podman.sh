#!/bin/sh
set -eu

target_cmd=podman
has_command() {
	command -v "$1" >/dev/null 2>&1
}
if has_command $target_cmd; then
	echo "✅ $target_cmd is already installed"
	exit 0
else
	echo "📦 Installing $target_cmd..."
fi

install_with_brew() {
	brew install podman
}

install_with_apt() {
	export DEBIAN_FRONTEND=noninteractive
	apt-get update
	apt-get -y install podman
}

if has_command brew; then
	install_with_brew
elif has_command apt-get; then
	install_with_apt
else
	echo "unknown package manager"
fi
