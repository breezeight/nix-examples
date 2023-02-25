let 
    pkgs = import <nixpkgs> { };
 
    src = pkgs.fetchurl {
        url = "https://github.com/stedolan/jq/releases/download/jq-1.6/jq-1.6.zip";
        sha256 = "4z+SGc2MOFG0ESFdusUdf8ykorFXlkv8+lah1xji3hQ=";
    };

    slow = pkgs.runCommand "slow" {} ''
        sleep 10
        touch $out
    '';
in 
    pkgs.runCommand "build-with-dependencies" {} ''
        mkdir $out
        cp ${./talk.md} $out/
        cp ${src} $out/source
        cp ${slow} $out/slow
    ''
