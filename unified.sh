#!/bin/bash

UNIFIED_DIR=/usr/local/unified
CELLAR_DIR=/usr/local/Cellar
XCODE_APP_GL=$(xcrun --show-sdk-path)/System/Library/Frameworks/OpenGL.framework/Headers
XCODE_CMD_GL=/System/Library/Frameworks/OpenGL.framework/Headers

mkdir -p $UNIFIED_DIR/include

if [ -d "$XCODE_CMD_GL" ]; then
    ln -sfn $XCODE_CMD_GL $UNIFIED_DIR/include/GL
elif [ -d "$XCODE_APP_GL" ]; then
    ln -sfn $XCODE_APP_GL $UNIFIED_DIR/include/GL
else
    echo "Could not locate OpenGL headers. Is Xcode installed?"
fi

# Symlink all brew dependencies into single directory
for dep in "$@"
do
    name=${dep%:*}
    version=${dep#*:}
    stow --no-folding -t $UNIFIED_DIR \
        --ignore=CHANGES --ignore=INSTALL_RECEIPT.json \
        --ignore=ChangeLog --ignore=AUTHORS \
        --ignore=ChangeLog.md --ignore=TODO \
        --ignore=NEWS \
        -d $CELLAR_DIR/$name $version
done
