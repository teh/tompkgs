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
    version = "v0.9.0";
    name = "bcolz-${version}";

    propagatedBuildInputs = [ cython pythonPackages.numpy ];

    src = fetchurl {
      url = "https://github.com/Blosc/bcolz/archive/${version}.zip";
      sha256 = "0dnxz3nx79c2dapdyi9908iwb2i7z9kblssmwm1ax318vxmz5vrx";
    };

    meta = with stdenv.lib; {
      description = "bcolz provides columnar and compressed data containers.  Column";
      homepage = https://github.com/Blosc/bcolz;
    };
  }
