#!/bin/bash

APPS_FILE="apps.txt"
DELAY=2

echo "========================================="
echo "    UYGULAMA BAÞLATICI"
echo "========================================="
echo ""

if [ ! -f "$APPS_FILE" ]; then
    echo "HATA: apps.txt dosyasý bulunamadý!"
    exit 1
fi

echo "Uygulamalar:"
cat "$APPS_FILE" | nl
echo ""

read -p "Baþlatma aralýðýný girin (saniye) [varsayýlan 2]: " input_delay

if [ -z "$input_delay" ]; then
    DELAY=2
elif [[ "$input_delay" =~ ^[0-9]+$ ]]; then
    DELAY=$input_delay
else
    DELAY=2
fi

echo ""
read -p "Baþlatmak için (e/H): " confirm

if [[ "$confirm" != "e" && "$confirm" != "E" ]]; then
    echo "Ýptal edildi."
    exit 0
fi

echo ""
echo "Baþlatýlýyor..."
echo ""

count=1
while IFS= read -r app; do
    [ -z "$app" ] && continue
    
    win_path=$(echo "$app" | sed 's|/c/|C:\\|g' | sed 's|/|\\|g')
    
    echo "[$count] Açýlýyor: $win_path"
    powershell.exe -Command "Start-Process '$win_path'" &
    echo "OK"
    
    sleep "$DELAY"
    
    ((count++))
done < "$APPS_FILE"

echo ""
echo "? Tüm uygulamalar baþlatýldý!"