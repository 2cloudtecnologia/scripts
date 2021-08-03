#!/bin/bash
CPU=$(cat /proc/cpuinfo | grep processor | wc -l)
MEMORIA=$(free -h | awk 'NR==2{print $2}')

echo "Quantidade de CPU: $CPU"
echo "Quantidade de memória: $MEMORIA"
