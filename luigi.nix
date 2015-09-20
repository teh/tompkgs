{ stdenv, pythonPackages, fetchurl }:
let
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

    propagatedBuildInputs = with pythonPackages; [ cached-property pyparsing tornado ];

    meta = with stdenv.lib; {
      homepage = https://github.com/spotify/luigi;
      license = license.apl2;
    };
}
