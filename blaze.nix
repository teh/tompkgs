{ pkgs, pythonPackages, fetchurl, dynd_python, datashape, multipledispatch, cytoolz, toolz, unzip }:
let
version = "0.6.7";

in
pythonPackages.buildPythonPackage {
  name = "blaze-${version}";
  propagatedBuildInputs = with pythonPackages; [
    numpy
    sqlalchemy9
    pandas
    flask
    pytest
    requests
    psutil
    h5py
    xlrd
    tables
    unzip
    dynd_python
    datashape
    multipledispatch
    cytoolz
    toolz
  ];
  srcs = fetchurl {
    url = "https://github.com/ContinuumIO/blaze/archive/${version}.zip";
    sha256 = "1f68xg2djrkrjghpn9hyli2h19xv3mj7z5r66778yj5w9v10jkli";
  };
}
