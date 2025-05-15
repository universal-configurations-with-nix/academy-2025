{ config, pkgs, ... }:
{
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  users.users = {
    rsmith = {
      isNormalUser = true;       # Дали е истински потребител
      extraGroups = [ "wheel" ]; # Дали има административни права
      # Парола "michael"
      hashedPassword = "$y$j9T$gHXWyoJLt7IWNGdTz8ms5/$/IZHiRR.l0QfmdsYdeY8hGLzLLvkLQv9WcKW5uf0Pf6";
      packages = with pkgs; [
        gcc vim cmake
      ];
    };
    gsmith = {
      isNormalUser = true;       # Дали е истински потребител
      extraGroups = [ "wheel" ]; # Дали има административни права
      # Парола "thomas"
      hashedPassword = "$y$j9T$axbv8MoUoXqjaeGIPzJRQ1$lCvqmgq9cmQao6Bx1zGa4/G8ifGkOg146V6mfMJokd5";
      packages = with pkgs; [
        python314 lynx emacs
      ];
    };
  };

  environment.systemPackages = with pkgs; [
    # lsblk не съществува като самостоятелен пакет
    # Търсим го в search.nixos.org/packages и излиза "util-linux" като пакет,
    # който предоставя командата
    htop util-linux
  ];

  system.stateVersion = "24.05";
}
