#!/bin/sh
set -eu

target_cmd=brew
has_command() {
        command -v "$1" >/dev/null 2>&1
}
if has_command $target_cmd; then
    echo "✅ $target_cmd is already installed"
    exit 0
else
    echo "📦 Installing $target_cmd..."
fi

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"