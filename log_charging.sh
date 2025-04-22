#!/system/bin/sh

LOGFILE=/sdcard/charging_log.txt
INTERVAL=5  # dalam detik

# Fungsi untuk menampilkan menu utama
show_menu() {
    clear
    echo "==============================="
    echo "  Skrip Log Pengisian Cepat   "
    echo "==============================="
    echo "1. Mulai Mencatat Log Pengisian"
    echo "2. Tampilkan Log Pengisian"
    echo "3. Keluar"
    echo -n "Pilih pilihan (1/2/3): "
}

# Fungsi untuk mulai mencatat log pengisian
start_logging() {
    echo "=== Charging Log Start ===" >> $LOGFILE
    echo "Time | Temp(°C) | Status | Current(mA) | Voltage(mV)" >> $LOGFILE
    echo "----------------------------------------------" >> $LOGFILE
    echo "Mencatat log pengisian, tekan Ctrl+C untuk berhenti..."
    while true; do
        TIME=$(date +"%H:%M:%S")

        TEMP_RAW=$(cat /sys/class/power_supply/battery/temp 2>/dev/null)
        CURRENT_RAW=$(cat /sys/class/power_supply/battery/current_now 2>/dev/null)
        VOLTAGE_RAW=$(cat /sys/class/power_supply/battery/voltage_now 2>/dev/null)
        STATUS=$(cat /sys/class/power_supply/battery/status 2>/dev/null)

        # Handle nilai kosong agar tidak error saat dibagi
        TEMP=$(( ${TEMP_RAW:-0} / 10 ))
        CURRENT=$(( ${CURRENT_RAW:-0} / 1000 ))
        VOLTAGE=$(( ${VOLTAGE_RAW:-0} / 1000 ))

        echo "$TIME | ${TEMP}°C | $STATUS | ${CURRENT} mA | ${VOLTAGE} mV" >> $LOGFILE
        sleep $INTERVAL
    done
}

# Fungsi untuk menampilkan log pengisian
view_log() {
    if [ -f "$LOGFILE" ]; then
        echo "Menampilkan log pengisian..."
        cat "$LOGFILE"
    else
        echo "File log tidak ditemukan!"
    fi
    echo "Tekan Enter untuk kembali ke menu utama."
    read -r
}

# Fungsi utama untuk mengelola pilihan
while true; do
    show_menu
    read -r pilihan
    case $pilihan in
        1) start_logging ;;
        2) view_log ;;
        3) echo "Keluar dari program. Terima kasih!"; exit 0 ;;
        *) echo "Pilihan tidak valid. Harap pilih 1, 2, atau 3."; sleep 2 ;;
    esac
done
