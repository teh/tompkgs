# Data science related nix packages

This is a collection of packages that are still a bit oo experimental to be folded into nixpkgs.

To test that they're still building run `nix-build` in this directory.

You can include the packages in another project by providing `pkgs` as an argument. E.g.


```nix
let
  pkgs = (import <nixpkgs> {}).pkgs;
  tompkgs = import <tompkgs> { inherit pkgs; };
propagatedBuildInputs = [
    numpy
    tompkgs.arctic
];
```
