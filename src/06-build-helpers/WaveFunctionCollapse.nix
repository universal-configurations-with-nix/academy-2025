with import <nixpkgs> { };
buildDotnetModule {
  name = "WaveFunctionCollapse";
  version = "2024.12.14";

  src = fetchFromGitHub {
    owner = "mxgmn";
    repo = "WaveFunctionCollapse";
    rev = "a088882ea7261ca11f7e02b58b12a870d809e8a4";
    hash = "sha256-hk3iEHJFX66LtWzHZDXHc0QW5Sr8So1jrrmxVEJfKnw=";
  };

  nugetDeps = ./WaveFunctionCollapse-deps.json;
}
