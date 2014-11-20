{ pythonPackages, fetchurl }:

pythonPackages.buildPythonPackage {
  name = "toolz-0.7.0";
  srcs = fetchurl {
    url = "https://pypi.python.org/packages/source/t/toolz/toolz-0.7.0.tar.gz";
    sha256 = "1wynz9iwk1p80xwik7mn29b8cj6hz4qsxv5n8qhxn5hcjq7mk24g";
  };
}
