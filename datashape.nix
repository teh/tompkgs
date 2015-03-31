{ pythonPackages, fetchurl, unzip, multipledispatch }:

pythonPackages.buildPythonPackage {
  name = "datashape-0.4.4";
  buildInputs = [
    pythonPackages.numpy
    pythonPackages.dateutil
    multipledispatch
    unzip
  ];
  srcs = fetchurl {
    url = "https://github.com/ContinuumIO/datashape/archive/0.4.4.zip";
    sha256 = "088bjkw9iavaayzbjwvn5ab1454cqmvi78k97flsgv78lnzhg8ff";
  };
}
