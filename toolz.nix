{ pythonPackages, fetchurl }:

pythonPackages.buildPythonPackage {
  name = "toolz-0.7.1";
  srcs = fetchurl {
    url = "https://pypi.python.org/packages/source/t/toolz/toolz-0.7.1.tar.gz";
    sha256 = "1dax1040nvv8895xl114mydmh3rzy5842lr39iavzvgrla9gswfc";
  };
}
