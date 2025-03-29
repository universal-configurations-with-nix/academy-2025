with import <nixpkgs> { };
let
  myWriteTextFile = { name, text }:
    stdenv.mkDerivation {
      inherit name;
      src = ./.;

      dontBuild = true;
      installPhase = ''
        printf "${text}" > "$out"
      '';
    };
in
  myWriteTextFile {
    name = "something.txt";
    text = ''
      First line
        second line
      third line
    '';
  }
