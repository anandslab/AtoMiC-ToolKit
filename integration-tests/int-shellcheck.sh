#!/bin/bash
# Script Name: AtoMiC Integration Test shellcheck check
# Author: TommyE123
# Publisher: http://www.htpcBeginner.com
# License: MIT License (refer to README.md for more details)

find . -name '*.sh' -print0 | xargs -0 shellcheck
