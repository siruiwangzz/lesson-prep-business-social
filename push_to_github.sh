#!/bin/bash
# 推送 skill 到 GitHub 并设置仓库 description
# 用法: GH_TOKEN=<your_token> bash push_to_github.sh
set -e

TOKEN="${GH_TOKEN:?请通过环境变量 GH_TOKEN 提供 GitHub Personal Access Token}"
REPO="siruiwangzz/lesson-prep-business-social"
DESC="面向商科/经济/社科的 WorkBuddy 备课技能：上传教材 PDF/Word/截图，按页提取重点、设计课堂互动（含答案）、总结知识脉络。A WorkBuddy skill for business/econ/social-science lesson prep."
WORKDIR="/Users/siruiwang/Desktop/WORK/2023 WholeRen/上课skill1_商科社科/lesson-prep-business-social"

cd "$WORKDIR"

echo "→ 设置仓库 description..."
DESC_JSON=$(python3 -c 'import json,sys; print(json.dumps({"description": sys.argv[1]}, ensure_ascii=False))' "$DESC")
DESC_RESP=$(curl -s -w "\n%{http_code}" -X PATCH \
  -H "Authorization: Bearer $TOKEN" \
  -H "Accept: application/vnd.github+json" \
  -H "X-GitHub-Api-Version: 2022-11-28" \
  https://api.github.com/repos/$REPO \
  -d "$DESC_JSON")
DESC_CODE=$(echo "$DESC_RESP" | tail -1)
if [ "$DESC_CODE" != "200" ]; then
  echo "  ✗ description 设置失败 (HTTP $DESC_CODE)："
  echo "$DESC_RESP" | head -n -1
  exit 1
fi
echo "  ✓ description 已设置"

echo "→ 推送代码..."
git remote remove origin 2>/dev/null || true
git remote add origin "https://x-access-token:${TOKEN}@github.com/${REPO}.git"
if ! git push -u origin main; then
  git remote set-url origin "https://github.com/${REPO}.git"
  echo "  ✗ 推送失败。请确认 token 具备该仓库的 Contents: write 权限。"
  exit 1
fi

# 清理 remote 中明文保存的 token
git remote set-url origin "https://github.com/${REPO}.git"

echo "→ 完成：https://github.com/$REPO"
