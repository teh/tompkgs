{ pythonPackages, fetchurl, stdenv }:
let
  nosexcover = pythonPackages.buildPythonPackage rec {
    name = "nosexcover-1.0.10";

    propagatedBuildInputs = with pythonPackages; [ nose coverage ];

    src = fetchurl {
      url = "https://pypi.python.org/packages/source/n/nosexcover/nosexcover-1.0.10.tar.gz";
      md5 = "12bf494a801b376debeb6a167c247391";
    };

    meta = with stdenv.lib; {
      description = "nose-xmlcover";
      homepage = http://github.com/cmheisel/nose-xcover/;
      license = licenses.bsd3;
    };
  };
in

pythonPackages.buildPythonPackage rec {
    name = "protobuf-to-dict-0.1.0";

    propagatedBuildInputs = with pythonPackages; [ protobuf nosexcover ];

    doCheck = false;
    src = fetchurl {
      url = "https://pypi.python.org/packages/source/p/protobuf-to-dict/protobuf-to-dict-0.1.0.tar.gz";
      md5 = "ae9fc7871b584475badc9ca6c70ab3d0";
    };

    meta = with stdenv.lib; {
      description = "UNKNOWN";
      homepage = https://github.com/benhodgson/protobuf-to-dict;
      license = "public domain";
    };
  }
