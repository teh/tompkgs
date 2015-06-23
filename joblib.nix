{ pkgs, stdenv, pythonPackages, fetchurl, ...}:

  pythonPackages.buildPythonPackage rec {
    name = "joblib-0.8.4";

    propagatedBuildInputs = with pythonPackages; [  ];

    src = fetchurl {
      url = "https://pypi.python.org/packages/source/j/joblib/joblib-0.8.4.tar.gz";
      md5 = "90a1c25cc4dc4a8e3536093dbc35cff3";
    };

    meta = with stdenv.lib; {
      description = "Joblib is a set of tools to provide **lightweight pipelining in";
      homepage = http://packages.python.org/joblib/;
      license = licenses.bsd3;
    };
  }
