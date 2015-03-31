{ stdenv, pythonPackages, fetchurl }:
pythonPackages.buildPythonPackage rec {
  name = "pysistence-0.4.1";
  doCheck = false;
  src = fetchurl {
    url = "https://pypi.python.org/packages/source/p/pysistence/${name}.tar.gz";
    md5 = "05f276b263a483572180cbd3021bedd3";
  };
}
