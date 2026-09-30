#!/usr/bin/env bash
# Lager index.html (komplett HTML-dokument for GitHub Pages) fra passkey-skolen.html
set -euo pipefail
cd "$(dirname "$0")"
{
  cat <<'HEAD'
<!doctype html>
<html lang="nb">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, viewport-fit=cover">
<meta name="description" content="Interaktivt kurs om passkeys for Windows 11-brukere i Microsoft 365.">
<style>:root{color-scheme:light}body{margin:0}img{max-width:100%}[hidden]{display:none!important}</style>
HEAD
  sed -n '1,/^<\/style>$/p' passkey-skolen.html
  echo '</head>'
  echo '<body>'
  sed -n '/^<\/style>$/,$p' passkey-skolen.html | tail -n +2
  echo '</body>'
  echo '</html>'
} > index.html
