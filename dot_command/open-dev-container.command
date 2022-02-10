#! /bin/zsh

# place in same directory as vscode/vscode-open-dev-container.bash
# chmod +x open-dev-container.command

XSH_SRC=${BASH_SOURCE[0]:-${(%):-%x}}
this_dir="$(cd "$(dirname "${XSH_SRC}")" &>/dev/null && pwd)"

exec "${this_dir}/vscode-open-dev-container"
