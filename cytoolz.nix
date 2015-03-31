{ pythonPackages, fetchurl }:

pythonPackages.buildPythonPackage {
  name = "cytoolz-0.7.2";
  srcs = fetchurl {
    url = "https://pypi.python.org/packages/source/c/cytoolz/cytoolz-0.7.2.tar.gz";
    sha256 = "0nf1k3095dxih5awjvkx0q3ixs24i1yzkadia9zliahhyyfr8008";
  };
}
