{ pkgs, stdenv, pythonPackages, fetchurl,  ...}:

pythonPackages.buildPythonPackage rec {
    name = "Theano-0.7.1a1";

    propagatedBuildInputs = with pythonPackages; [ numpy scipy six ];

    src = fetchurl {
      url = "https://github.com/Theano/Theano/archive/rel-0.7.1a1.zip";
      sha256 = "13bqvdms427xblslx022wiw1k5an9skkwyallgnwwq60p4v9qvkc";
    };

    meta = with stdenv.lib; {
      description = "Theano is a Python library that allows you to define, optimize, and efficiently evaluate mathematical expressions involving multi-dimensional arrays. It is built on top of NumPy_. Theano features:";
      homepage = http://deeplearning.net/software/theano/;
      license = licenses.bsd3;
    };
  }
