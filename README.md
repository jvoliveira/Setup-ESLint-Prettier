# 🛠️ Setup ESLint + Prettier

Este repositório contém scripts para configurar rapidamente **ESLint + Prettier** em projetos Node.js com as boas práticas do Airbnb.

---

## 📦 O que os scripts fazem

1. Instalam ESLint e Prettier como dependências.
2. Configuram o **Airbnb Style Guide**.
3. Instalam `eslint-config-prettier` e `eslint-plugin-prettier`.
4. Criam automaticamente:
   - `.eslintrc.json`
   - `.prettierrc`
5. Instalam as extensões do VSCode:
   - [ESLint](https://marketplace.visualstudio.com/items?itemName=dbaeumer.vscode-eslint)
   - [Prettier](https://marketplace.visualstudio.com/items?itemName=esbenp.prettier-vscode)
6. Ativam `editor.formatOnSave: true` no VSCode.

---

## 🚀 Como usar

### 🔹 Windows
1. Baixe o arquivo.
2. Na raiz do projeto, execute:
   ```bash
   setup-windows.bat
   ```

### 🔹 Linux
1. Baixe o arquivo.
2. Dê permissão de execução ao script:
  ```bash
  chmod +x setup-linux.sh
  ```
3. Na raiz do projeto, execute:
  ```bash
  ./setup-linux.sh
  ```
