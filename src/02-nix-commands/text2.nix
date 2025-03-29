with import <nixpkgs> { };
writeTextFile {
  name = "something.txt";
  text = ''
    First line
      second line
    third line
  '';
}
