mkdir libs
mkdir libs\debug
mkdir libs\release

git clone --depth 1 --branch v3 git@github.com:nodeca/js-yaml.git
copy js-yaml\dist\js-yaml.js duktape\src-tools\lib\extdeps

cd duktape
python tools/configure.py --output-dir=src

clang -c -g -gcodeview -o duktape.lib -target x86_64-pc-windows -fuse-ld=llvm-lib -Wall -DFNL_IMPL src\duktape.c
move duktape.lib ..\libs\debug

clang -c -O3 -o duktape.lib -target x86_64-pc-windows -fuse-ld=llvm-lib -Wall -DFNL_IMPL src\duktape.c
move duktape.lib ..\libs\release