with import <nixpkgs> {};
stdenv.mkDerivation {
  name = "hello";
  src = ../8/hello-2.10.tar.gz;
}