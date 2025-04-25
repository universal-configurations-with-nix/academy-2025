with import <nixpkgs> { };
rustPlatform.buildRustPackage rec {
  name = "petname";
  version = "3.0.0-alpha.2";

  src = fetchCrate {
    pname = name;
    inherit version;
    hash = "sha256-6gJkaHAhau2HKKwVa/FL1mZfC9IJkyORm5P8MzLnQ5Q=";
  };

  cargoHash = "sha256-fWI5ZEDkdwCq9AvgCucoZgFvkWhR4kGKVVSbmiTmP04=";
}
