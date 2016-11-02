{ stdenv, fetchurl, pythonPackages, tensorflow }:
pythonPackages.buildPythonPackage rec {
  name = "edward-1.1.4";

  propagatedBuildInputs = [
    tensorflow
    pythonPackages.scipy
  ];

  src = fetchurl {
    url = "mirror://pypi/e/edward/${name}.tar.gz";
    sha256 = "0xdl0pd3rycvkkx2cxyd5s5vc5pjrqrjpy7j2b15ns71sssxw32l";
  };

  meta = with stdenv.lib; {
    description = "A library for probabilistic modeling, inference, and criticism";
    homepage = http://edwardlib.org/;
    license = licenses.apl2;
  };
}
