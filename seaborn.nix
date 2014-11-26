{ pkgs, pythonPackages, fetchurl, unzip }:
let
version = "0.5.1";

in
pythonPackages.buildPythonPackage {
  name = "seaborn-${version}";
  propagatedBuildInputs = with pythonPackages; [
    numpy
    pandas
    unzip
    scipy
    matplotlib
  ];
  srcs = fetchurl {
    url = "https://github.com/mwaskom/seaborn/archive/v${version}.zip";
    sha256 = "005v8cmlkz4dflbiiakhnbha6m4w10kh9ybvcv5f5jv01z77k6za";
  };
}
