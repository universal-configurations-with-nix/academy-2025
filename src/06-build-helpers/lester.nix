with import <nixpkgs> { };
buildNimPackage {
  name = "lester";
  version = "latest";

  src = fetchFromGitHub {
    owner = "madprops";
    repo = "lester";
    rev = "f6a0d93de2eaa1e5635a88419f7ef3dff9b0130b";
    hash = "sha256-DovdgWIW2ucpoNHGEsGEJcMnzhvwuApkPdKHTCUlGU4=";
  };

  lockFile = ./lester-lock.json;
}
