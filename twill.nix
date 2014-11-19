{ stdenv, pythonPackages, fetchurl }:
pythonPackages.buildPythonPackage rec {
  name = "twill-1.8.0";
  doCheck = false;
  propagatedBuildInputs = with pythonPackages; [ nose lxml ];
  src = fetchurl {
    url = "https://pypi.python.org/packages/source/t/twill/twill-1.8.0.tar.gz";
    md5 = "6483afda035e221291e95ca9188e51ce";
  };
  meta = with stdenv.lib; {
    description = "A scripting system for automating Web browsing.  Useful for testing";
    homepage = http://twill.idyll.org/;
    license = licenses.mit;
  };
}
