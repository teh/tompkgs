{ stdenv, pythonPackages, fetchurl }:
let
  cssselect09 = pythonPackages.buildPythonPackage rec {
    name = "cssselect-0.9.1";

    propagatedBuildInputs = with pythonPackages; [ lxml ];

    src = fetchurl {
      url = "https://pypi.python.org/packages/source/c/cssselect/cssselect-0.9.1.tar.gz";
      md5 = "c74f45966277dc7a0f768b9b0f3522ac";
    };

    meta = with stdenv.lib; {
      description = "===================================";
      homepage = http://packages.python.org/cssselect/;
      license = licenses.bsd3;
    };
  };

  queuelib = pythonPackages.buildPythonPackage rec {
    name = "queuelib-1.2.2";

    propagatedBuildInputs = with pythonPackages; [  ];

    src = fetchurl {
      url = "https://pypi.python.org/packages/source/q/queuelib/queuelib-1.2.2.tar.gz";
      md5 = "90cd84e977896fa50cde6aa3df7fc45f";
    };

    meta = with stdenv.lib; {
      description = "========";
      homepage = https://github.com/scrapy/queuelib;
      license = licenses.bsd3;
    };
  };
  w3lib = pythonPackages.buildPythonPackage rec {
    name = "w3lib-1.11.0";

    propagatedBuildInputs = with pythonPackages; [ six ];

    src = fetchurl {
      url = "https://pypi.python.org/packages/source/w/w3lib/w3lib-1.11.0.tar.gz";
      md5 = "0ecadf121a90f1ac182b739a7d028ae2";
    };

    meta = with stdenv.lib; {
      description = "=====";
      homepage = https://github.com/scrapy/w3lib;
      license = licenses.bsd3;
    };
  };

in
pythonPackages.buildPythonPackage rec {
    name = "Scrapy-1.0.1";
    propagatedBuildInputs = with pythonPackages; [
      lxml ipaddress pyopenssl cryptography pycparser six
      twisted queuelib cssselect09 w3lib
    ];
    src = fetchurl {
      url = "https://pypi.python.org/packages/source/S/Scrapy/Scrapy-1.0.1.tar.gz";
      md5 = "1e402933ead46f002bdd11b8d8cf52b7";
    };
    meta = with stdenv.lib; {
      description = "======";
      homepage = http://scrapy.org;
      license = licenses.bsd;
    };
  }
