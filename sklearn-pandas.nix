{ pkgs, stdenv, pythonPackages, fetchurl }:
  pythonPackages.buildPythonPackage rec {
    name = "sklearn-pandas-0.0.10";

    propagatedBuildInputs = with pythonPackages; [
        pythonPackages.pandas
        pythonPackages.scikitlearn
    ];

    src = fetchurl {
      url = "https://github.com/paulgb/sklearn-pandas/archive/0.0.10.zip";
      sha256 = "1hsk6llrb2fkx2fmqxr0rvlmw36mf960g5l4lzh1qmayjx0q254a";
    };

    meta = with stdenv.lib; {
      description = "sklearn-pandas";
      homepage = https://github.com/paulgb/sklearn-pandas/;
      license = licenses.bsd3;
    };
  }
