{ pkgs, stdenv, pythonPackages, fetchurl, ...}:
pythonPackages.buildPythonPackage rec {
    name = "yapf-0.2.1";
    src = fetchurl {
      url = "https://pypi.python.org/packages/source/y/yapf/yapf-0.2.1.tar.gz";
      md5 = "46787aa5173fbe651fb6f4ef2a94035a";
    };
  }
