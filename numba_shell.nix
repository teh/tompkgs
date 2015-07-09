{ tompkgs ? import <tompkgs> {} }:

with nixpkgs;

pkgs.buildPythonPackage {
  name = "test";
  srcs = ./.;
  propagatedBuildInputs = [
#    tompkgs.dask
#    tompkgs.sklearn-pandas
    tompkgs.numba
    pythonPackages.ipython
  ];
}
