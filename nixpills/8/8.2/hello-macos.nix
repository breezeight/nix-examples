with (import <nixpkgs> {});
derivation {
  name = "hello";
  builder = "${bash}/bin/bash";
  args = [ ./hello_builder.sh ];
  inherit gnutar gzip gnumake coreutils gawk gnused gnugrep;
  gcc = clang;
  binutils = clang.bintools.bintools_bin;
  src = ../hello-2.10.tar.gz;
  system = builtins.currentSystem;
}
