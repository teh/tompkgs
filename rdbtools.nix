{ pythonPackages, fetchurl, stdenv }:

pythonPackages.buildPythonPackage rec {
    name = "rdbtools-0.1.6";

    propagatedBuildInputs = with pythonPackages; [  ];

    doCheck = false;
    
    src = fetchurl {
      url = "https://pypi.python.org/packages/source/r/rdbtools/rdbtools-0.1.6.tar.gz";
      md5 = "3be556b09b4fbb6575975db47ac39ef7";
    };

    meta = with stdenv.lib; {
      description = "Parse Redis dump.rdb files, Analyze Memory, and Export Data to JSON";
      homepage = https://github.com/sripathikrishnan/redis-rdb-tools;
      license = licenses.mit;
    };
}
