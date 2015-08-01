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
    sha256 = "0cw453dsj8lx71zyg633sl4y3qnnfjpp3w9yh65ir36vq13kjqmy";
  };
}
