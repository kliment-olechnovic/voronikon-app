#!/bin/bash

cd "$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

g++ -std=c++14 -O3 -o "./voronota-lt" "./voronota-js-src/expansion_lt/src/voronota_lt.cpp"
