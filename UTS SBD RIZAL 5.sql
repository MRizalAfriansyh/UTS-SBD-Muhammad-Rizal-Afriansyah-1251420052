
INSERT INTO Hotel VALUES ('H101', 'Grand Hyatt', 'Jakarta');

INSERT INTO Guest VALUES ('G001', 'Budi Santoso', 'Jl. Sudirman No. 12, Jakarta');
INSERT INTO Guest VALUES ('G002', 'Siti Aminah', 'Jl. Gatot Subroto No. 45, Jakarta');

INSERT INTO Room VALUES (15, 'H101', 'Double', 75.00);

-- Catatan: Pastikan tanggal di bawah ini adalah tanggal di MASA DEPAN (setelah CURRENT_DATE)
INSERT INTO Booking VALUES ('H101', 'G001', '2026-11-01', '2026-11-05', 15);
