{ stdenv, pythonPackages, fetchurl, unzip, lz4, mongodb, procps }:
let
  mockextras = pythonPackages.buildPythonPackage rec {
    name = "mockextras-1.0.0";

    src = fetchurl {
      url = "https://pypi.python.org/packages/source/m/mockextras/mockextras-1.0.0.zip";
      md5 = "61051f165cb7488dc3a597109123806d";
    };

    propagatedBuildInputs = with pythonPackages; [ mock funcsigs ];

    meta = with stdenv.lib; {
      description = "The mockextras library is designed to be used with the mock library by Michael Foord ";
      homepage = https://github.com/ahlmss/mockextras;
      license = licenses.bsd3;
    };
  };
  setuptools_cython = pythonPackages.buildPythonPackage rec {
    name = "setuptools_cython-0.2.1";

    src = fetchurl {
      url = "https://pypi.python.org/packages/source/s/setuptools_cython/setuptools_cython-0.2.1.tar.gz";
      md5 = "c29fc5bf2894e69cbd98e3800cef4707";
    };

    propagatedBuildInputs = with pythonPackages; [ cython ];

    meta = with stdenv.lib; {
      description = "Allows compiling Cython extensions in setuptools";
      homepage = http://pypi.python.org/pypi/setuptools_cython/;
    };
  };
  python-lz4 = pythonPackages.buildPythonPackage rec {
    name = "lz4-0.7.0";

    src = fetchurl {
      url = "https://pypi.python.org/packages/source/l/lz4/lz4-0.7.0.tar.gz";
      md5 = "e32842a49d5254f6918567197a704492";
    };

    propagatedBuildInputs = [ lz4 pythonPackages.nose ];

    meta = with stdenv.lib; {
      description = "==========";
      homepage = https://github.com/steeve/python-lz4;
    };
  };
  pytest-timeout = pythonPackages.buildPythonPackage rec {
    name = "pytest-timeout-0.5";

    src = fetchurl {
      url = "https://pypi.python.org/packages/source/p/pytest-timeout/pytest-timeout-0.5.tar.gz";
      md5 = "0c44e5e03b15131498a86169000cb050";
    };

    propagatedBuildInputs = with pythonPackages; [ pytest ];

    meta = with stdenv.lib; {
      description = "==============";
      homepage = http://bitbucket.org/pytest-dev/pytest-timeout/;
      license = licenses.mit;
    };
  };
  port-for = pythonPackages.buildPythonPackage rec {
    name = "port-for-0.3.1";

    src = fetchurl {
      url = "https://pypi.python.org/packages/source/p/port-for/port-for-0.3.1.tar.gz";
      md5 = "e6f4c466ce82fc9e9e0cb8ddee26a4c7";
    };

    propagatedBuildInputs = with pythonPackages; [  ];

    meta = with stdenv.lib; {
      description = "========";
      homepage = https://github.com/kmike/port-for/;
    };
  };
  pep257 = pythonPackages.buildPythonPackage rec {
    name = "pep257-0.6.0";

    src = fetchurl {
      url = "https://pypi.python.org/packages/source/p/pep257/pep257-0.6.0.tar.gz";
      md5 = "2152a2d3cd94af4a57e50e9b790700a0";
    };

    propagatedBuildInputs = with pythonPackages; [  ];

    meta = with stdenv.lib; {
      description = "PEP 257 docstring style checker";
      homepage = https://github.com/GreenSteam/pep257/;
      license = licenses.mit;
    };
  };
  mccabe = pythonPackages.buildPythonPackage rec {
    name = "mccabe-0.3.1";

    src = fetchurl {
      url = "https://pypi.python.org/packages/source/m/mccabe/mccabe-0.3.1.tar.gz";
      md5 = "9a1570c470ff5db678cc0c03d5c0c237";
    };

    propagatedBuildInputs = with pythonPackages; [  ];

    meta = with stdenv.lib; {
      description = "McCabe complexity checker";
      homepage = https://github.com/flintwork/mccabe;
    };
  };
  pylama = pythonPackages.buildPythonPackage rec {
    name = "pylama-7.0.6";

    src = fetchurl {
      url = "https://pypi.python.org/packages/source/p/pylama/pylama-7.0.6.tar.gz";
      md5 = "9c60af6db1a91be3ad41d11876b38947";
    };

    propagatedBuildInputs = with pythonPackages; [ pyflakes pep257 pep8 mccabe ];

    meta = with stdenv.lib; {
      description = "|logo| Pylama";
      homepage = http://github.com/klen/pylama;
    };
  };
  lockfile = pythonPackages.buildPythonPackage rec {
    name = "lockfile-0.10.2";

    src = fetchurl {
      url = "https://pypi.python.org/packages/source/l/lockfile/lockfile-0.10.2.tar.gz";
      md5 = "1aa6175a6d57f082cd12e7ac6102ab15";
    };
    doCheck = false;

    propagatedBuildInputs = with pythonPackages; [ pbr ];

    meta = with stdenv.lib; {
      description = "The lockfile package exports a LockFile class which provides a simple API for";
      homepage = http://launchpad.net/pylockfile;
    };
  };
  python-daemon = pythonPackages.buildPythonPackage rec {
    name = "python-daemon-2.0.6";

    src = fetchurl {
      url = "https://pypi.python.org/packages/source/p/python-daemon/python-daemon-2.0.6.tar.gz";
      md5 = "049508c47c8fa054e91ec9a3c572f939";
    };
    buildInputs = with pythonPackages; [ mock testscenarios unittest2 funcsigs ];
    propagatedBuildInputs = with pythonPackages; [ lockfile docutils ];

    meta = with stdenv.lib; {
      description = "This library implements the well-behaved daemon specification of";
      homepage = https://alioth.debian.org/projects/python-daemon/;
    };
  };
  mirakuru = pythonPackages.buildPythonPackage rec {
    name = "mirakuru-0.6.0";

    src = fetchurl {
      url = "https://pypi.python.org/packages/source/m/mirakuru/mirakuru-0.6.0.tar.gz";
      md5 = "e7e62a2f98c207b22d7d419da93a0285";
    };
    doCheck = false;

    propagatedBuildInputs = with pythonPackages; [ pylama python-daemon pytestcov pytest covCore ];

    meta = with stdenv.lib; {
      description = "mirakuru";
      homepage = https://github.com/ClearcodeHQ/mirakuru;
    };
  };
  pymlconf = pythonPackages.buildPythonPackage rec {
    name = "pymlconf-0.6.0";

    src = fetchurl {
      url = "mirror://pypi/p/pymlconf/${name}.tar.gz";
      sha256 = "09xi0cxl7v3z1y0z88j07s6srnd362p7rl14blsrkc6ia9d2igkc";
    };
    doCheck = false;
    propagatedBuildInputs = with pythonPackages; [ pyyaml ];

    meta = with stdenv.lib; {
      description = "pymlconf";
      homepage = http://github.com/pylover/pymlconf;
    };
  };
  pytest-dbfixtures = pythonPackages.buildPythonPackage rec {
    name = "pytest-dbfixtures-0.12.0";

    src = fetchurl {
      url = "https://pypi.python.org/packages/source/p/pytest-dbfixtures/pytest-dbfixtures-0.12.0.tar.gz";
      md5 = "ab2e06cb8fe70ed53733eb78d6cf88ec";
    };

    propagatedBuildInputs = with pythonPackages; [ pytest port-for pathpy pymlconf mirakuru pyaml ];

    meta = with stdenv.lib; {
      description = "pytest-dbfixtures";
      homepage = https://github.com/ClearcodeHQ/pytest-dbfixtures;
    };
  };
in
pythonPackages.buildPythonPackage rec {
    version = "v1.32.0";
    name = "arctic-${version}";
    src = fetchurl {
      url = "https://github.com/manahl/arctic/archive/${version}.zip";
      sha256 = "1iy931bbicb795znvnlrbvspqs8vbkvr855p7mxa2bmcrv0v5wxb";
    };
    buildInputs = with pythonPackages; [
        pytest_xdist
        pytest-timeout
        pytest-dbfixtures
        pythonPackages.mock
        mongodb
        procps
        pytestcov
        pytest
        setuptools_cython
        cython
        unzip
    ];
    propagatedBuildInputs = with pythonPackages; [
        mockextras
        pandas
        pymongo
        tzlocal
        python-lz4
        enum34
        decorator
        dateutil
  ];

   doCheck = false; # mockextras is broken
    # Need to remove build directory otherwise py.test tries to import
    # two different test configs:
    preCheck = ''
        rm -rf ./build

        # Failing due to dateutil parser error:
        rm tests/unit/test_multi_index.py
        rm tests/integration/store/test_bitemporal_store.py
    '';
    meta = with stdenv.lib; {
      homepage = https://github.com/manahl/arctic;
      license = license.lgpl;
    };
}
