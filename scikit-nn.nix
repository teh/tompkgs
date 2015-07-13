{ pkgs, stdenv, pythonPackages, fetchurl, unzip,  pylearn2, ...}:

pythonPackages.buildPythonPackage rec {
    name = "scikit-nn-HEAD";

    propagatedBuildInputs = with pythonPackages; [ numpy scipy unzip pylearn2 scikitlearn ];

    src = fetchurl {
      url = "https://github.com/aigamedev/scikit-neuralnetwork/archive/18525ef27cfe3765fa05be6f030074e40e2b6cbd.zip";
      sha256 = "0ks4jll0lix9jn2mi4q6kdfwrbbqr4zdpf7sglk4kg3dvyav2bkc";
    };
  }
