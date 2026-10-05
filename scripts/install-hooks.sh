#!/usr/bin/env bash
set -euo pipefail

echo "🔧 Instalando git hooks locales en orquestador raíz, citas-api y citas-web..."

chmod +x .githooks/pre-commit || true
git config core.hooksPath .githooks

if [ -d "citas-api/.githooks" ]; then
    chmod +x citas-api/.githooks/pre-commit || true
    git -C citas-api config core.hooksPath .githooks
fi

if [ -d "citas-web/.githooks" ]; then
    chmod +x citas-web/.githooks/pre-commit || true
    git -C citas-web config core.hooksPath .githooks
fi

echo "✅ Hooks configurados correctamente."
