{ pythonPackages, fetchurl, unzip, multipledispatch }:

pythonPackages.buildPythonPackage rec {
  version = "0.4.5";
  name = "datashape-${version}";
  buildInputs = [
    pythonPackages.numpy
    pythonPackages.dateutil
    multipledispatch
    unzip
  ];
  srcs = fetchurl {
    url = "https://github.com/ContinuumIO/datashape/archive/${version}.zip";
    sha256 = "17irppylbin0z954padg6zzlj97rk7vd6n87z01xdlwfvys3ybzr";
  };
}
