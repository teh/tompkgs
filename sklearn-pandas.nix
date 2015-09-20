{ pkgs, stdenv, pythonPackages, fetchurl }:
  pythonPackages.buildPythonPackage rec {
    name = "sklearn-pandas-0.0.10";

    propagatedBuildInputs = with pythonPackages; [
        pythonPackages.pandas
        pythonPackages.scikitlearn
    ];

    doCheck = false;
    src = fetchurl {
      url = "https://github.com/paulgb/sklearn-pandas/archive/38acedc3f078bfb023763024f66df60ea8232d13.zip";
      sha256 = "1gsrj24fal0789wrgsa82fw2yxjz0am4sqmxdbylwvmvafn7qacx";
    };

    meta = with stdenv.lib; {
      description = "sklearn-pandas";
      homepage = https://github.com/paulgb/sklearn-pandas/;
      license = licenses.bsd3;
    };
  }
