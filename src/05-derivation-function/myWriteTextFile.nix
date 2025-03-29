with import <nixpkgs> { };
let
  myWriteTextFile = { name, text }:
    derivation {
      system = "x86_64-linux";
      inherit name;

      builder = ./myWriteTextFile.sh;
      args = [ text ];
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
