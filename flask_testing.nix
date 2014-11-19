{ stdenv, pythonPackages, fetchurl, twill }:
pythonPackages.buildPythonPackage rec {
  name = "Flask-Testing-0.4.2";

  propagatedBuildInputs = with pythonPackages; [ flask twill ];
  doCheck = false;

  src = fetchurl {
    url = "https://pypi.python.org/packages/source/F/Flask-Testing/Flask-Testing-0.4.2.tar.gz";
    md5 = "f47d9b859bae7ac43728cf61ca3eaa88";
  };

  meta = with stdenv.lib; {
    description = "Flask-Testing";
    homepage = https://github.com/jarus/flask-testing;
    license = licenses.bsd3;
  };
}
