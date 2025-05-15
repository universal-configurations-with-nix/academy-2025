{ config, pkgs, ... }:
{
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  users.users = {
    michael = {
      isNormalUser = true;       # Дали е истински потребител
      extraGroups = [ "wheel" ]; # Дали има административни права
      hashedPassword = "$y$j9T$gHXWyoJLt7IWNGdTz8ms5/$/IZHiRR.l0QfmdsYdeY8hGLzLLvkLQv9WcKW5uf0Pf6";
    };
    thomas = {
      isNormalUser = true;       # Дали е истински потребител
      extraGroups = [ "wheel" ]; # Дали има административни права
      hashedPassword = "$y$j9T$axbv8MoUoXqjaeGIPzJRQ1$lCvqmgq9cmQao6Bx1zGa4/G8ifGkOg146V6mfMJokd5";
    };
  };

  system.stateVersion = "24.05";
}
