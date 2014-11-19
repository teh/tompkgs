{ stdenv, pythonPackages, fetchurl, wtforms }:
pythonPackages.buildPythonPackage rec {
  name = "Flask-WTF-0.10.2";

  doCheck = false; # pulls in too many dependencies
  propagatedBuildInputs = with pythonPackages; [ flask wtforms flaskbabel ];

  src = fetchurl {
    url = "https://pypi.python.org/packages/source/F/Flask-WTF/Flask-WTF-0.10.2.tar.gz";
    md5 = "2932ac0e7e8df26f6efb6ee7e6cfb783";
  };

  meta = with stdenv.lib; {
    description = "Flask-WTF";
    homepage = http://github.com/lepture/flask-wtf;
    license = licenses.bsd3;
  };
}
