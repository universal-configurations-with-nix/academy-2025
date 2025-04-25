with import <nixpkgs> { };
buildNimPackage rec {
  name = "base45";
  version = "20230124";

  src = fetchFromSourcehut {
    owner = "~ehmry";
    repo = name;
    rev = version;
    hash = "sha256-9he+14yYVGt2s1IuRLPRsv23xnJzERkWRvIHr3PxFYk=";
  };
}
