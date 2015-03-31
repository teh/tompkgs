{ pkgs, pythonPackages, fetchurl, unzip, patsy }:
let
version = "0.6.0";

in
pythonPackages.buildPythonPackage {
  name = "statsmodels-${version}";
  propagatedBuildInputs = with pythonPackages; [
    numpy
    pandas
    unzip
    scipy
    cython
    patsy
  ];
  srcs = fetchurl {
    url = "https://github.com/statsmodels/statsmodels/archive/v${version}.zip";
    sha256 = "05la46ydnw2hladzmb68jihhs3hphxh3wvsm9d06glc8azb9jzrr";
  };
}
