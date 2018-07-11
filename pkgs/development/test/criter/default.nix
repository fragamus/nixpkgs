{ stdenv, fetchFromGitHub, cmake, git, pkgconfig, gettext }:

stdenv.mkDerivation rec {
  PKG_CONFIG_DIR = pkgconfig;
  GETTEXT_DIR = gettext;
  name = "criter-${version}";
  version = "2.3.2";

  src = fetchFromGitHub {
    owner = "Snaipe";
    repo = "criterion";
    rev = "v${version}";
    sha256 = "0q7s9m6jsg637p37f5wj20fgvwn023snsjn56zpaq6nj909lin8b";
  };

  nativeBuildInputs = [ cmake git pkgconfig gettext ];

  preConfigure = ''
    git init
  '';


#  buildPhase = ''
#    find .
#    mkdir build
#    cd build
#    cmake ..
#    cmake --build .
#  '';

  meta = with stdenv.lib; {
    description = "A dead-simple, yet extensible, C and C++ unit testing framework.";
    homepage = https://github.com/Snaipe/Criterion;
    license = licenses.mit;
    platforms = [ "i686-linux" "x86_64-linux" ];
  };
}
