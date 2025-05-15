{ config, pkgs, ... }:
{
  users.users.rsmith = {
    isNormalUser = true;       # Дали е истински потребител
    extraGroups = [ "wheel" ]; # Дали има административни права
    # Парола "michael"
    hashedPassword = "$y$j9T$gHXWyoJLt7IWNGdTz8ms5/$/IZHiRR.l0QfmdsYdeY8hGLzLLvkLQv9WcKW5uf0Pf6";
    packages = with pkgs; [
      gcc vim cmake
    ];
  };
}
