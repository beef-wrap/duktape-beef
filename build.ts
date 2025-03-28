import { type Build } from 'xbuild';
import { $ } from 'bun';

await $`

# shim in js-yaml, see https://github.com/svaarala/duktape/issues/2410

git clone --depth 1 --branch v3 https://github.com/nodeca/js-yaml.git
cp js-yaml/dist/js-yaml.js duktape/src-tools/lib/extdeps

# configure duktape

rm -rf duktape/src
python duktape/tools/configure.py --output-directory=duktape/src

`

const build: Build = {
    common: {
        project: 'duktape',
        archs: ['x64'],
        variables: [],
        copy: {},
        defines: [],
        options: [],
        subdirectories: [],
        libraries: {
            duktape: {
                sources: ['duktape/src/duktape.c'],
            },
        },
        buildDir: 'build',
        buildOutDir: 'libs',
        buildFlags: []
    },
    platforms: {
        win32: {
            windows: {},
            // android: {
            //     archs: ['x86', 'x86_64', 'armeabi-v7a', 'arm64-v8a'],
            // }
        },
        linux: {
            linux: {}
        },
        darwin: {
            macos: {}
        }
    }
}

export default build;