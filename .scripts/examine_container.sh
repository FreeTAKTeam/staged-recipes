#!/usr/bin/env bash


export FEEDSTOCK_ROOT="${FEEDSTOCK_ROOT:-/home/conda/staged-recipes}"
source "${FEEDSTOCK_ROOT}/.scripts/logging_utils.sh"

( startgroup "Examine container" ) 2> /dev/null

set

uname -a

( stopgroup "Examine container" ) 2> /dev/null