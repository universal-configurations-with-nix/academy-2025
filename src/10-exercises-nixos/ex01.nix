{ config, pkgs, ... }:
{
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  users.users.james = {
    isNormalUser = true;       # Дали е истински потребител
    extraGroups = [ "wheel" ]; # Дали има административни права
    password = "james";        # Парола
  };

  system.stateVersion = "24.05";
}
