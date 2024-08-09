#!/bin/bash
# Verifica se o argumento foi passado
if [ $# -eq 0 ]; then
   echo "Uso: $0 <URL>"
   exit 1
fi
# Função para extrair título do site
extract_title() {
   curl -s "$1" | grep -o "<title>[^<]*" | sed -e 's/<title>//'
}
# Função para extrair servidor web
extract_server() {
   curl -sI "$1" | grep -i "^Server:" | awk '{print $2}'
}
# Função para extrair linguagem de programação
extract_language() {
   curl -s "$1" | grep -i -o "x-powered-by:.*" | cut -d ":" -f2
}
# Função para extrair todas as URLs do site
extract_urls() {
   curl -s "$1" | grep -o 'href="[^"]*"' | cut -d'"' -f2
}
# Função para extrair formulários e inputs de texto
extract_forms() {
   curl -s "$1" | grep -Eo '<form[^>]*>' | grep -o 'action="[^"]*"' | cut -d'"' -f2
   curl -s "$1" | grep -Eo '<input[^>]*>'
}
# URL a ser testada
URL="$1"
# Parte 1: Extrair informações
echo "Parte 1:"
echo "Título do site: $(extract_title $URL)"
echo "Servidor web: $(extract_server $URL)"
echo "Linguagem de programação: $(extract_language $URL)"
echo
# Parte 2: Extrair URLs, formulários e inputs de texto
echo "Parte 2:"
echo "Todas as URLs do site:"
extract_urls $URL
echo
echo "Formulários e inputs de texto:"
extract_forms $URL
