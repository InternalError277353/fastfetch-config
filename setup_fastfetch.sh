#!/bin/bash

REPO_URL="https://github.com/InternalError277353/fastfetch-config.git"
LOCAL_REPO="$HOME/fastfetch-config"
CONFIG_DIR="$HOME/.config/fastfetch"
CONFIG_FILE="config.jsonc"
IMAGE_REL_PATH="Dorothyhaze.png"  # ruta relativa dentro del repo para la imagen
IMAGE_DEST="$HOME/Imágenes/imagenes/fastfetch"

echo "🔄 Iniciando setup Fastfetch..."

# Clonar repo si no existe
if [ ! -d "$LOCAL_REPO" ]; then
  echo "📥 Clonando repo..."
  git clone "$REPO_URL" "$LOCAL_REPO" || { echo "Error clonando repo"; exit 1; }
else
  echo "✅ Repo ya clonado"
fi

# Crear carpeta config si no existe
mkdir -p "$CONFIG_DIR"

# Copiar config JSONC
echo "📋 Copiando config.jsonc..."
cp "$LOCAL_REPO/$CONFIG_FILE" "$CONFIG_DIR/" || { echo "Error copiando config"; exit 1; }

# Crear carpeta para imagen si no existe
mkdir -p "$IMAGE_DEST"

# Copiar imagen
echo "🖼️ Copiando imagen..."
cp "$LOCAL_REPO/$IMAGE_REL_PATH" "$IMAGE_DEST/" || { echo "Error copiando imagen"; exit 1; }

echo "🎉 Setup terminado. Ya puedes usar fastfetch con tu configuración."

