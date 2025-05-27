{ pkgs, ... }:
{
  users.users.john = {
    isNormalUser = true;       # Дали е истински потребител
    extraGroups = [ "wheel" ]; # Дали има административни права
    hashedPassword = "$y$j9T$u2ZpZeHnFEfGlLlicj49k0$XCVRM8brbwe67WOEFoNSYX.s8Yrt/JdCmMDYCFe7pp."; # Съответства на паролата "asdf"
    packages = with pkgs; [
      firefox copyq
    ];
  };
}
