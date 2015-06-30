{ pkgs, stdenv, pythonPackages, fetchurl, unzip, ...}:
let
  llvmlite = pythonPackages.buildPythonPackage rec {
    version = "0.5.1";
    name = "llvmlite-${version}";

    doCheck = false;
    buildInputs = [ pkgs.cmake pkgs.llvm_35 pkgs.python pkgs.libffi unzip ];
    propagatedBuildInputs = with pythonPackages; [ enum34 ];

    patches = [ ./correct-import.patch ];

    src = fetchurl {
      url = "https://github.com/numba/llvmlite/archive/v${version}.zip";
      sha256 = "0g6jsc46wi3s2lf378rxkr6r89hpchzr0mj985k478931648d71g";
    };
    meta = with stdenv.lib; {
      description = "# llvmlite";
      homepage = https://github.com/numba/llvmlite;
      license = licenses.bsd3;
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
