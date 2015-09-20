{ stdenv, pythonPackages, fetchurl }:
let
  w3lib = pythonPackages.buildPythonPackage rec {
    name = "w3lib-1.12.0";

    propagatedBuildInputs = with pythonPackages; [ six ];

    src = fetchurl {
      url = "https://pypi.python.org/packages/source/w/w3lib/w3lib-1.12.0.tar.gz";
      md5 = "c2545617229b3fc72d59afed85b18035";
    };

    meta = with stdenv.lib; {
      description = "=====";
      homepage = https://github.com/scrapy/w3lib;
      license = licenses.bsd;
    };
  };
in
pythonPackages.buildPythonPackage rec {
    version = "v0.12.0";
    name = "scrapely-${version}";
    propagatedBuildInputs = with pythonPackages; [
      numpy w3lib
    ];
    src = fetchurl {
      url = "https://github.com/scrapy/scrapely/archive/${version}.zip";
      sha256 = "0cdy3sa4cq29vsiy4xhnr5hqs4nsfkb34nckp2cj1ywrxp70gah5";
    };
    meta = with stdenv.lib; {
      description = "======";
      homepage = http://scrapy.org;
      license = licenses.bsd;
    };
  }
