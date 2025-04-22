#!/system/bin/sh

LOGFILE=/sdcard/charging_log.txt
INTERVAL=5  # dalam detik

echo "=== Charging Log Start ===" >> $LOGFILE
echo "Time | Temp(°C) | Status | Current(mA) | Voltage(mV)" >> $LOGFILE
echo "----------------------------------------------" >> $LOGFILE

while true; do
    TIME=$(date +"%H:%M:%S")
    
    TEMP_RAW=$(cat /sys/class/power_supply/battery/temp 2>/dev/null)
    TEMP=$(expr $TEMP_RAW / 10)
    
    STATUS=$(cat /sys/class/power_supply/battery/status 2>/dev/null)
    
    CURRENT_RAW=$(cat /sys/class/power_supply/battery/current_now 2>/dev/null)
    CURRENT=$(expr $CURRENT_RAW / 1000) # µA to mA
    
    VOLTAGE_RAW=$(cat /sys/class/power_supply/battery/voltage_now 2>/dev/null)
    VOLTAGE=$(expr $VOLTAGE_RAW / 1000) # µV to mV

    echo "$TIME | $TEMP°C | $STATUS | $CURRENT mA | $VOLTAGE mV" >> $LOGFILE

    sleep $INTERVAL
done
