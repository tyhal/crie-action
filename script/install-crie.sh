#!/bin/sh
set -eu

has_command() {
	command -v "$1" >/dev/null 2>&1
}

install_with_brew() {
	brew install tyhal/tap/crie
}

ensure_crie() {
	target_cmd=crie
	if has_command $target_cmd; then
		echo "✅ $target_cmd is already installed"
		exit 0
	else
		echo "📦 Installing $target_cmd..."
		install_with_brew
	fi
}

ensure_crie
