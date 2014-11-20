{ pkgs ? import <nixpkgs> {}, ... }:
rec {
  diff_match_patch = pkgs.callPackage ./diff_match_patch.nix {};
  flask_sqlalchemy = pkgs.callPackage ./flask_sqlalchemy.nix {};
  flask_wtf = pkgs.callPackage ./flask_wtf.nix { wtforms = wtforms; };
  pydkim = pkgs.callPackage ./pydkim.nix {};
  twill = pkgs.callPackage ./twill.nix {};
  flask_testing = pkgs.callPackage ./flask_testing.nix { twill = twill; };
  wtforms = pkgs.callPackage ./wtforms.nix {};

  libdynd = pkgs.callPackage ./libdynd.nix {};
  dynd_python = pkgs.callPackage ./dynd_python.nix { libdynd = libdynd; };

  datashape = pkgs.callPackage ./datashape.nix { multipledispatch = multipledispatch; };
  multipledispatch = pkgs.callPackage ./multipledispatch.nix {};
  
  cytoolz = pkgs.callPackage ./cytoolz.nix {};
  toolz = pkgs.callPackage ./toolz.nix {};
  #pymongo = pkgs.callPackage ./pymongo.nix {};

  blaze = pkgs.callPackage ./blaze.nix {
    multipledispatch = multipledispatch;
    cytoolz = cytoolz;
    toolz = toolz;
    datashape = datashape;
    dynd_python = dynd_python;
  };
}
