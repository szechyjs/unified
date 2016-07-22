#!/bin/bash
mkdir -p /usr/local/unified
for dep in "$@"
do
    name=${dep%:*}
    version=${dep#*:}
    stow --no-folding -t /usr/local/unified \
        --ignore=CHANGES --ignore=INSTALL_RECEIPT.json \
        --ignore=ChangeLog --ignore=AUTHORS \
        --ignore=ChangeLog.md --ignore=TODO \
        --ignore=NEWS \
        -d /usr/local/Cellar/$name $version
done
