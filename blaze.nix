{ pkgs, pythonPackages, fetchurl, dynd_python, datashape, multipledispatch, cytoolz, toolz, unzip, odo, bcolz }:
let
version = "0.7.3";

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
    sha256 = "1di4kq3mp61akycjjfq5m38r991f2a50jap0hs9xslnjdgdwp9xk";
  };
}
