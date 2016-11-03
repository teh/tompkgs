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
  seaborn = pkgs.callPackage ./seaborn.nix {};
  statsmodels = pkgs.callPackage ./statsmodels.nix { patsy = patsy; };
  patsy = pkgs.callPackage ./patsy.nix {};
  bcolz = pkgs.callPackage ./bcolz.nix {};
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
  yapf = pkgs.callPackage ./yapf.nix {};
  gensim = pkgs.callPackage ./gensim.nix {};
  rdbtools = pkgs.callPackage ./rdbtools.nix {};
  pysistence = pkgs.callPackage ./pysistence.nix {};
  protobuf-to-dict = pkgs.callPackage ./protobuf-to-dict.nix {};

  pystruct = pkgs.callPackage ./pystruct.nix {};
  fastfm = pkgs.callPackage ./fastfm.nix {};
  pyrsistent = pkgs.callPackage ./pyrsistent.nix {};
  theano = pkgs.callPackage ./theano.nix {};
  sklearn_0_16 = pkgs.callPackage ./scikit-learn.nix {};
  pylearn2 = pkgs.callPackage ./pylearn2.nix { theano = theano; };
  scikit-nn = pkgs.callPackage ./scikit-nn.nix { pylearn2 = pylearn2; };

  jedi = pkgs.callPackage ./jedi.nix {};

  pymc2 = pkgs.callPackage ./pymc2.nix {};
  pymc3 = pkgs.callPackage ./pymc3.nix { theano = theano; };

  scrapy = pkgs.callPackage ./scrapy.nix {};
  scrapely = pkgs.callPackage ./scrapely.nix {};

  luigi = pkgs.callPackage ./luigi.nix {};

  arctic = pkgs.callPackage ./arctic.nix {};

  edward = pkgs.callPackage ./edward.nix { tensorflow = pkgs.pythonPackages.tensorflowCuDNN; };
}
