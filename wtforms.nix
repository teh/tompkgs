{ stdenv, pythonPackages, fetchurl }:
pythonPackages.buildPythonPackage rec {
  name = "WTForms-2.0.1";
  propagatedBuildInputs = with pythonPackages; [  ];
  src = fetchurl {
    url = "https://pypi.python.org/packages/source/W/WTForms/WTForms-2.0.1.zip";
    md5 = "aaac94c137b3cd63efeb3ded51082cde";
  };

  meta = with stdenv.lib; {
    description = "What is WTForms?";
    homepage = http://wtforms.simplecodes.com/;
    license = licenses.bsd3;
  };
}
