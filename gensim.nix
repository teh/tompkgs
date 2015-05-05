{ pythonPackages, stdenv, fetchurl }:

let
  bz2file = pythonPackages.buildPythonPackage rec {
    name = "bz2file-0.98";

    propagatedBuildInputs = with pythonPackages; [  ];

    src = fetchurl {
      url = "https://pypi.python.org/packages/source/b/bz2file/bz2file-0.98.tar.gz";
      md5 = "27d6f711ae0db6cfd1eb37f95621dfb5";
    };

    meta = with stdenv.lib; {
      description = "Bz2file is a Python library for reading and writing bzip2-compressed files.";
      homepage = https://github.com/nvawda/bz2file;
    };
  };

  smart_open = pythonPackages.buildPythonPackage rec {
    name = "smart_open-1.2.1";

    propagatedBuildInputs = with pythonPackages; [ boto bz2file ];
    doCheck = false;
    src = fetchurl {
      url = "https://pypi.python.org/packages/source/s/smart_open/smart_open-1.2.1.tar.gz";
      md5 = "34827a5211a777ce584d2fe73f5cb28d";
    };

    meta = with stdenv.lib; {
      description = "=============================================";
      homepage = https://github.com/piskvorky/smart_open;
      license = licenses.mit;
    };
  };
in
pythonPackages.buildPythonPackage rec {
  name = "gensim-0.11.1-1";

  propagatedBuildInputs = with pythonPackages; [ numpy scipy six smart_open cython ];

  src = fetchurl {
    url = "https://pypi.python.org/packages/source/g/gensim/gensim-0.11.1-1.tar.gz";
    md5 = "375c19503d92868b22b150062558cf31";
  };

  meta = with stdenv.lib; {
    description = "==============================================";
    homepage = http://radimrehurek.com/gensim;
  };
}
