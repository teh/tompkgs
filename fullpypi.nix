{ pkgs, unzip, pythonPackages }:
let
version = "0.0.1";

in
pythonPackages.buildPythonPackage {
  name = "fullpypi-${version}";
  propagatedBuildInputs = with pythonPackages; [
    pandas
    flask
    requests
    unzip
    protobuf
    eventlet
    tables
  ];
  srcs = /home/tom/devel/fullpypi;
}
