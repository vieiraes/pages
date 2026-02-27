# N8n + MCP Project

Este projeto utiliza o N8n com integração MCP (Model Context Protocol) para automação de workflows.

## Status da Configuração

✅ N8n rodando em Docker (versão 2.9.4)
✅ N8n em execução na porta 5678
✅ Configuração MCP criada em `.vscode/mcp.json`
✅ Docker Compose configurado com variáveis MCP
✅ Endpoint MCP funcional em `http://localhost:5678/mcp-server/http`
⚠️ **Próximo passo:** Obter token JWT válido (veja [GET_TOKEN.md](GET_TOKEN.md))

## Como Usar

### 1. Obter Token de Autenticação
Siga as instruções em [GET_TOKEN.md](GET_TOKEN.md) para obter um token JWT válido do N8n.

### 2. Atualizar o Token no MCP
Após obter o token, atualize o arquivo [.vscode/mcp.json](.vscode/mcp.json) com o novo token.

### 3. Testar a Conexão
Execute o script de teste:
```bash
./test-mcp.sh
```

### 4. Recarregar o VS Code
Pressione `Ctrl+Shift+P` → "Developer: Reload Window"

## Gerenciamento do N8n

### Iniciar o N8n
```bash
docker compose up -d
```

### Parar o N8n
```bash
docker compose down
```

### Ver Logs
```bash
docker logs teams-n8n-n8n-1 -f
```

## Configuração MCP

O arquivo `.vscode/mcp.json` está configurado para se conectar ao N8n local em:
- **URL:** `http://localhost:5678/mcp-server/http`
- **Autenticação:** Bearer Token (precisa ser atualizado)

## Como Reiniciar o N8n com MCP

1. **Parar a instância atual do N8n:**
   ```bash
   # Encontre o processo
   ps aux | grep n8n
   
   # Mate o processo (use o PID correto)
   kill -9 <PID>
   ```

2. **Iniciar N8n com as configurações do projeto:**
   ```bash
   cd /home/bruno_vieira/projects/gh/teams-n8n
   n8n start
   ```

3. **Recarregar o VS Code:**
   - Pressione `Ctrl+Shift+P`
   - Digite "Reload Window"
   - Pressione Enter

## Configuração MCP

O arquivo `.vscode/mcp.json` está configurado para se conectar ao N8n local em:
- **URL:** `http://localhost:5678/mcp-server/http`
- **Autenticação:** Bearer Token (configurado)

## Variáveis de Ambiente

As variáveis de ambiente estão configuradas no arquivo `.env`:
- `N8N_PORT`: 5678
- `N8N_MCP_ENABLED`: true
- `N8N_API_KEY`: [token configurado]

## Próximos Passos

Após reiniciar o N8n e recarregar o VS Code, você poderá:
- Usar comandos MCP direto no Copilot
- Criar e gerenciar workflows do N8n
- Executar automações
