#!/usr/bin/env bash
set -e
cd "$HOME/card-product/relay"
touch .nojekyll
git init -b main >/dev/null 2>&1 || true
git config user.name ericlin1994
git config user.email ericlin1994@users.noreply.github.com
git add -A
git commit -m "新增共用電子名片分享服務的隱私權政策頁" >/dev/null
gh repo create ericlin1994/line-ecard-relay --public --source=. --push 2>&1 | tail -3
gh api -X POST /repos/ericlin1994/line-ecard-relay/pages -f "source[branch]=main" -f "source[path]=/" 2>&1 | head -5
echo "=== done ==="
