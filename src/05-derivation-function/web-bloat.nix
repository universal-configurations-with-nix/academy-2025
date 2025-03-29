with import <nixpkgs> { };
stdenv.mkDerivation {
  name = "web-bloat";

  src = fetchurl {
    url = "https://danluu.com/web-bloat/index.html";
    hash = "sha256-4j9kUV4xyYKhjFjV0nC5SbdyDmSFCSEXyd0MYXvDF2s=";
  };

  unpackPhase = ''
    cp "$src" ./index.html
  '';

  buildInputs = [ html2text ];

  buildPhase = ''
    html2text index.html > page.txt
  '';

  installPhase = ''
    mv page.txt "$out"
  '';
}
