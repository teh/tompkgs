{ pkgs, pythonPackages, fetchurl, datashape, multipledispatch, cytoolz, toolz, unzip }:
let

  networkx = pythonPackages.buildPythonPackage rec {
    name = "networkx-1.9.1";

    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/source/n/networkx/networkx-1.9.1.tar.gz";
      sha256 = "6380eb38d0b5770d7e50813c8a48ff7c373b2187b4220339c1adce803df01c59";
    };

    buildInputs = with pythonPackages; [ nose decorator ];

    meta = {
      homepage = "https://networkx.github.io/";
      description = "Library for the creation, manipulation, and study of the structure, dynamics, and functions of complex networks.";
    };
  };


in
pythonPackages.buildPythonPackage rec {
  version = "0.3.2";
  name = "odo-${version}";
  propagatedBuildInputs = with pythonPackages; [
    numpy
    pandas
    datashape
    multipledispatch
    networkx
    cytoolz
    unzip
    toolz
    decorator
  ];
  srcs = fetchurl {
    url = "https://github.com/ContinuumIO/odo/archive/${version}.zip";
#    url = "https://github.com/ContinuumIO/odo/archive/aa51499e522f128fd5c09f0d752e2b8a2229b521.zip";
    sha256 = "0xk5bngnyf3hnhx5ng1ymhilqybi0wksn119scdlb1l1giyh6byz";
  };
}
