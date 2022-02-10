# add the following to ~/.bashrc or ~/.bash_profile

add_vscode_exec() {
	local code_path
	code_path=$(find ~/.vscode-server/bin -maxdepth 4 -name code -type f \
		-printf "%T@\t%p\n" 2>/dev/null | sort -n -r | cut -f 2- | head -n 1)
	[[ -z "${code_path}" ]] || export PATH="$(dirname $code_path):$PATH"
}

add_vscode_exec

# find ~/project -maxdepth 4 -name *.py -type f -printf "%T@\t%Tc\t%p\n" 2>/dev/null | sort -n -r | cut -f 2- | head -n 10
