with import <nixpkgs> { };
let
  myWriteShellApplication = { name, text, runtimeInputs ? [] }:
    stdenv.mkDerivation {
      inherit name;
      src = ./.;

      buildInputs = [ toybox ];
      nativeBuildInputs = [ bash ] ++ runtimeInputs;

      buildPhase = let
        runtimePath = builtins.concatStringsSep
          ":"
          (map (i: i + "/bin") runtimeInputs);
      in ''
        cat <<EOF > ./myScript
        #!$(which bash)

        export PATH="${runtimePath}:\$PATH"

        ${text}
        EOF
        chmod +x ./myScript
      '';

      installPhase = ''
        mkdir -p "$out/bin"
        mv ./myScript "$out/bin/${name}"
      '';

      dontFixup = true;
    };
in
  myWriteShellApplication {
    name = "page_lines";
    runtimeInputs = [ curl cloc ];
    text = "curl -s \"$1\" | cloc --force-lang=html -";
  }
