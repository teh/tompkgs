{ pythonPackages, fetchurl }:

pythonPackages.buildPythonPackage {
  name = "cytoolz-0.7.0";
  srcs = fetchurl {
    url = "https://pypi.python.org/packages/source/c/cytoolz/cytoolz-0.7.0.tar.gz";
    sha256 = "1pvh7gmdfc0j0hkgwag8k7wmggn7jkl96wi4dzk3y9sa0mf4h182";
  };
}
