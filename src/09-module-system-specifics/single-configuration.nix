{ config, pkgs, ... }:
{
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  users.users.john = {
    isNormalUser = true;       # Дали е истински потребител
    extraGroups = [ "wheel" ]; # Дали има административни права
    initialPassword = "test";  # Парола
    hashedPassword = "$y$j9T$u2ZpZeHnFEfGlLlicj49k0$XCVRM8brbwe67WOEFoNSYX.s8Yrt/JdCmMDYCFe7pp."; # Съответства на паролата "asdf"
    packages = with pkgs; [
      firefox copyq
    ];
  };

  services.xserver.enable = true;
  services.xserver.desktopManager.mate.enable = true;

  services.xserver.xkb = {
    layout = "us,bg";                 # Английска и българска клавиатура
    variant = ",phonetic";            # QWERTY и ЯВЕРТЪ варианти
    options = "grp:alt_shift_toggle"; # Смяна на език с Alt+Shift
  };

  virtualisation.vmVariant.virtualisation = {
    memorySize = 2048; # В мегабайти
    cores = 2;
  };

  system.stateVersion = "24.05";
}
