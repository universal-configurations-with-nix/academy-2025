{
  buildGoModule,
  fetchFromGitHub,
}:
buildGoModule rec {
  name = "ts";
  version = "0.0.7";

  src = fetchFromGitHub {
    owner = "liujianping";
    repo = "ts";
    rev = "refs/tags/v${version}";
    hash = "sha256-G2hKYWa+zPgGQTXzwXG+89dGsGSkYgNEUtZhsV0IFsE=";
  };

  postPatch = ''
    sed -i '/github.com\/x-mod\/errors/s/5/6/' ./vendor/modules.txt
  '';

  vendorHash = null;

  doCheck = false;
}
