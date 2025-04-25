with import <nixpkgs> { };
python3Packages.buildPythonApplication rec {
  name = "nml";
  version = "0.7.6";

  src = fetchFromGitHub {
    owner = "OpenTTD";
    repo = "nml";
    tag = version;
    hash = "sha256-jAvzfmv8iLs4jb/rzRswiAPHZpx20hjfbG/NY4HGcF0=";
  };

  pyproject = true;

  dependencies = with python3Packages; [
    setuptools
    ply
    pillow
  ];
}
