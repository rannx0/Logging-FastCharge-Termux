# Log Fast Charging Via Termux

Ini adalah skrip shell yang dirancang untuk mencatat status pengisian daya perangkat Anda. Skrip ini mengumpulkan informasi penting tentang proses pengisian baterai, seperti suhu, status, arus, dan tegangan, lalu menyimpannya dalam file log untuk pemantauan dan analisis.

## Fitur

- Mencatat data pengisian setiap 5 detik
- Mengumpulkan informasi berikut:
  - **Waktu**: Timestamp dari entri log
  - **Suhu**: Suhu saat ini dari baterai dalam °C
  - **Status**: Status pengisian saat ini (Mengisi, Penuh, dll.)
  - **Arus**: Arus pengisian dalam mA (miliampere)
  - **Tegangan**: Tegangan saat ini dari baterai dalam mV (millivolt)

## Cara Penggunaan
- git clone https://github.com/rannx0/Logging-FastCharge-Termux.git
- cd Logging-FastCharge-Termux
- chmod +x fast_charging_log.sh
- ./fast_charging_log.sh

---

## Lisensi

Proyek ini dilisensikan di bawah **Lisensi MIT** - lihat file [LICENSE](LICENSE) untuk detail lebih lanjut.

---

© 2025 RannX0. Semua hak dilindungi.
