echo =====================================================
echo Instalando ESLint e Prettier...
echo =====================================================
npm install -D eslint prettier

echo =====================================================
echo Instalando Airbnb config e dependências...
echo =====================================================
npx install-peerdeps --dev eslint-config-airbnb

echo =====================================================
echo Instalando eslint-config-prettier e eslint-plugin-prettier...
echo =====================================================
npm install -D eslint-config-prettier eslint-plugin-prettier

echo =====================================================
echo Criando arquivo .eslintrc.json ...
echo =====================================================
(
echo {
echo   "extends": ["airbnb", "prettier"],
echo   "plugins": ["prettier"],
echo   "rules": {
echo     "prettier/prettier": ["error"]
echo   }
echo }
) > .eslintrc.json

echo =====================================================
echo Criando arquivo .prettierrc ...
echo =====================================================
(
echo {
echo   "printWidth": 100,
echo   "singleQuote": true
echo }
) > .prettierrc

echo =====================================================
echo Instalando extensões do VSCode: ESLint e Prettier...
echo =====================================================
code --install-extension dbaeumer.vscode-eslint
code --install-extension esbenp.prettier-vscode

echo =====================================================
echo Adicionando configuracao "editor.formatOnSave": true ao VSCode
echo =====================================================


if not exist "%APPDATA%\Code\User\settings.json" (
    echo { > "%APPDATA%\Code\User\settings.json"
    echo   "editor.formatOnSave": true >> "%APPDATA%\Code\User\settings.json"
    echo } >> "%APPDATA%\Code\User\settings.json"
) else (
    powershell -Command "(Get-Content '%APPDATA%\Code\User\settings.json') -replace '\}$', '  ,\"editor.formatOnSave\": true`n}' | Set-Content '%APPDATA%\Code\User\settings.json'"
)

echo =====================================================
echo ✅ Configuração concluída! 
echo Abra o VSCode e aproveite ESLint + Prettier configurados.
echo =====================================================
pause
