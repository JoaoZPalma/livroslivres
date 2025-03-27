#!/bin/bash

# JSON Product Appender Script
# Appends new products to productos.json file

PRODUTOS_FILE="/home/palma/livroslivres/src/data/produtos.json"
TEMP_FILE="temp.json"

# Check if file exists, if not create with empty array
if [ ! -f "$PRODUTOS_FILE" ]; then
	echo "[]" >"$PRODUTOS_FILE"
fi

# Get current highest ID
current_max_id=$(jq '[.[].id] | max' "$PRODUTOS_FILE" 2>/dev/null || echo 0)
new_id=$((current_max_id + 1))

# Get user input
read -p "Enter nome: " nome
read -p "Enter preco: " preco
read -p "Enter descricao: " descricao
read -p "Enter estado (1 for available, 0 for unavailable): " estado

# Handle images array
imagens=()
echo "Enter image paths (one per line, empty to finish):"
while true; do
	read -p "> " image
	if [ -z "$image" ]; then
		break
	fi
	imagens+=("\"$image\"")
done

# Create images array string
if [ ${#imagens[@]} -eq 0 ]; then
	imagens_json="[]"
else
	imagens_json=$(
		IFS=,
		echo "[${imagens[*]}]"
	)
fi

# Create new entry JSON
new_entry=$(jq -n \
	--argjson id "$new_id" \
	--arg nome "$nome" \
	--arg preco "$preco" \
	--arg descricao "$descricao" \
	--argjson estado "$estado" \
	--argjson imagens "$imagens_json" \
	'{id: $id, nome: $nome, preco: $preco, descricao: $descricao, imagens: $imagens, estado: $estado}')

# Append to file
jq ". += [$new_entry]" "$PRODUTOS_FILE" >"$TEMP_FILE" && mv "$TEMP_FILE" "$PRODUTOS_FILE"

echo "Novo produto criado com o ID $new_id em $PRODUTOS_FILE"
