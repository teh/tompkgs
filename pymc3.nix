{ stdenv, fetchurl, openblas, theano, gfortran, pythonPackages, unzip }:

pythonPackages.buildPythonPackage rec {
    name = "pymc3-beta";

    propagatedBuildInputs = with pythonPackages; [
      pythonPackages.matplotlib
      pythonPackages.numpy
      pythonPackages.scipy
      openblas
      gfortran
      unzip
      theano
    ];

    doCheck = false;

    src = fetchurl {
      url = "https://github.com/pymc-devs/pymc3/archive/v3.0beta.zip";
      sha256 = "1xhrdj74fg9fxs8cz4cvbmcdk5y49df2pq1m1hx6a313grc9gxk1";
    };

    meta = with stdenv.lib; {
      description = "Bayesian estimation, particularly using Markov chain Monte Carlo (MCMC)";
      homepage = http://github.com/pymc-devs/pymc3;
    };
  }
