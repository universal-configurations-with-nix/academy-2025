{
  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";

  outputs = inputs: let
    forEachPkgs = pkgs: {
      vim = pkgs.neovim;
    };

    forEachSystem = system: forEachPkgs inputs.nixpkgs.legacyPackages.${system};

    systems = [ "x86_64-linux" "aarch64-darwin" "aarch64-linux" ];
  in {
    nixosConfigurations = {
      mashina = null;
    };

    inherit forEachPkgs forEachSystem;

    packages = inputs.nixpkgs.lib.genAttrs systems forEachSystem;
    # packages = {
    #   x86_64-linux = {
    #     vim = inputs.nixpkgs.legacyPackages.x86_64-linux.neovim;
    #   };
    #   aarch64-darwin = {
    #     vim = inputs.nixpkgs.legacyPackages.aarch64-darwin.neovim;
    #   };
    # };
  };
}
