{ pkgs, stdenv, pythonPackages, fetchurl,  ...}:

pythonPackages.buildPythonPackage rec {
    name = "scikit-learn-0.16.1";

    src = pkgs.fetchurl {
      url = "https://pypi.python.org/packages/source/s/scikit-learn/scikit-learn-0.16.1.tar.gz";
      sha256 = "1r761qmsq2mnl8sapplbx0ipj6i7ppr2cmz009q5rjana0liwwn0";
    };

    buildInputs = with pythonPackages; [ nose pillow pkgs.gfortran pkgs.glibcLocales ];
    propagatedBuildInputs = with pythonPackages; [ numpy scipy pkgs.openblas ];

    buildPhase = ''
      ${pythonPackages.python.executable} setup.py build_ext -i --fcompiler='gnu95'
    '';

    checkPhase = ''
      LC_ALL="en_US.UTF-8" HOME=$TMPDIR OMP_NUM_THREADS=1 nosetests
    '';

    meta = {
      description = "A set of python modules for machine learning and data mining";
      homepage = http://scikit-learn.org;
      license = stdenv.licenses.bsd3;
    };
  }
