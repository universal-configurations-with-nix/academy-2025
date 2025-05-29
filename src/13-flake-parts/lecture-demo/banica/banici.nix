{ config, inputs, self, lib, withSystem, ... }:
{
  flake = {
    nixosConfigurations.banica_2mekici_tarator = inputs.nixpkgs.lib.nixosSystem rec {
      system = "x86_64-linux";

      modules = [
        ({ config, pkgs, lib, inputs, inputs', ... }: {
          environment.systemPackages = [
            pkgs.vim
            inputs.naj-dobriq-flake.packages.${pkgs.system}.ts
            inputs'.naj-dobriq-flake.packages.cloak
            inputs'.nixpkgs.legacyPackages.neovim
          ];
        })
      ];

      specialArgs = {
        inherit inputs;
        inputs' = withSystem system ({ inputs', ... }: inputs');
      };
    };
  };
}

