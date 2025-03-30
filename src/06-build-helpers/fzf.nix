with import <nixpkgs> { };
buildGoModule rec {
  name = "fzf";
  version = "0.60.3";

  src = fetchFromGitHub {
    owner = "junegunn";
    repo = "fzf";
    rev = "refs/tags/v${version}";
    hash = "sha256-wa4tRPw+PMzGxvSm/uceQF1gZw2Kh5uattpgDCYoedA=";
  };

  vendorHash = "sha256-i4ofEI4K6Pypf5KJi/OW6e/vhnCHUArMHnZKrvQ8eww=";
}
