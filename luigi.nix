{ stdenv, pythonPackages, fetchurl }:
let
  lockfile-local = pythonPackages.buildPythonPackage rec {
    name = "lockfile-0.10.2";

    src = fetchurl {
      url = "https://pypi.python.org/packages/source/l/lockfile/lockfile-0.10.2.tar.gz";
      md5 = "1aa6175a6d57f082cd12e7ac6102ab15";
    };
    doCheck = false;

    propagatedBuildInputs = with pythonPackages; [ pbr ];

    meta = with stdenv.lib; {
      homepage = http://launchpad.net/pylockfile;
      license = licenses.mit;
    };
  };

  python-daemon = pythonPackages.buildPythonPackage rec {
    name = "python-daemon-2.0.6";

    src = fetchurl {
      url = "https://pypi.python.org/packages/source/p/python-daemon/python-daemon-2.0.6.tar.gz";
      md5 = "049508c47c8fa054e91ec9a3c572f939";
    };
    doCheck = false;

    propagatedBuildInputs = with pythonPackages; [ docutils lockfile-local ];

    meta = with stdenv.lib; {
      description = "This library implements the well-behaved daemon specification of";
      homepage = https://alioth.debian.org/projects/python-daemon/;
      license = licenses.asl2;
    };
  };

  cached-property = pythonPackages.buildPythonPackage rec {
    name = "cached-property-1.2.0";

    src = fetchurl {
      url = "https://pypi.python.org/packages/source/c/cached-property/cached-property-1.2.0.tar.gz";
      md5 = "0a5766b45fbf45416d9857f1c215f710";
    };

    propagatedBuildInputs = with pythonPackages; [  ];

    meta = with stdenv.lib; {
      homepage = https://github.com/pydanny/cached-property;
      license = licenses.bsd2;
    };
  };
in
pythonPackages.buildPythonPackage rec {
    name = "luigi-1.3.0";

    doCheck = false;
    src = fetchurl {
      url = "https://pypi.python.org/packages/source/l/luigi/${name}.tar.gz";
      md5 = "948a6574e4d4e1d1d8b8a355ca0cdaf7";
    };

    propagatedBuildInputs = with pythonPackages; [
        cached-property
        pyparsing
        tornado
        python-daemon
    ];

    meta = with stdenv.lib; {
      homepage = https://github.com/spotify/luigi;
      license = license.apl2;
    };
}
