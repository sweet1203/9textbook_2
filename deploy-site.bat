@echo off
chcp 65001 >nul
cd /d "%~dp0"

echo [1/4] docs 변경사항 추가...
git add docs/*.md
if errorlevel 1 (
  echo git add 실패
  pause
  exit /b 1
)

echo [2/4] 커밋...
git commit -m "docs: 다음 장 미리보기 섹션 제거 및 md 수정 반영"
if errorlevel 1 (
  echo 커밋할 변경 없음 또는 이미 커밋됨
)

echo [3/4] 원격 저장소로 푸시 (master)...
git push origin master
if errorlevel 1 (
  echo git push 실패 - GitHub 인증 확인 후 다시 실행하세요.
  pause
  exit /b 1
)

echo [4/4] MkDocs로 사이트 빌드 후 GitHub Pages 배포...
mkdocs gh-deploy --force
if errorlevel 1 (
  echo mkdocs 실패 - Python 및 mkdocs-material 설치 확인: pip install mkdocs-material
  pause
  exit /b 1
)

echo.
echo 완료. https://sweet1203.github.io/9textbook_2/ 에 수 분 내 반영됩니다.
pause
