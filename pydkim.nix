{ stdenv, pythonPackages, fetchurl }:

pythonPackages.buildPythonPackage rec {
  name = "pydkim-0.5.4";
  doCheck = false;
  propagatedBuildInputs = with pythonPackages; [ ];
  src = fetchurl {
    url = "https://launchpad.net/dkimpy/trunk/0.5.4/+download/dkimpy-0.5.4.tar.gz";
    md5 = "75f461f48369621c70bcceb6976c6a0b";
  };
  meta = with stdenv.lib; {
    license = licenses.mit;
  };
}
