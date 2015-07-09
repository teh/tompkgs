{ pkgs, pythonPackages, fetchurl, cytoolz, toolz, unzip }:
let
  partd = pythonPackages.buildPythonPackage rec {
    name = "partd-0.3.0";

    propagatedBuildInputs = with pythonPackages; [ locket_0.2.0 ];

    src = fetchurl {
      url = "https://pypi.python.org/packages/source/p/partd/partd-0.3.0.tar.gz";
      md5 = "5812713026083aaa0150da5c21229c6a";
    };

    meta = with stdenv.lib; {
      description = "PartD";
      homepage = http://github.com/mrocklin/partd/;
      license = licenses.bsd2;
    };
  };
in
  pythonPackages.buildPythonPackage rec {
    name = "dask-HEAD";

    propagatedBuildInputs = with pythonPackages; [
        cytoolz
        toolz
        pythonPackages.numpy
        pythonPackages.pandas
        partd
    ];

    src = fetchurl {
      url = "https://github.com/ContinuumIO/dask/archive/75b3ddadd0d212701fc61dafc776d6879ef6256f.zip";
      sha256 = "0y183am356d0nlrxv89yhq7l8hisfq1n4qngccbqgcih9lfcq71y";
    };

    meta = with stdenv.lib; {
      description = "Dask";
      homepage = http://github.com/ContinuumIO/dask/;
      license = licenses.bsd;
    };
  }
