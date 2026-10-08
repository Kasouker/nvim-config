
-- Clone la norminette officielle et l'installe avec pipx à chaque mise à jour

return {

"42school/norminette",

lazy = true,

build = "pipx install --force .",

}

