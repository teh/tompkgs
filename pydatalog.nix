{ stdenv, pythonPackages, fetchhg, unzip }:

pythonPackages.buildPythonPackage rec {
  name = "pyDatalog-0.15.0c1";
  doCheck = false;
  propagatedBuildInputs = with pythonPackages; [ unzip sqlalchemy9 ];
  src = fetchhg {
    url = "https://bitbucket.org/pcarbonn/pydatalog";
    md5 = "a5b273793b0c00265abc3d007e7c654b";
  };
  meta = with stdenv.lib; {
    description = "Logic programming in Python";
    homepage = "https://sites.google.com/site/pydatalog/";
    license = licenses.lgpl2;
  };
}
