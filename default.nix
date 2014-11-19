{ pkgs ? import <nixpkgs> {}, ... }:
rec {
  diff_match_patch = pkgs.callPackage ./diff_match_patch.nix {};
  flask_sqlalchemy = pkgs.callPackage ./flask_sqlalchemy.nix {};
  flask_wtf = pkgs.callPackage ./flask_wtf.nix { wtforms = wtforms; };
  pydkim = pkgs.callPackage ./pydkim.nix {};
  twill = pkgs.callPackage ./twill.nix {};
  flask_testing = pkgs.callPackage ./flask_testing.nix { twill = twill; };
  wtforms = pkgs.callPackage ./wtforms.nix {};
}
