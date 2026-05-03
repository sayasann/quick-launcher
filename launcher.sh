#!/bin/bash

APPS_FILE="apps.txt"
PROJECTS_DIR="$USERPROFILE\\IdeaProjects"
IDEA="C:\\Program Files\\JetBrains\\IntelliJ IDEA 2024.1\\bin\\idea64.exe"
DELAY=2

echo "========================================="
echo "    ANA MENU"
echo "========================================="
echo ""
echo "[1] Uygulamalari Baslat"
echo "[2] IntelliJ Proje Ac"
echo ""
read -p "Secim yap: " menu


if [[ "$menu" == "1" ]]; then

    echo ""
    echo "========================================="
    echo "    UYGULAMA BASLATICI"
    echo "========================================="
    echo ""

    if [ ! -f "$APPS_FILE" ]; then
        echo "HATA: apps.txt dosyasi bulunamadi!"
        exit 1
    fi

    echo "Uygulamalar:"
    cat "$APPS_FILE" | nl
    echo ""

    read -p "Baslatma araligini girin (saniye) [varsayilan 2]: " input_delay

    if [ -z "$input_delay" ]; then
        DELAY=2
    elif [[ "$input_delay" =~ ^[0-9]+$ ]]; then
        DELAY=$input_delay
    else
        DELAY=2
    fi

    echo ""
    read -p "Baslatmak icin (e/H): " confirm

    if [[ "$confirm" != "e" && "$confirm" != "E" ]]; then
        echo "Ýptal edildi."
        exit 0
    fi

    echo ""
    echo "Baslatiliyor..."
    echo ""

    count=1
    while IFS= read -r app; do
        [ -z "$app" ] && continue

        win_path=$(echo "$app" | sed 's|/c/|C:\\|g' | sed 's|/|\\|g')

        echo "[$count] Aciliyor: $win_path"
        powershell.exe -Command "Start-Process '$win_path'" &
        echo "OK"

        sleep "$DELAY"

        ((count++))
    done < "$APPS_FILE"

    echo ""
    echo "? Tum uygulamalar baslatildi!"


elif [[ "$menu" == "2" ]]; then

    echo ""
    echo "========================================="
    echo "    INTELLIJ PROJE BASLATICI"
    echo "========================================="
    echo ""

    projects=()
    i=1

    for dir in "$PROJECTS_DIR"/*/; do
        name=$(basename "$dir")
        projects+=("$name")
        echo "[$i] $name"
        ((i++))
    done

    echo ""
    echo "[Y] Yeni Proje (Spring Initializr)"
    echo ""
    read -p "Secim yap: " choice

    if [[ "$choice" == "Y" || "$choice" == "y" ]]; then
        echo ""
        echo "Spring Initializr aciliyor..."
        start "https://start.spring.io"
        echo "? Tarayici acildi!"

    elif [[ "$choice" =~ ^[0-9]+$ ]] && [ "$choice" -ge 1 ] && [ "$choice" -le "${#projects[@]}" ]; then
        selected="${projects[$((choice-1))]}"
        echo ""
        echo "?? $selected aciliyor..."
        powershell.exe -Command "Start-Process '${IDEA}' -ArgumentList '${PROJECTS_DIR}\\${selected}'"
        echo "? IntelliJ baslatildi!"

    else
        echo "? Gecersiz secim!"
    fi

else
    echo "? Gecersiz secim!"
fi