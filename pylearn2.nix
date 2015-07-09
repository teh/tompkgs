{ pkgs, stdenv, pythonPackages, fetchurl, unzip,  theano, ...}:

pythonPackages.buildPythonPackage rec {
    name = "pylearn2-HEAD";

    propagatedBuildInputs = with pythonPackages; [ numpy scipy unzip theano argparse pyyaml cython ];

    preBuild = ''
    export HOME=/tmp/theanocompiledir
    substituteInPlace setup.py --replace 'mode = input("Installation mode: [develop]/install/cancel: ")' "mode = 'install'"
    '';

    src = fetchurl {
      url = "https://github.com/lisa-lab/pylearn2/archive/5a21a960e015bb12e931472d70d4918d85fadcf9.zip";
      sha256 = "0kfjaa1wqdfswibymvcb3qi2b544ds07sa10my4m9pvdhbmii3s7";
    };
  }
