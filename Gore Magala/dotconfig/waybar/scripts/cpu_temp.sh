#!/bin/bash

# Pega a temperatura do sensor k10temp
temp=$(sensors | awk '/Tctl:/ {gsub(/\+|°C/,"",$2); print $2; exit}')

# Define classe conforme a temperatura
if (( $(echo "$temp >= 80" | bc -l) )); then
    class="critical"
elif (( $(echo "$temp >= 60" | bc -l) )); then
    class="warning"
else
    class="normal"
fi

# Retorna JSON pro Waybar
echo "{\"text\": \" ${temp}°C\", \"class\": \"$class\"}"

