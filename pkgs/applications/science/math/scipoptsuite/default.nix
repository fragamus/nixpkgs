{ stdenv, requireFile, cmake, bison, flex, readline, zlib, gmp, bliss, ipopt }:

stdenv.mkDerivation rec {
  name = "scipoptsuite-${version}";
  version = "6.0.0";

  src = requireFile rec {
    name = "scipoptsuite-${version}.tgz"; 
    message = ''
      This nix expression requires that ${name} is already part of the store.
      Download the software at 
      http://scip.zib.de/download.php?fname=${name} 
      and run the following command in the download directory:
      nix-prefetch-url file://\$PWD/${name}
    '';
    sha256 = "a91119687e521575070c43eaa30bc15ce461e9dc414651793ea4c4ca33b89750";
  };

  buildInputs = [ cmake bison flex readline zlib gmp bliss ipopt ];

  buildPhase = ''
    find .
    mkdir build
    cd build
    cmake .. #\
#      -DIPOPT_LIBRARIES=../Ipopt-3.12.9/lib/libipopt.so \
#      -DIPOPT_INCLUDE_DIRS=../Ipopt-3.12.9/include/coin \
#      -DBLISS_INCLUDE_DIR=../ \
#      -DBLISS_LIBRARY=../bliss/libbliss.a \
#      -DCRITERION_INCLUDE_DIR=../Criterion/include/criterion \
#      -DCRITERION_LIBRARY=../Criterion/build/libcriterion.so
    make
  '';


  meta = with stdenv.lib; {
    description = "";
    homepage = http://scip.zib.de/;
    license = licenses.unfree;
    platforms = [ "i686-linux" "x86_64-linux" ];
  };
}
