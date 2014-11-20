{ pkgs, pythonPackages, fetchurl, dynd_python, datashape, multipledispatch, cytoolz, toolz, unzip }:

pythonPackages.buildPythonPackage {
  name = "blaze-0.6.6";
  buildInputs = with pythonPackages; [
    numpy
    sqlalchemy
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
    url = "https://github.com/ContinuumIO/blaze/archive/0.6.6.zip";
    sha256 = "0ds0164fp4104n1i0z331x0c5c9y80g85456nnywzhnsmiv1d784";
  };
}
