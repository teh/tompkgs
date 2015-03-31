# Data science related nix packages

This is a collection of packages useful for doing data science.

To test that they're still building run `nix-build` in this directory.

You can include the packages in another project by prooviding `pkgs`
as an argument. E.g.


```nix
tompkgs = import <tompkgs> { pkgs = pkgs; };
propagatedBuildInputs = [
    numpy
    tompkgs.blaze
];
```
