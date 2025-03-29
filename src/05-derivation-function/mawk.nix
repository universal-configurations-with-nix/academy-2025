with import <nixpkgs> { };
stdenv.mkDerivation {
  name = "mawk";
  version = "1.3.4";

  src = fetchzip {
    url = "https://invisible-mirror.net/archives/mawk/mawk-1.3.4-20240819.tgz";
    hash = "sha256-zlJN4oOFBTOM4/mjYAgk5PifnKn6ldFQoxFBpyuVz4w=";
  };
}
