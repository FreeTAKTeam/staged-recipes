#!/usr/bin/env bash

set

set -o xtrace -o nounset -o pipefail -o errexit

find .

npm pack --ignore-scripts
find .
npm install -ddd \
    --global \
    --build-from-source \
    ${SRC_DIR}/${PKG_NAME}-${PKG_VERSION}.tgz

find . 
# Create license report for dependencies
pnpm install
pnpm-licenses generate-disclaimer --prod --output-file=third-party-licenses.txt

tee ${PREFIX}/bin/node-red.cmd << EOF
call %CONDA_PREFIX%\bin\node %CONDA_PREFIX%\bin\nodered %*
EOF
