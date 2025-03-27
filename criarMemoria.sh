#!/bin/bash

# JSON Memory Appender Script
# Appends new memories to memorias.json file

MEMORIAS_FILE="/home/palma/livroslivres/src/data/memorias.json"
TEMP_FILE="temp.json"

# Check if file exists, if not create with empty array
if [ ! -f "$MEMORIAS_FILE" ]; then
	echo "[]" >"$MEMORIAS_FILE"
fi

# Get current highest ID
current_max_id=$(jq '[.[].id] | max' "$MEMORIAS_FILE" 2>/dev/null || echo 0)
new_id=$((current_max_id + 1))

# Get user input
read -p "Enter titulo: " titulo
read -p "Enter descricao: " descricao
read -p "Enter data (DD-MM-YYYY, leave empty for today): " data
if [ -z "$data" ]; then
	data=$(date +'%d-%m-%Y')
fi

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
	--arg titulo "$titulo" \
	--arg descricao "$descricao" \
	--argjson imagens "$imagens_json" \
	--arg data "$data" \
	'{id: $id, titulo: $titulo, descricao: $descricao, imagens: $imagens, data: $data}')

# Append to file
jq ". += [$new_entry]" "$MEMORIAS_FILE" >"$TEMP_FILE" && mv "$TEMP_FILE" "$MEMORIAS_FILE"

echo "Nova memoria criada com o ID $new_id para $MEMORIAS_FILE"
