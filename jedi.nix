{ stdenv, fetchurl, pythonPackages }:
pythonPackages.buildPythonPackage rec {
    name = "jedi-0.9.0";

    propagatedBuildInputs = with pythonPackages; [  ];

    src = fetchurl {
      url = "https://pypi.python.org/packages/source/j/jedi/jedi-0.9.0.tar.gz";
      md5 = "2fee93d273622527ef8c97ac736e92bd";
    };

    meta = with stdenv.lib; {
      description = "Awesome autocompletion and static analysis library for python. http://jedi.jedidjah.ch/";
      homepage = https://github.com/davidhalter/jedi;
      license = licenses.mit;
    };
}
