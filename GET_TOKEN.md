# Como Obter o Token MCP do N8n

O endpoint MCP está funcionando! Mas o token JWT precisa ser atualizado.

## Passos para Obter o Token Correto:

### 1. Acesse a Interface Web do N8n
Abra no navegador: `http://localhost:5678`

### 2. Faça Login ou Crie uma Conta
Se é a primeira vez, você precisará criar uma conta de administrador.

### 3. Obtenha a API Key/Token:

**Opção A - Via Interface (Recomendado):**
1. Vá em **Settings** (Configurações) → **API**
2. Clique em **Create API Key**
3. Dê um nome (ex: "MCP Integration")
4. Copie o token gerado

**Opção B - Via curl (se já tiver credenciais):**
```bash
# Faça login primeiro
curl -X POST http://localhost:5678/rest/login \
  -H "Content-Type: application/json" \
  -d '{"email":"seu-email@exemplo.com","password":"sua-senha"}'
```

### 4. Atualize o arquivo .vscode/mcp.json
Substitua o token antigo pelo novo na linha do header:
```json
"--header",
"authorization:Bearer SEU_NOVO_TOKEN_AQUI"
```

### 5. Recarregue o VS Code
Pressione `Ctrl+Shift+P` → Digite "Developer: Reload Window"

## Verificar se Está Funcionando

Após obter o novo token, teste:
```bash
curl -s http://localhost:5678/mcp-server/http \
  -H "authorization: Bearer SEU_TOKEN" \
  -H "Content-Type: application/json" \
  -d '{"method":"tools/list"}'
```

Se retornar uma lista de ferramentas, está funcionando! 🎉
