{ pkgs, pythonPackages, fetchgit, unzip, glib, openblas, gsl, gnumake, pkgconfig, gcc }:
let
version = "0.6.0";

in
pythonPackages.buildPythonPackage {
  name = "fastfm-master";
  buildInputs = [
    pkgconfig
    pythonPackages.cython
    unzip
  ];
  propagatedBuildInputs = with pythonPackages; [
    numpy
    scikitlearn
    scipy
    pandas
    glib
    openblas
    gsl
    gnumake
  ];
  buildPhase = ''
  make CC="gcc --std=c99"
  '';
  srcs = fetchgit {
    url = "https://github.com/ibayer/fastFM/";
    rev = "d9dd2e69a59709f48c7310c758b146beffb9e665";
    sha256 = "0vacz379g588lb0fkn5xaflv8bbzgddjpm2rbbcb8ci2bz0zh2j5";
  };
}
