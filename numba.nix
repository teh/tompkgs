{ pkgs, stdenv, pythonPackages, fetchurl, ...}:
let
  llvmlite = pythonPackages.buildPythonPackage rec {
    version = "0.4.0";
    name = "llvmlite-${version}";

    doCheck = false;
    buildInputs = [ pkgs.cmake pkgs.llvm_35 pkgs.python pkgs.libffi ];
    propagatedBuildInputs = with pythonPackages; [ enum34 ];

    src = fetchurl {
      url = "https://pypi.python.org/packages/source/l/llvmlite/llvmlite-${version}.tar.gz";
      md5 = "7d2b6e9edfe16df476385e3492eeac39";
    };
    # TODO header is in the wrong place??
    NIX_CFLAGS_COMPILE = "-D_WIN32";
    meta = with stdenv.lib; {
      description = "# llvmlite";
      homepage = https://github.com/numba/llvmlite;
      license = licenses.bsd;
    };
  };
  funcsigs = pythonPackages.buildPythonPackage rec {
    name = "funcsigs-0.4";

    propagatedBuildInputs = with pythonPackages; [  ];
    doCheck = false;

    src = fetchurl {
      url = "https://pypi.python.org/packages/source/f/funcsigs/funcsigs-0.4.tar.gz";
      md5 = "fb1d031f284233e09701f6db1281c2a5";
    };

    meta = with stdenv.lib; {
      description = "funcsigs";
      homepage = http://funcsigs.readthedocs.org;
    };
  };
in
  pythonPackages.buildPythonPackage rec {
    version = "0.18.2";
    name = "numba-${version}";

    propagatedBuildInputs = with pythonPackages; [ funcsigs llvmlite pythonPackages.numpy ];
    doCheck = false;

    src = fetchurl {
      url = "https://pypi.python.org/packages/source/n/numba/numba-${version}.tar.gz";
      md5 = "7b255ec34dde793a865d18ae11c4480e";
    };

    meta = with stdenv.lib; {
      description = "=====";
      homepage = http://numba.github.com;
      license = licenses.bsd2;
    };
  }
