#!/bin/bash
# ============================================
# Script para configurar ESLint + Prettier no VSCode (Linux/Mac)
# ============================================

echo "====================================================="
echo " Instalando ESLint e Prettier..."
echo "====================================================="
npm install -D eslint prettier

echo "====================================================="
echo " Instalando Airbnb config e dependências..."
echo "====================================================="
npx install-peerdeps --dev eslint-config-airbnb

echo "====================================================="
echo " Instalando eslint-config-prettier e eslint-plugin-prettier..."
echo "====================================================="
npm install -D eslint-config-prettier eslint-plugin-prettier

echo "====================================================="
echo " Criando arquivo .eslintrc.json ..."
echo "====================================================="
cat <<EOF > .eslintrc.json
{
  "extends": ["airbnb", "prettier"],
  "plugins": ["prettier"],
  "rules": {
    "prettier/prettier": ["error"]
  }
}
EOF

echo "====================================================="
echo " Criando arquivo .prettierrc ..."
echo "====================================================="
cat <<EOF > .prettierrc
{
  "printWidth": 100,
  "singleQuote": true
}
EOF

echo "====================================================="
echo " Instalando extensões do VSCode: ESLint e Prettier..."
echo "====================================================="
code --install-extension dbaeumer.vscode-eslint
code --install-extension esbenp.prettier-vscode

echo "====================================================="
echo " Adicionando configuração editor.formatOnSave ao VSCode"
echo "====================================================="

SETTINGS_FILE="$HOME/.config/Code/User/settings.json"

if [ ! -f "$SETTINGS_FILE" ]; then
  mkdir -p "$(dirname "$SETTINGS_FILE")"
  cat <<EOF > "$SETTINGS_FILE"
{
  "editor.formatOnSave": true
}
EOF
else
  if grep -q '"editor.formatOnSave"' "$SETTINGS_FILE"; then
    echo "⚠️ Configuração já existe em $SETTINGS_FILE"
  else
    tmpfile=$(mktemp)
    jq '. + {"editor.formatOnSave": true}' "$SETTINGS_FILE" > "$tmpfile" && mv "$tmpfile" "$SETTINGS_FILE"
    echo "✅ Configuração adicionada em $SETTINGS_FILE"
  fi
fi

echo "====================================================="
echo " ✅ Configuração concluída! Abra o VSCode e aproveite."
echo "====================================================="
