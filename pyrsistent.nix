{ pkgs, stdenv, pythonPackages, fetchurl, ...}:

pythonPackages.buildPythonPackage rec {
    name = "pyrsistent-0.11.0";

    propagatedBuildInputs = with pythonPackages; [ six ];

    src = fetchurl {
      url = "https://pypi.python.org/packages/source/p/pyrsistent/pyrsistent-0.11.0.tar.gz";
      md5 = "91f76b0694eba6b241d06c17ce779196";
    };
    doCheck = false;

    meta = with stdenv.lib; {
      description = "Introduction";
      homepage = http://github.com/tobgu/pyrsistent/;
      license = lincenses.mit;
    };
 }
