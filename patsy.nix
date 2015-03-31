{ pkgs, pythonPackages, fetchurl, unzip }:
let
version = "0.3.0";

in
pythonPackages.buildPythonPackage {
  name = "patsy-${version}";
  propagatedBuildInputs = with pythonPackages; [
    numpy
    unzip
    nose
  ];
  srcs = fetchurl {
    url = "https://pypi.python.org/packages/source/p/patsy/patsy-${version}.zip";
    sha256 = "1w0mrxf0cfp8a2mhh9q29jb101a5xcmk4c0zp049cjxg175d8pd5";
  };
}
