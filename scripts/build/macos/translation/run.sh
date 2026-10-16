#!/bin/sh
set -eu

SCRIPT_DIR=$(CDPATH= cd "$(dirname "$0")" && pwd)
ROOT_DIR=$(CDPATH= cd "$SCRIPT_DIR/../../../.." && pwd)
cd "$ROOT_DIR"

for ts_file in steamCloudSaveDownloaderGUI/i18n/*.ts; do
    base_name=$(basename "$ts_file" .ts)
    uv run pyside6-lrelease "$ts_file" -qm "steamCloudSaveDownloaderGUI/res/$base_name.qm"
done

uv run pyside6-rcc steamCloudSaveDownloaderGUI/res/translations.qrc \
    -o steamCloudSaveDownloaderGUI/res/translations.py
