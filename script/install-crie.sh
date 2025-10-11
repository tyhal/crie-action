#!/bin/sh
set -eu

has_command() {
	command -v "$1" >/dev/null 2>&1
}
install_brew() {
	/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
}
install_with_brew() {
	brew install tyhal/tap/crie
}

enure_brew() {
	target_cmd=brew
	if has_command $target_cmd; then
		echo "✅ $target_cmd is already installed"
	else
		echo "📦 Installing $target_cmd..."
		install_brew
	fi
}

ensure_crie() {
	target_cmd=crie
	if has_command $target_cmd; then
		echo "✅ $target_cmd is already installed"
		exit 0
	else
		echo "📦 Installing $target_cmd..."
		enure_brew
		install_with_brew
	fi
}

ensure_crie
