#!/bin/bash
# macOS / Linux 용
set -e

TEMPLATE_SRC="$(cd "$(dirname "$0")" && pwd)/templates/CMP.xml"
TARGETS=(
  "$HOME/Library/Application Support/Google/AndroidStudio"*
  "$HOME/.config/Google/AndroidStudio"*
)

COUNT=0
for dir in "${TARGETS[@]}"; do
  if [ -d "$dir" ]; then
    mkdir -p "$dir/templates"
    cp "$TEMPLATE_SRC" "$dir/templates/CMP.xml"
    echo "Installed to: $dir/templates/CMP.xml"
    COUNT=$((COUNT + 1))
  fi
done

if [ $COUNT -eq 0 ]; then
  echo "Android Studio 설정 폴더를 찾지 못했습니다. Android Studio를 한 번 이상 실행한 뒤 다시 시도하세요."
  exit 1
fi

echo "완료! Android Studio를 재시작하면 Live Templates > CMP 그룹에서 사용할 수 있습니다."