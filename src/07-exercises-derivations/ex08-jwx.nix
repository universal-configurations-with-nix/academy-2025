with import <nixpkgs> { };
buildGoModule rec {
  name = "jwx";
  version = "3.0.0";

  src = fetchFromGitHub {
    owner = "lestrrat-go";
    repo = name;
    tag = "v${version}";
    hash = "sha256-2d0cm8VnJD/llmzjlNOqyx+6EVjroMXIJAyuL9EFpsg=";
  };

  vendorHash = "sha256-43Mi3vVvIvRRP3PGbKQlKewbQwpI7vD48GE0v6IpZ88=";

  modRoot = "cmd/jwx";
}
