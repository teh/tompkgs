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
    psycopg2
  ];
  srcs = fetchurl {
    url = "https://github.com/mwaskom/seaborn/archive/v${version}.zip";
    sha256 = "1yxgw07rcnfm385gq7djfp8dliibm484r6rskprf55ipz16y838h";
  };
}
