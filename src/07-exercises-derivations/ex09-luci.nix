# Този пакет е доста голям, build фазата отне 5 минути на по-силна машина
with import <nixpkgs> { };
buildGoModule rec {
  name = "luci";
  version = "latest";

  src = fetchFromGitiles {
    url = "https://chromium.googlesource.com/infra/luci/luci-go";
    rev = "be505fc7e2fd9fdf257c2e5217d9017eaa49c69e";
    hash = "sha256-rrwpJc3ejEcL7XpWgj12/uPWr/qfKEZzoHdPV42fIXY=";
  };

  vendorHash = "sha256-vYRRMVAEbZeO1ENHENvxTZm1AgXZcO3kN1YT5xtlcN0=";

  doCheck = false;
}
