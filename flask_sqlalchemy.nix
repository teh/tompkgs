{ pythonPackages, fetchurl, stdenv }:

pythonPackages.buildPythonPackage {
  name = "Flask-SQLAlchemy-2.0";

  propagatedBuildInputs = with pythonPackages; [ flask sqlalchemy ];
  src = fetchurl {
    url = "https://pypi.python.org/packages/source/F/Flask-SQLAlchemy/Flask-SQLAlchemy-2.0.tar.gz";
    md5 = "06ae73194cca73b72e178f870d1dac7c";
  };
  meta = with stdenv.lib; {
    description = "Flask-SQLAlchemy";
    homepage = http://github.com/mitsuhiko/flask-sqlalchemy;
    license = licenses.bsd3;
  };
}
