{ pkgs, ... }:
{
  imports = [
    ./gsmith.nix
    ./rsmith.nix
    ./gui.nix
  ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  environment.systemPackages = with pkgs; [
    # lsblk не съществува като самостоятелен пакет
    # Търсим го в search.nixos.org/packages и излиза "util-linux" като пакет,
    # който предоставя командата
    htop util-linux
  ];

  virtualisation.vmVariant.virtualisation = {
    memorySize = 2048; # 2MB RAM памет
    cores = 2;
  };

  system.stateVersion = "24.05";
}
