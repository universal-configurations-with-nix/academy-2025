{ config, pkgs, ... }:
{
  imports = [
    ./boot.nix
    ./john.nix
    ./graphics_environment.nix

    ./hello.nix
    ./demoUser.nix
  ];

  hello = false;
  addDemoUser = true;

  virtualisation.vmVariant.virtualisation = {
    memorySize = 2048; # В мегабайти
    cores = 2;
  };

  system.stateVersion = "24.05";
}
