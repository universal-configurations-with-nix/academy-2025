with import <nixpkgs> { };
writeShellApplication {
  name = "page_lines";
  runtimeInputs = [ curl cloc ];
  text = "curl -s \"$1\" | cloc --force-lang=html -";
}
