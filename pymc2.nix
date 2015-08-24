{ stdenv, fetchurl, openblas, gfortran, pythonPackages }:

pythonPackages.buildPythonPackage rec {
    name = "pymc-2.3.4";

    propagatedBuildInputs = with pythonPackages; [
      pythonPackages.matplotlib
      pythonPackages.numpy
      pythonPackages.scipy
      openblas
      gfortran
    ];

    doCheck = false;

    installPhase = ''
    ${pythonPackages.python}/bin/${pythonPackages.python.executable} setup.py install \
      --install-lib=$out/lib/${pythonPackages.python.libPrefix}/site-packages \
      --prefix="$out"
    '';

    src = fetchurl {
      url = "https://pypi.python.org/packages/source/p/pymc/pymc-2.3.4.tar.gz";
      md5 = "b9bb3eb4f81df6c7d49c0a9a0cee81bc";
    };

    meta = with stdenv.lib; {
      description = "Bayesian estimation, particularly using Markov chain Monte Carlo (MCMC)";
      homepage = http://github.com/pymc-devs/pymc;
    };
  }
