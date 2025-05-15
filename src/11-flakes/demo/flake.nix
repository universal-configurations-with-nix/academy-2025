{
  inputs.nixpkgs.url = "github:nixos/nixpkgs/nixos-24.11";
  outputs = inputs: {
    legacyPackages."x86_64-linux".default =
      inputs.nixpkgs.legacyPackages."x86_64-linux".gcc;
    legacyPackages."x86_64-linux".fast.fetch =
      inputs.nixpkgs.legacyPackages."x86_64-linux".fastfetch;
    devShells."x86_64-linux".default = let
      pkgs = inputs.nixpkgs.legacyPackages."x86_64-linux";
    in pkgs.mkShellNoCC {
      buildInputs = [
        pkgs.cowsay
      ];
    };

    nixosModules.banica = { config, pkgs, lib, ... }: {
      environment.systemPackages = [ pkgs.vim ];
    };
    nixosConfigurations.moqtLaptop = null;

    overlays.banica = self: super: {
      gawk = (super.gawk.override { interactive = true; }).overrideAttrs { version = "banica"; };
    };
  };
}
