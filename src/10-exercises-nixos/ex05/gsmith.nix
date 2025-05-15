{ pkgs, ... }:
{
  users.users.gsmith = {
    isNormalUser = true;       # Дали е истински потребител
    extraGroups = [ "wheel" ]; # Дали има административни права
    # Парола "thomas"
    hashedPassword = "$y$j9T$axbv8MoUoXqjaeGIPzJRQ1$lCvqmgq9cmQao6Bx1zGa4/G8ifGkOg146V6mfMJokd5";
    packages = with pkgs; [
      python314 lynx emacs
    ];
  };
}
