{ pkgs, stdenv, pythonPackages, fetchurl,  ...}:

pythonPackages.buildPythonPackage rec {
    name = "Theano-0.7.0";

    propagatedBuildInputs = with pythonPackages; [ numpy scipy ];

    src = fetchurl {
      url = "https://pypi.python.org/packages/source/T/Theano/Theano-0.7.0.tar.gz";
      md5 = "099a9575801b71252b5bbbc3c34ed45a";
    };

    meta = with stdenv.lib; {
      description = "Theano is a Python library that allows you to define, optimize, and efficiently evaluate mathematical expressions involving multi-dimensional arrays. It is built on top of NumPy_. Theano features:";
      homepage = http://deeplearning.net/software/theano/;
      license = licenses.bsd3;
    };
  }
