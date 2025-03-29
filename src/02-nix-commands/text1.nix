with import <nixpkgs> { };
writeTextFile {
  name = "something.txt";
  text = "Hello!";
}
