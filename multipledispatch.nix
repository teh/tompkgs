{ pythonPackages, fetchurl }:

pythonPackages.buildPythonPackage {
  name = "multipledispatch-0.4.7";
  srcs = fetchurl {
    url = "https://pypi.python.org/packages/source/m/multipledispatch/multipledispatch-0.4.7.tar.gz";
    sha256 = "0va916qh4hdgbll78905nmr13gqhfvpn17h206gkb1dxrmsvh6s0";
  };
}
