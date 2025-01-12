{
  description = "dotfile requirements";

  inputs = { nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable"; };

  outputs = { self, nixpkgs, }:
    let systems = [ "aarch64-linux" "x86_64-linux" "aarch64-darwin" ];
    in {
      packages = nixpkgs.lib.genAttrs systems (system: {
        default = nixpkgs.legacyPackages.${system}.buildEnv {
          name = "impactaky-dotfiles";
          paths = with nixpkgs.legacyPackages.${system}; [
            atuin
            deno
            fzf
            gh
            git
            httpie
            lazydocker
            neovim
            nufmt
            nushell
            nixfmt
            ripgrep
            starship
            thefuck
            tmux
            uv
            zoxide
            zsh
          ];
        };
      });
    };
}
