{ pkgs ? import <nixpkgs> {}, ... }:
rec {
  diff_match_patch = pkgs.callPackage ./diff_match_patch.nix {};
  flask_sqlalchemy = pkgs.callPackage ./flask_sqlalchemy.nix {};
  flask_wtf = pkgs.callPackage ./flask_wtf.nix { wtforms = wtforms; };
  pydkim = pkgs.callPackage ./pydkim.nix {};
  twill = pkgs.callPackage ./twill.nix {};
  sklearn-pandas = pkgs.callPackage ./sklearn-pandas.nix {};
  flask_testing = pkgs.callPackage ./flask_testing.nix { twill = twill; };
  wtforms = pkgs.callPackage ./wtforms.nix {};
  dask = pkgs.callPackage ./dask.nix { cytoolz = cytoolz; toolz = toolz; bcolz = bcolz; };
  seaborn = pkgs.callPackage ./seaborn.nix {};
  statsmodels = pkgs.callPackage ./statsmodels.nix { patsy = patsy; };
  patsy = pkgs.callPackage ./patsy.nix {};
  bcolz = pkgs.callPackage ./bcolz.nix {};
  joblib = pkgs.callPackage ./joblib.nix {};
  libdynd = pkgs.callPackage ./libdynd.nix {};
  llvmlite = pkgs.callPackage ./llvmlite.nix {};
  numba = pkgs.callPackage ./numba.nix { llvmlite = llvmlite; };
  dynd_python = pkgs.callPackage ./dynd_python.nix { libdynd = libdynd; };
  datashape = pkgs.callPackage ./datashape.nix { multipledispatch = multipledispatch; };
  multipledispatch = pkgs.callPackage ./multipledispatch.nix {};
  odo = pkgs.callPackage ./odo.nix {
    datashape = datashape;
    multipledispatch = multipledispatch;
    cytoolz = cytoolz;
    toolz = toolz;
  };
  cytoolz = pkgs.callPackage ./cytoolz.nix {};
  toolz = pkgs.callPackage ./toolz.nix {};
  gensim = pkgs.callPackage ./gensim.nix {};
  rdbtools = pkgs.callPackage ./rdbtools.nix {};
  pysistence = pkgs.callPackage ./pysistence.nix {};
  protobuf-to-dict = pkgs.callPackage ./protobuf-to-dict.nix {};
  blaze = pkgs.callPackage ./blaze.nix {
    multipledispatch = multipledispatch;
    cytoolz = cytoolz;
    toolz = toolz;
    datashape = datashape;
    dynd_python = dynd_python;
    bcolz = bcolz;
    odo = odo;
  };

  # broken:

  #  pydatalog = pkgs.callPackage ./pydatalog.nix {};
  # output path ‘/nix/store/v74yksig6h9shcrnq1zsfgf8q5kcffn6-hg-archive’ should have r:md5 hash ‘a5b273793b0c00265abc3d007e7c654b’, instead has ‘df2b9de24399338f6c9263a5f9082dff’


}
