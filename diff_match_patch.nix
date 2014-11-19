{ pkgs, pythonPackages, fetchsvn, ...}:

let
rev = "106";

in
pythonPackages.buildPythonPackage {
  name = "google-diff-match-patch-${rev}";
  buildInputs = [ pkgs.python ];
  src = fetchsvn {
    url = "http://google-diff-match-patch.googlecode.com/svn/trunk";
    inherit rev;
    sha256 = "1f331dh6b25qz5yc4syrjc4wfin27gkwp9yr88939qaa543hflnq";
  };
  phases = "unpackPhase installPhase postFixup";
  installPhase = ''
    mkdir -p $out/lib/${pkgs.python.libPrefix}/site-packages/
    cp -r ./python2 $out/lib/${pkgs.python.libPrefix}/site-packages/diff_match_patch
  '';
}


