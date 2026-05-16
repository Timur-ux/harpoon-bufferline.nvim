 {
  description = "Harpoon + bufferline vimPlugin flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs =
    {
      self,
      nixpkgs,
      flake-utils,
      ...
    }:
    flake-utils.lib.eachDefaultSystem (
      system:
      let
        pkgs = import nixpkgs { inherit system; };
				plugin = pkgs.vimUtils.buildVimPlugin {
					 name = "harpoon-bufferline";
					 src = ./.;
				 };
      in
      {
				packages.default = plugin;
			}
    );
}
