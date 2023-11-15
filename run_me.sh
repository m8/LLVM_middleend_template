#!/bin/bash -e

export CC=clang-14
export CXX=clang++-14

# Check the cmake binary
CMAKE="cmake" ;

# Clean
rm -rf build/ ; 

# Build
mkdir build ; 
cd build ; 
${CMAKE} -DCMAKE_INSTALL_PREFIX="~/CAT" -DCMAKE_BUILD_TYPE=Debug ../ ; 
make ;
make install ;
cd ../ 

if ! test -e compile_commands.json ; then
  ln -s build/compile_commands.json ./ ;
fi
