#!/bin/bash

OPTS=""
if [[ "$1" == /tmp/* ]]; then
	OPTS="-w"
fi

SCRIPT_PARENT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" &>/dev/null && pwd)"

VSCODE=$(which code)

if [[ -z "$VSCODE" ]]; then
	echo "VSCODE executable not found."
	exit 1
fi

echo "script path: $SCRIPT_PARENT_DIR"
echo "vscode path: $VSCODE"

"$VSCODE" ${OPTS:-} -a "$@"
