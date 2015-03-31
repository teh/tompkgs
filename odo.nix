{ pkgs, pythonPackages, fetchurl, datashape, multipledispatch, cytoolz, toolz, unzip }:
let
version = "0.3.1";

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
pythonPackages.buildPythonPackage {
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
    sha256 = "0yddnmv3wh7pi586dx4fkgqqlmzaqsjszb5wnfnilap82s5s0c1w";
  };
}
