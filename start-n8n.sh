#!/bin/bash

# Script para reiniciar N8n com configurações MCP

echo "🔍 Verificando processos N8n em execução..."
N8N_PID=$(ps aux | grep "node /usr/local/bin/n8n" | grep -v grep | awk '{print $2}')

if [ ! -z "$N8N_PID" ]; then
    echo "⚠️  N8n já está rodando (PID: $N8N_PID)"
    echo "   Para parar, execute: kill $N8N_PID"
    echo "   Ou execute: pkill -f 'node /usr/local/bin/n8n'"
    exit 1
fi

echo "🚀 Iniciando N8n com configurações MCP..."
cd "$(dirname "$0")"

# Carrega variáveis do .env se existir
if [ -f .env ]; then
    export $(cat .env | grep -v '^#' | xargs)
    echo "✅ Variáveis de ambiente carregadas"
fi

echo "🌐 N8n será iniciado em: http://localhost:${N8N_PORT:-5678}"
echo ""

# Inicia N8n
n8n start
