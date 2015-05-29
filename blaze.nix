{ pkgs, pythonPackages, fetchurl, dynd_python, datashape, multipledispatch, cytoolz, toolz, unzip, odo, bcolz }:
let
version = "0.8.0";

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
    odo
  ];
  srcs = fetchurl {
    url = "https://github.com/ContinuumIO/blaze/archive/${version}.zip";
    sha256 = "0yjpnixg90lq6gxl45ygkc1nqsjlm4xprrsg3nq1s7fb6asansk0";
  };
}
