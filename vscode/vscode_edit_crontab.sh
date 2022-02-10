#!/bin/bash

script_pdir="$(cd "$(dirname ${BASH_SOURCE[0]})" &>/dev/null && pwd)"
export VISUAL="$script_pdir/vscode_edit.sh"
export EDITOR="$script_pdir/vscode_edit.sh"

echo "Save and exit tab to update cronjobs"
crontab -e
