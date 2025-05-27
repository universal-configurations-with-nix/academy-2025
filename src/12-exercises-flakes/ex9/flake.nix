{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.11";
    ex6.url = "path:../ex6";
    ex8.url = "path:../ex8";
  };
  outputs = inputs:
    let
      system = "x86_64-linux";
      lib = inputs.nixpkgs.lib;
    in
      {
        nixosConfigurations.modo = lib.nixosSystem {
          inherit system;
          modules = [
            ./modularized/configuration.nix
            inputs.ex6.nixosModules.international
            inputs.ex6.nixosModules.rust-dev-improved
            {
              enable = true;
              locations = [ "Sofia" "London" ];
              rust-dev.john.enable = true;
            }

            # Това е единствената разлика с решнието на задача 7
            ({ pkgs, ... }: {
              # Така прилагаме flake-овете върху nixpkgs
              nixpkgs.overlays = [
                inputs.ex8.overlays.mypkgs
                inputs.ex8.overlays.acepe
              ];

              # Ето така използваме overlay-ове, всичко просто се прилага върху nixpkgs
              # и нашия pkgs се изменя, все едно онези настройки винаги са били активни
              environment.systemPackages = with pkgs; [ ts ape ];
            })
          ];
        };
      };
}
