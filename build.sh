git clone --depth 1 --branch v3 git@github.com:nodeca/js-yaml.git
copy js-yaml\dist\js-yaml.js duktape\src-tools\lib\extdeps
python duktape/tools/configure.py --output-directory=duktape/src

cmake -S . -B duktape/build -DCMAKE_BUILD_TYPE=Debug
cmake --build duktape/build --config Debug

cmake -S . -B duktape/build -DCMAKE_BUILD_TYPE=Release
cmake --build duktape/build --config Release