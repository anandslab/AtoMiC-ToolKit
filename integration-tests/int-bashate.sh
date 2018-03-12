#!/bin/bash
# Script Name: AtoMiC Integration Test bashate check

find . -name '*.sh' -print0 | xargs -0 bashate -i E006
