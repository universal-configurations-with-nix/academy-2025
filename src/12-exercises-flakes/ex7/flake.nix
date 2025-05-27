{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.11";
    ex6.url = "path:../ex6";
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

            # Тези атрибути може да бъдат вкарани някъде в modularized конфигурацията
            {
              # international
              # Важно: от modularized/graphics_environment.nix сме премахнали xkb атрибута,
              # защото пречи на нашия international модул
              # Важно: при включване на компютъра, езика ще бъде на български (заради реда в locations).
              # Трябва да се натисне Shift+Alt, за да се смени на английски преди login
              enable = true;
              locations = [ "Sofia" "London" ];
              # rust-dev-improved
              rust-dev.john.enable = true;
            }
          ];
        };
      };
}
