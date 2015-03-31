{ pkgs, stdenv, pythonPackages, fetchurl, ...}:
let
  cython = pythonPackages.buildPythonPackage rec {
    name = "Cython-0.22";

    src = pkgs.fetchurl {
      url = "http://www.cython.org/release/${name}.tar.gz";
      sha256 = "05a0hkjyadx8dg9i1yqd9lz0xk2igspldm140070v6mgd5x7wc0l";
    };

    setupPyBuildFlags = ["--build-base=$out"];

    buildInputs =[ pkgs.pkgconfig ];

    meta = {
      description = "An interpreter to help writing C extensions for Python 2";
      platforms = stdenv.lib.platforms.all;
    };
  };
in
pythonPackages.buildPythonPackage rec {
    name = "bcolz-0.8.1";

    propagatedBuildInputs = [ cython pythonPackages.numpy ];

    src = fetchurl {
      url = "https://pypi.python.org/packages/source/b/bcolz/bcolz-0.8.1.tar.gz";
      md5 = "763d762644f96f79c7822897c4371c13";
    };

    meta = with stdenv.lib; {
      description = "bcolz provides columnar and compressed data containers.  Column";
      homepage = https://github.com/Blosc/bcolz;
    };
  }
