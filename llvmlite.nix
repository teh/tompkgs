{ pkgs, stdenv, pythonPackages, fetchurl, unzip, ...}:
pythonPackages.buildPythonPackage rec {
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
}
