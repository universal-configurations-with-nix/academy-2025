with import <nixpkgs> { };
writeShellApplication {
  name = "script.sh";
  text = "echo 'Hello World!'";
}
