{
  description = "dotfile requirements";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
  };

  outputs = {
     self,
     nixpkgs,
  }: let
		system = "aarch64-linux";
	in {
    packages.${system}.default = nixpkgs.legacyPackages.${system}.buildEnv {
      name = "impactaky-dotfiles";
      paths = with nixpkgs.legacyPackages.${system}; [
        atuin
        gh
        git
        httpie
        lazydocker
        neovim
        nushell
        ripgrep
        starship
        thefuck
        tmux
        uv
      ];
    };
  };
}
