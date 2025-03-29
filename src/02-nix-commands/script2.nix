with import <nixpkgs> { };
writeShellApplication {
  name = "script.sh";
  runtimeInputs = [ fastfetch ];
  text = "fastfetch";
}
