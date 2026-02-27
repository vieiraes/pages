#!/bin/bash

# Script para testar a conexão MCP com o N8n

echo "🔍 Testando conexão MCP com N8n..."
echo ""

# Verifica se o N8n está rodando
echo "1. Verificando se o N8n está rodando..."
if curl -s http://localhost:5678/healthz | grep -q "ok"; then
    echo "   ✅ N8n está online"
else
    echo "   ❌ N8n não está respondendo"
    exit 1
fi

echo ""
echo "2. Testando endpoint MCP..."

# Lê o token do arquivo mcp.json
TOKEN=$(grep -A 1 "authorization:Bearer" .vscode/mcp.json | grep "Bearer" | sed 's/.*Bearer \(.*\)".*/\1/')

if [ -z "$TOKEN" ]; then
    echo "   ❌ Token não encontrado no mcp.json"
    exit 1
fi

echo "   Token encontrado: ${TOKEN:0:20}..."
echo ""

# Testa o endpoint MCP
echo "3. Fazendo requisição ao endpoint MCP..."
RESPONSE=$(curl -s http://localhost:5678/mcp-server/http \
  -H "authorization: Bearer $TOKEN" \
  -H "Content-Type: application/json" \
  -d '{"method":"tools/list"}')

echo ""
echo "Resposta:"
echo "$RESPONSE" | jq . 2>/dev/null || echo "$RESPONSE"

echo ""
if echo "$RESPONSE" | grep -q "Unauthorized"; then
    echo "⚠️  Token inválido! Veja GET_TOKEN.md para obter um novo token"
    exit 1
elif echo "$RESPONSE" | grep -q "tools"; then
    echo "✅ MCP funcionando perfeitamente!"
    exit 0
else
    echo "⚠️  Resposta inesperada"
    exit 1
fi
