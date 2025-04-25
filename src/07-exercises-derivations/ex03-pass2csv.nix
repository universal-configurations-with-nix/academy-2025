with import <nixpkgs> { };
python3Packages.buildPythonApplication rec {
  name = "pass2csv";
  version = "1.2.0";

  src = fetchFromGitea {
    domain = "codeberg.org";
    owner = "svartstare";
    repo = name;
    tag = "v${version}";
    hash = "sha256-AzhKSfuwIcw/iizizuemht46x8mKyBFYjfRv9Qczr6s=";
  };

  pyproject = true;

  dependencies = with python3Packages; [
    setuptools
    python-gnupg
  ];
}
