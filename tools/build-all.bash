#!/bin/bash

cd "$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

./build-voronota-lt.bash

./build-voronota-js.bash

