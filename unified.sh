#!/bin/bash
for dep in "$@"
do
    name=${dep%:*}
    version=${dep#*:}
    stow --no-folding -t /usr/local/unified \
        --ignore=CHANGES --ignore=INSTALL_RECEIPT.json \
        -d /usr/local/Cellar/$name $version
done
