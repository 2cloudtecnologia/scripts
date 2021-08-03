#!/bin/bash
CPU=$(cat /proc/cpuinfo | grep processor | wc -l)
MEMORIA=$(free -h | awk 'NR==2{print $2}')

echo ""
echo "--- Script para verificar recursos em Linux ---"
echo ""
echo "Quantidade de CPU: $CPU"
echo "Quantidade de memória: $MEMORIA"
echo ""
echo ""
