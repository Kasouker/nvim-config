#!/usr/bin/env bash
# install.sh : installe ce qu'il faut à la config sous Linux, sans sudo (tout dans ~/.local) :
# Neovim 0.11.6 s'il est absent ou trop ancien, ripgrep et lazygit s'ils sont absents, ~/.local/bin dans le PATH,
# puis les plugins. À lancer après le clone : bash ~/.config/nvim/install.sh (peut être relancé sans risque).
set -euo pipefail

BIN="$HOME/.local/bin"
OPT="$HOME/.local/opt"
NVIM_VERSION="v0.11.6"
mkdir -p "$BIN" "$OPT"
export PATH="$BIN:$PATH"

step() { printf '\n\033[1;33m==> %s\033[0m\n' "$*"; }

# dl <dépôt GitHub> <fin du nom de l'archive> <programmes...> : la dernière version, dans ~/.local/bin
dl() {
	local repo=$1 end=$2 url tmp b
	shift 2
	url=$(curl -fsSL "https://api.github.com/repos/$repo/releases/latest" | grep -o "https://[^\"]*$end" | head -1)
	tmp=$(mktemp -d)
	curl -fsSL "$url" -o "$tmp/archive"
	mkdir "$tmp/x"
	tar -xf "$tmp/archive" -C "$tmp/x"
	for b in "$@"; do install -m 755 "$(find "$tmp/x" -type f -name "$b" | head -1)" "$BIN/"; done
	rm -rf "$tmp"
}

# Vrai si Neovim est là et en version 0.11 ou plus
nvim_ok() {
	local v
	v=$(nvim --version 2>/dev/null | head -1 | sed -n 's/^NVIM v\([0-9]*\)\.\([0-9]*\).*/\1 \2/p')
	[ -n "$v" ] && set -- $v && { [ "$1" -gt 0 ] || [ "$2" -ge 11 ]; }
}

step "Neovim"
if nvim_ok; then
	echo "déjà installé : $(nvim --version | head -1)"
else
	curl -fsSL "https://github.com/neovim/neovim/releases/download/$NVIM_VERSION/nvim-linux-x86_64.tar.gz" |
		tar -xz -C "$OPT"
	ln -sfn "$OPT/nvim-linux-x86_64/bin/nvim" "$BIN/nvim"
	echo "installé : $("$BIN/nvim" --version | head -1)"
fi

step "ripgrep et lazygit"
if command -v rg >/dev/null; then echo "ripgrep déjà là"; else dl BurntSushi/ripgrep x86_64-unknown-linux-musl.tar.gz rg && echo "ripgrep installé"; fi
if command -v lazygit >/dev/null; then echo "lazygit déjà là"; else dl jesseduffield/lazygit linux_x86_64.tar.gz lazygit && echo "lazygit installé"; fi

step "~/.local/bin dans le PATH"
for rc in "$HOME/.zshrc" "$HOME/.bashrc"; do
	if [ -e "$rc" ] && ! grep -q '\.local/bin' "$rc"; then
		printf '\nexport PATH="$HOME/.local/bin:$PATH"\n' >> "$rc"
		echo "ajouté à $rc"
	fi
done

step "Plugins (quelques minutes la première fois)"
nvim --headless "+Lazy! restore" +qa
echo "plugins installés"

step "Terminé"
echo "Ouvre un nouveau terminal (ou : exec \$SHELL), puis lance nvim."
