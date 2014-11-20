{ stdenv, pkgs, python, pythonPackages, cython, fetchurl, libdynd, unzip, cmake }:

stdenv.mkDerivation {
  name = "dynd-python-0.6.6";
  buildInputs = [
    python
    pythonPackages.numpy
    libdynd
    unzip
    cmake
    cython
  ];
  cmakeFlags = [
   "-DPYTHON_PACKAGE_INSTALL_PREFIX=lib/${python.libPrefix}/site-packages"
  ];
  srcs = fetchurl {
    url = "https://github.com/ContinuumIO/dynd-python/archive/v0.6.6.zip";
    sha256 = "04ghryyphrvfj4q7f4dq3iidsyszqklr997dw4np7rvhbiddsz27";
  };
}
