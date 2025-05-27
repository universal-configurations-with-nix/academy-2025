{
  inputs.nixpkgs.url = "github:nixos/nixpkgs/nixos-24.11";
  outputs = inputs:
    let
      system = "x86_64-linux";
      lib = inputs.nixpkgs.lib;
    in
      {
        nixosConfigurations = {
          smiths = lib.nixosSystem {
            inherit system;
            modules = [ ./modularized/ex05.nix ];
          };
          johnny = lib.nixosSystem {
            inherit system;
            modules = [ ./single-configuration.nix ];
          };
        };
      };
}
