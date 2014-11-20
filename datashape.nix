{ pythonPackages, fetchurl, unzip, multipledispatch }:

pythonPackages.buildPythonPackage {
  name = "datashape-0.4.1";
  buildInputs = [
    pythonPackages.numpy
    pythonPackages.dateutil
    multipledispatch
    unzip
  ];
  srcs = fetchurl {
    url = "https://github.com/ContinuumIO/datashape/archive/0.4.1.zip";
    sha256 = "122jydzzav4i4a88k9v4xw96k7vwn3lcbcjk99ryz3rr63p31iaf";
  };
}
