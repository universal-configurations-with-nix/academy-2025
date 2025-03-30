with import <nixpkgs> { };
with python3Packages;
buildPythonApplication rec {
  name = "english_text_normalization";
  version = "0.0.3";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "jasminsternkopf";
    repo = "english_text_normalization";
    rev = "refs/tags/v${version}";
    hash = "sha256-cAVkfCzolPoTkCu5HYLeV9O6gRPHAF+9LgpJE0PXxfc=";
  };

  dependencies = [
    setuptools
    pyenchant
    nltk
    inflect
    unidecode
  ];
}
