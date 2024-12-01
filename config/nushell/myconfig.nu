$env.PATH = ($env.PATH | prepend ($env.DOTFILES | path join "result" "bin"))
let config_dir = $env.DOTFILES | path join "config"
alias tmux = tmux -f ($config_dir | path join "tmux" "tmux.conf")
alias vim = nvim
$env.NIX_CONF_DIR = $config_dir | path join "nix"

$env.ATUIN_CONFIG_DIR = $env.DOTFILES | path join "config" "atuin"
source ./atuin.nu

$env.STARSHIP_CONFIG = $env.DOTFILES | path join "config" "starship.toml"
source ./starship.nu

source ./zoxide.nu
$env.config = (
    $env.config | upsert keybindings (
        $env.config.keybindings
        | append {
            name: zoxide_zi
            modifier: control
            keycode: char_f
            mode: [emacs, vi_normal, vi_insert]
            event: { send: executehostcommand cmd: "__zoxide_zi" }
        }
    )
)