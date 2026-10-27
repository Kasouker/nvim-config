# nvim-config

Ma config Neovim pour coder : thème sombre doré, explorateur de fichiers, recherche, autocomplétion et LSP.
Elle va avec ma config WezTerm (voir [WezTerm](#wezterm) plus bas).

L'installation ci-dessous met **tout dans ton dossier personnel** (`~/.local`) : elle marche **sans sudo** (ordis de l'école,
machine partagée…) comme sur ton propre PC.

## Prérequis

Ces outils sont presque toujours déjà là. Vérifie :

```bash
git --version && curl --version | head -1 && cc --version | head -1 && make --version | head -1
```

S'il en manque un **et que tu as sudo** (Ubuntu / Debian) :

```bash
sudo apt install -y git curl tar unzip gcc make xclip
```

Sans sudo et s'il en manque un : demande à l'admin de la machine.

## 1. Installer les outils (sans sudo)

Copie-colle tout le bloc dans un terminal (Linux x86_64) :

```bash
mkdir -p ~/.local/bin ~/.local/opt && cd ~/.local/opt

# Neovim 0.11.6 (la version avec laquelle la config est testée)
curl -fsSL https://github.com/neovim/neovim/releases/download/v0.11.6/nvim-linux-x86_64.tar.gz | tar xz
ln -sf ~/.local/opt/nvim-linux-x86_64/bin/nvim ~/.local/bin/nvim

# ripgrep (chercher du texte : <Espace>fg)
url=$(curl -fsSL https://api.github.com/repos/BurntSushi/ripgrep/releases/latest | grep -o 'https://[^"]*x86_64-unknown-linux-musl.tar.gz' | head -1)
curl -fsSL "$url" | tar xz && cp ripgrep-*/rg ~/.local/bin/ && rm -rf ripgrep-*

# lazygit (git dans nvim : <Espace>gg)
url=$(curl -fsSL https://api.github.com/repos/jesseduffield/lazygit/releases/latest | grep -o 'https://[^"]*linux_x86_64.tar.gz' | head -1)
curl -fsSL "$url" | tar xz -C ~/.local/bin lazygit

cd ~
```

Puis ajoute `~/.local/bin` au `PATH` (une seule fois) et recharge le terminal :

```bash
echo 'export PATH="$HOME/.local/bin:$PATH"' >> ~/.zshrc   # ou ~/.bashrc si tu es sous bash
exec $SHELL
```

Vérifie : `nvim --version` doit afficher `NVIM v0.11.6`.

> Tu as déjà ces outils (assez récents, Neovim **0.11 ou plus**) ? Tu peux sauter cette étape.

## 2. Installer la config

Si tu as déjà une config Neovim, mets-la de côté d'abord :

```bash
[ -d ~/.config/nvim ] && mv ~/.config/nvim ~/.config/nvim.bak
[ -d ~/.local/share/nvim ] && mv ~/.local/share/nvim ~/.local/share/nvim.bak
```

Puis :

```bash
git clone https://github.com/Kasouker/nvim-config.git ~/.config/nvim
```

> Le dépôt est **privé** : git te demande ton nom GitHub, puis un **token** à la place du mot de passe
> (GitHub → Settings → Developer settings → Personal access tokens). Avec `gh auth login`, plus besoin du token.

## 3. Premier lancement

```bash
nvim
```

Au premier lancement, tout s'installe tout seul (quelques minutes, laisse faire) :

- les plugins (lazy.nvim) ;
- la coloration du code (treesitter compile ses parsers avec `cc`) ;
- le serveur Lua (Mason, lors de l'ouverture d'un fichier `.lua`).

Quand c'est fini, quitte (`:qa`) et relance `nvim`.

### Les icônes

Si tu vois des carrés ou des `?` à la place des icônes, ton terminal n'a pas de **Nerd Font**. Sans sudo :

```bash
mkdir -p ~/.local/share/fonts/IosevkaTerm && cd ~/.local/share/fonts/IosevkaTerm
curl -fsSLO https://github.com/ryanoasis/nerd-fonts/releases/latest/download/IosevkaTerm.zip
unzip -oq IosevkaTerm.zip && rm IosevkaTerm.zip && fc-cache -f && cd ~
```

C'est la police de ma config WezTerm, qui la choisit toute seule. Avec un autre terminal, choisis
« IosevkaTerm Nerd Font » dans ses réglages.

## Raccourcis

`<Espace>` est la touche leader.

| Touche | Action |
|---|---|
| `Ctrl+b` | Ouvrir / fermer l'explorateur de fichiers |
| `Ctrl+h` / `Ctrl+l` | Aller à la fenêtre de gauche / de droite |
| `Tab` / `Shift+Tab` | Onglet suivant / précédent |
| `<Espace>ff` | Chercher un fichier |
| `<Espace>fg` | Chercher du texte dans le projet |
| `<Espace>fb` | Fichiers ouverts |
| `<Espace>fr` | Fichiers récents |
| `<Espace>gg` | LazyGit |
| `<Espace>u` | Historique des annulations |

Quand un serveur de langage est actif (LSP) :

| Touche | Action |
|---|---|
| `gd` | Aller à la définition |
| `K` | Documentation |
| `<Espace>rn` | Renommer |
| `<Espace>ca` | Actions de code |
| `<Espace>d` | Voir l'erreur |

En mode insertion :

- `Ctrl+Espace` : ouvrir les suggestions ; `Tab` / `Shift+Tab` pour s'y déplacer ; `Entrée` pour valider ;
- `( [ { " '` se ferment tout seuls, et `<` aussi (`<>`) ;
- en HTML, un deuxième `<` sur la même ligne donne `</>`, pour fermer la balise.

## Ce qu'il y a dedans

| Plugin | Rôle |
|---|---|
| onedark.nvim | Le thème (fond transparent, couleurs retouchées) |
| lualine / bufferline | Barre d'état et onglets aux couleurs du thème |
| dashboard-nvim | Écran d'accueil (`f` fichiers, `r` récents, `c` config, `q` quitter) |
| nvim-tree | Explorateur de fichiers |
| telescope (+ fzf-native) | Recherche de fichiers et de texte |
| nvim-treesitter | Coloration du code |
| nvim-lspconfig + mason | Serveurs de langage (Lua d'office, TypeScript 7 via `tsc`) |
| nvim-cmp + LuaSnip | Autocomplétion |
| nvim-autopairs | Fermeture automatique des parenthèses, guillemets et `<` |
| indent-blankline / rainbow-delimiters | Guides d'indentation et parenthèses colorées |
| lazygit.nvim / undotree | Git et historique d'annulations |
| smear-cursor | Traînée animée derrière le curseur |

Fichiers C : vraies tabulations. Web (HTML, CSS, JS, TS, JSON) : 2 espaces. Le reste : 4 espaces.

## WezTerm

Le terminal qui va avec : fond d'écran, barre d'onglets dorée, panneaux, et le compteur
[logtime](https://github.com/Kasouker/logtime.wezterm). Son installation (sans sudo aussi) est dans le dépôt
[wezterm-config](https://github.com/Kasouker/wezterm-config).

Raccourcis des panneaux :

| Touche | Action |
|---|---|
| `Ctrl+Shift+d` / `Ctrl+Shift+e` | Couper le panneau en deux (côte à côte / l'un sous l'autre) |
| `Ctrl+Shift+h j k l` | Aller au panneau de gauche / du bas / du haut / de droite |
| `Ctrl+Shift+w` | Fermer le panneau |
| `Ctrl+Shift+t` | Nouvel onglet |

Pratique : nvim d'un côté, un terminal pour `make` ou `git` de l'autre.

## Mettre à jour

```bash
cd ~/.config/nvim && git pull
```

Puis dans nvim : `:Lazy sync`.

## Désinstaller

```bash
rm -rf ~/.config/nvim ~/.local/share/nvim ~/.local/state/nvim ~/.cache/nvim
rm -rf ~/.local/opt/nvim-linux-x86_64 ~/.local/bin/{nvim,rg,lazygit}
```

(Et remets ton ancienne config si tu l'avais sauvegardée : `mv ~/.config/nvim.bak ~/.config/nvim`.)
