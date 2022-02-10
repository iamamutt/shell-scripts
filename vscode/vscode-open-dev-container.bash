#! /bin/bash

ws_relpath=".."
ws_abspath="$(cd "$(dirname "${BASH_SOURCE[0]}")/${ws_relpath}" &>/dev/null && pwd)"

if ! command -v devcontainer &>/dev/null; then
	echo "#! Error: 'devcontainer' CLI not found. https://code.visualstudio.com/docs/remote/devcontainer-cli"
	exit 1
fi

echo "=> devcontainer open '${ws_abspath}'"
devcontainer open "${ws_abspath}"
