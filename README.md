# nvim-config

Ma config Neovim pour coder : thème sombre doré, explorateur de fichiers, recherche, autocomplétion et LSP.
Elle va avec ma config WezTerm (voir [WezTerm](#wezterm) plus bas).

L'installation ci-dessous met **tout dans ton dossier personnel** (`~/.local`) : elle marche **sans sudo** (ordis de l'école,
machine partagée…) comme sur ton propre PC.

## Installation (Linux, sans sudo)

Une seule ligne à copier (elle marche aussi pour mettre à jour : relance-la quand tu veux) :

```bash
{ [ -f ~/.config/nvim/install.sh ] || git clone https://github.com/Kasouker/nvim-config.git ~/.config/nvim; } && git -C ~/.config/nvim pull -q && bash ~/.config/nvim/install.sh
```

Le script `install.sh` met tout dans ton dossier personnel (`~/.local`) et saute ce qui est déjà là :

- **Neovim 0.11.6** (la version avec laquelle la config est testée), s'il est absent ou plus ancien que la 0.11 ;
- **ripgrep** (chercher du texte : `<Espace>fg`) et **lazygit** (git dans nvim : `<Espace>gg`), s'ils sont absents ;
- `~/.local/bin` dans ton `PATH`, si besoin ;
- **les plugins**, aux versions de `lazy-lock.json` (quelques minutes la première fois).

Ensuite, ouvre un nouveau terminal (ou `exec $SHELL`) et lance `nvim`. À la première ouverture d'un type de fichier,
sa coloration se compile toute seule (quelques secondes), et le serveur Lua s'installe à l'ouverture d'un fichier
`.lua`.

> Il faut `git`, `curl`, `tar`, `make` et un compilateur C (`cc`) : ils sont presque toujours déjà là. S'il en manque
> un et que tu as sudo : `sudo apt install -y git curl tar gcc make xclip`. Sans sudo : demande à l'admin.
>
> Tu as déjà une config Neovim ? Le `git clone` refusera de l'écraser : mets-la d'abord de côté avec
> `mv ~/.config/nvim ~/.config/nvim.bak` (et `mv ~/.local/share/nvim ~/.local/share/nvim.bak` pour ses plugins).

### Les icônes

Si tu vois des carrés ou des `?` à la place des icônes, ton terminal n'a pas de **Nerd Font**. Sans sudo :

```bash
mkdir -p ~/.local/share/fonts/IosevkaTerm && cd ~/.local/share/fonts/IosevkaTerm
curl -fsSLO https://github.com/ryanoasis/nerd-fonts/releases/latest/download/IosevkaTerm.zip
unzip -oq IosevkaTerm.zip && rm IosevkaTerm.zip && fc-cache -f && cd ~
```

C'est la police de ma config WezTerm, qui la choisit toute seule. Avec un autre terminal, choisis
« IosevkaTerm Nerd Font » dans ses réglages.

## Des plugins pour une seule machine

Les fichiers rangés dans `lua/plugins_local/` sont chargés comme les autres plugins, mais **git les ignore** : ils
restent sur la machine et ne partent jamais sur GitHub. Pratique pour un plugin dont tu n'as besoin qu'à un endroit
(la norminette à l'école, par exemple). Il suffit d'y mettre un fichier comme ceux de `lua/plugins/`.

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

Le terminal qui va avec : fond d'écran, barre d'onglets dorée, panneaux, et en option le compteur
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
