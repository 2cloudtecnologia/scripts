#!/bin/bash
for CPU_DIR in /sys/devices/system/cpu/cpu[0-9]*
do
    CPU=${CPU_DIR##*/}
    echo "Encontrado CPU: '${CPU_DIR}' ..."
    CPU_STATE_FILE="${CPU_DIR}/online"
    if [ -f "${CPU_STATE_FILE}" ]; then
        if grep -qx 1 "${CPU_STATE_FILE}"; then
            echo -e "\t${CPU} já está online"
        else
            echo -e "\t${CPU} nova CPU, colocando como online ..."
            echo 1 > "${CPU_STATE_FILE}"
        fi
    else
        echo -e "\t${CPU} já configurado para hot-add"
    fi
done

# Bring all new Memory online
for RAM in $(grep line /sys/devices/system/memory/*/state)
do
    echo "Encontrada RAM: ${RAM} ..."
    if [[ "${RAM}" == *":offline" ]]; then
        echo "Colocando como online"
        echo $RAM | sed "s/:offline$//"|sed "s/^/echo online > /"|source /dev/stdin
    else
        echo "Já está online"
    fi
done
echo ""
echo ""
echo "--------> Tudo pronto! <--------"
