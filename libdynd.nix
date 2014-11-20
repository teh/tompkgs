{ stdenv, fetchurl, cmake, unzip }:

stdenv.mkDerivation {
  name = "libdynd-0.6.6";
  buildInputs = [
    cmake
    unzip
  ];
  cmakeFlags = [
   "-DDYND_BUILD_TESTS=OFF"
  ];
  srcs = fetchurl {
    url = "https://github.com/ContinuumIO/libdynd/archive/v0.6.6.zip";
    sha256 = "196xiii0pdvc5y8x90a2gk7k0nzlix2f28gvgp38dfsbppcdlk9n";
  };
}
