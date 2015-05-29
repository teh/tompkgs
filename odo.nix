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
#    url = "https://github.com/ContinuumIO/odo/archive/${version}.zip";
    url = "https://github.com/ContinuumIO/odo/archive/2f05cf90d1fcc5d95eaa55682f08b9d1b06f87bb.zip";
    sha256 = "00rpl1p78xrrrn4awx2h5n2g3z7rl7c78b272vcb1xzj5gw2lld7";
  };
}
