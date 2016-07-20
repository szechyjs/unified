#!/bin/bash
for dep in "$@"
do
    name=${dep%:*}
    version=${dep#*:}
    stow --no-folding -t /usr/local/unified \
        --ignore=CHANGES --ignore=INSTALL_RECEIPT.json \
        --ignore=ChangeLog --ignore=AUTHORS \
        -d /usr/local/Cellar/$name $version
done
