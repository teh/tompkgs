{ stdenv, pythonPackages, fetchurl }:
let
  ad3 = pythonPackages.buildPythonPackage rec {
    name = "ad3-2.0.2";

    propagatedBuildInputs = with pythonPackages; [  ];

    src = fetchurl {
      url = "https://pypi.python.org/packages/source/a/ad3/ad3-2.0.2.tar.gz";
      md5 = "1511c787a549144929d5bc4959f4a8ba";
    };

    meta = with stdenv.lib; {
      description = "AD3 (approximate MAP decoder with Alternating Direction Dual Decomposition)";
      homepage = http://www.ark.cs.cmu.edu/AD3;
    };
  };
in
pythonPackages.buildPythonPackage rec {
    name = "pystruct-0.2.3";

    propagatedBuildInputs = with pythonPackages; [ numpy ad3 ];

    src = fetchurl {
      url = "https://pypi.python.org/packages/source/p/pystruct/pystruct-0.2.3.tar.gz";
      md5 = "8c9ae39b0d0224059ecc5c6e15a235ab";
    };

    meta = with stdenv.lib; {
      description = "[![Build Status](https://travis-ci.org/pystruct/pystruct.png)](https://travis-ci.org/pystruct/pystruct)";
      homepage = http://pystruct.github.io;
    };
  }
