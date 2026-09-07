@echo off
REM ===========================================================
REM  Stage everything, commit, and push to GitHub.
REM
REM  Usage:
REM    Double-click it            -> asks for a commit message
REM    commit-push.bat Fix typo   -> uses "Fix typo" as the message
REM ===========================================================

setlocal
cd /d "%~dp0"

git rev-parse --is-inside-work-tree >nul 2>&1
if errorlevel 1 goto notrepo

REM --- Which branch are we on? ---
set "BRANCH="
for /f "delims=" %%B in ('git rev-parse --abbrev-ref HEAD') do set "BRANCH=%%B"
if not defined BRANCH goto nobranch

echo.
echo === Branch: %BRANCH% ===
echo.
echo === Changes to be committed ===
git status --short
echo.

REM --- Anything to commit? If not, skip ahead and just push. ---
git status --porcelain | findstr /r "." >nul
if errorlevel 1 goto nothingtocommit

REM --- Commit message: from arguments, or ask ---
set "MSG=%*"
if not defined MSG set /p "MSG=Commit message: "
if not defined MSG goto nomsg

git add -A
if errorlevel 1 goto failed

git commit -m "%MSG%"
if errorlevel 1 goto failed
goto push

:nothingtocommit
echo Working tree is clean - nothing new to commit.
echo Checking for commits that have not been pushed yet...
echo.

:push
git push -u origin %BRANCH%
if errorlevel 1 goto failed

echo.
echo === Done. Latest commit: ===
git log --oneline -1
echo.
pause
exit /b 0

:nothingtopush
echo Nothing to push.
pause
exit /b 0

:nomsg
echo.
echo Aborted: no commit message given. Nothing was committed or pushed.
pause
exit /b 1

:notrepo
echo.
echo Not a git repository: %CD%
pause
exit /b 1

:nobranch
echo.
echo Could not determine the current branch.
pause
exit /b 1

:failed
echo.
echo ===========================================================
echo  FAILED - see the error message above.
echo  If it mentions authentication, sign in to GitHub and retry.
echo ===========================================================
pause
exit /b 1
