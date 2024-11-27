-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 27 Nov 2024 pada 15.09
-- Versi server: 10.4.32-MariaDB
-- Versi PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `webspp`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `admin`
--

CREATE TABLE `admin` (
  `id_admin` int(11) NOT NULL,
  `nama_admin` varchar(50) NOT NULL,
  `user_admin` varchar(50) NOT NULL,
  `pass_admin` varchar(50) NOT NULL,
  `level` enum('admin','user') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `admin`
--

INSERT INTO `admin` (`id_admin`, `nama_admin`, `user_admin`, `pass_admin`, `level`) VALUES
(5, 'Siti Fatimah', 'siti', 'admin', 'admin');

-- --------------------------------------------------------

--
-- Struktur dari tabel `angkatan`
--

CREATE TABLE `angkatan` (
  `id_angkatan` int(11) NOT NULL,
  `nama_angkatan` varchar(50) NOT NULL,
  `biaya` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `angkatan`
--

INSERT INTO `angkatan` (`id_angkatan`, `nama_angkatan`, `biaya`) VALUES
(4, '2020/2021', '250000'),
(5, '2021/2022', '275000'),
(6, '2022/2023', '300000');

-- --------------------------------------------------------

--
-- Struktur dari tabel `jurusan`
--

CREATE TABLE `jurusan` (
  `id_jurusan` int(11) NOT NULL,
  `nama_jurusan` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `jurusan`
--

INSERT INTO `jurusan` (`id_jurusan`, `nama_jurusan`) VALUES
(1, 'Multimedia'),
(2, 'Akuntansi Keuangan Dan Lembaga'),
(4, 'Rekayasa Perangkat Lunak');

-- --------------------------------------------------------

--
-- Struktur dari tabel `kelas`
--

CREATE TABLE `kelas` (
  `id_kelas` int(11) NOT NULL,
  `nama_kelas` varchar(50) NOT NULL,
  `kelas` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `kelas`
--

INSERT INTO `kelas` (`id_kelas`, `nama_kelas`, `kelas`) VALUES
(1, 'X AKL 1', 10),
(5, 'X AKL 2', 10),
(6, 'X MM 1', 10),
(7, 'X MM 2', 10),
(8, 'XI AKL 1 ', 11),
(9, 'XI AKL 2', 11),
(10, 'XI MM 1', 11),
(11, 'XI MM 2', 11),
(12, 'XII AKL 1', 12),
(13, 'XII AKL 2', 12),
(14, 'XII MM 1', 12),
(15, 'XII MM 2', 12),
(16, 'X PPLG', 10),
(17, 'XI PPLG', 11),
(18, 'XII RPL', 12);

-- --------------------------------------------------------

--
-- Struktur dari tabel `kepala_sekolah`
--

CREATE TABLE `kepala_sekolah` (
  `id_kepsek` int(11) NOT NULL,
  `nama_kepsek` varchar(50) NOT NULL,
  `periode` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `pembayaran`
--

CREATE TABLE `pembayaran` (
  `idspp` int(11) NOT NULL,
  `id_siswa` int(11) NOT NULL,
  `jatuhtempo` varchar(50) NOT NULL,
  `bulan` varchar(50) NOT NULL,
  `nobayar` varchar(50) NOT NULL,
  `tglbayar` varchar(50) NOT NULL,
  `jumlah` varchar(50) NOT NULL,
  `ket` varchar(50) DEFAULT NULL,
  `id_admin` int(11) NOT NULL,
  `tahun` int(4) NOT NULL,
  `kelas` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `pembayaran`
--

INSERT INTO `pembayaran` (`idspp`, `id_siswa`, `jatuhtempo`, `bulan`, `nobayar`, `tglbayar`, `jumlah`, `ket`, `id_admin`, `tahun`, `kelas`) VALUES
(133, 11, '2021', 'Juli 2021', '', '', '275000', 'BELUM DIBAYAR', 0, 2021, 11),
(134, 11, '2021', 'Agustus 2021', '', '', '275000', 'BELUM DIBAYAR', 0, 2021, 11),
(135, 11, '2021', 'September 2021', '', '', '275000', 'BELUM DIBAYAR', 0, 2021, 11),
(136, 11, '2021', 'Oktober 2021', '', '', '275000', 'BELUM DIBAYAR', 0, 2021, 11),
(137, 11, '2021', 'November 2021', '', '', '275000', 'BELUM DIBAYAR', 0, 2021, 11),
(138, 11, '2021', 'Desember 2021', '', '', '275000', 'BELUM DIBAYAR', 0, 2021, 11),
(139, 11, '2022', 'Januari 2022', '', '', '275000', 'BELUM DIBAYAR', 0, 2021, 11),
(140, 11, '2022', 'Februari 2022', '', '', '275000', 'BELUM DIBAYAR', 0, 2021, 11),
(141, 11, '2022', 'Maret 2022', '', '', '275000', 'BELUM DIBAYAR', 0, 2021, 11),
(142, 11, '2022', 'April 2022', '', '', '275000', 'BELUM DIBAYAR', 0, 2021, 11),
(143, 11, '2022', 'Mei 2022', '', '', '275000', 'BELUM DIBAYAR', 0, 2021, 11),
(144, 11, '2022', 'Juni 2022', '', '', '275000', 'BELUM DIBAYAR', 0, 2021, 11),
(169, 14, '2020', 'Juli 2020', '', '', '250000', 'BELUM DIBAYAR', 0, 2020, 12),
(170, 14, '2020', 'Agustus 2020', '', '', '250000', 'BELUM DIBAYAR', 0, 2020, 12),
(171, 14, '2020', 'September 2020', '', '', '250000', 'BELUM DIBAYAR', 0, 2020, 12),
(172, 14, '2020', 'Oktober 2020', '', '', '250000', 'BELUM DIBAYAR', 0, 2020, 12),
(173, 14, '2020', 'November 2020', '', '', '250000', 'BELUM DIBAYAR', 0, 2020, 12),
(174, 14, '2020', 'Desember 2020', '', '', '250000', 'BELUM DIBAYAR', 0, 2020, 12),
(175, 14, '2021', 'Januari 2021', '', '', '250000', 'BELUM DIBAYAR', 0, 2020, 12),
(176, 14, '2021', 'Februari 2021', '', '', '250000', 'BELUM DIBAYAR', 0, 2020, 12),
(177, 14, '2021', 'Maret 2021', '', '', '250000', 'BELUM DIBAYAR', 0, 2020, 12),
(178, 14, '2021', 'April 2021', '', '', '250000', 'BELUM DIBAYAR', 0, 2020, 12),
(179, 14, '2021', 'Mei 2021', '', '', '250000', 'BELUM DIBAYAR', 0, 2020, 12),
(180, 14, '2021', 'Juni 2021', '', '', '250000', 'BELUM DIBAYAR', 0, 2020, 12);

-- --------------------------------------------------------

--
-- Struktur dari tabel `pengeluaran`
--

CREATE TABLE `pengeluaran` (
  `id_pengeluaran` int(11) NOT NULL,
  `id_admin` int(11) NOT NULL,
  `keterangan` varchar(50) NOT NULL,
  `pembayaran` enum('lunas','belum bayar') NOT NULL,
  `total` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `siswa`
--

CREATE TABLE `siswa` (
  `id_siswa` int(11) NOT NULL,
  `nisn` varchar(50) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `id_angkatan` varchar(50) NOT NULL,
  `id_jurusan` int(11) NOT NULL,
  `id_kelas` int(11) NOT NULL,
  `alamat` text NOT NULL,
  `jenis_kelamin` enum('laki-laki','perempuan') NOT NULL,
  `ttl` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `siswa`
--

INSERT INTO `siswa` (`id_siswa`, `nisn`, `nama`, `id_angkatan`, `id_jurusan`, `id_kelas`, `alamat`, `jenis_kelamin`, `ttl`) VALUES
(14, '20241123100453', 'Muhammad Gilang Hamdani', '2020/2021', 4, 18, 'Mawar\r\n', 'laki-laki', 'Jakarta, 17-01-2007');

-- --------------------------------------------------------

--
-- Struktur dari tabel `siswatemp`
--

CREATE TABLE `siswatemp` (
  `nisn` varchar(25) NOT NULL,
  `kls10` varchar(10) NOT NULL,
  `kls11` varchar(10) NOT NULL,
  `kls12` varchar(10) NOT NULL,
  `tahun` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `siswatemp`
--

INSERT INTO `siswatemp` (`nisn`, `kls10`, `kls11`, `kls12`, `tahun`) VALUES
('20220801113335', 'X AKL 2', '', '', '2020/2021'),
('20220801113359', '', 'XI MM 2', 'XII MM 1', '2020/2021'),
('20220801115635', '', '', 'XII MM 1', '2021/2022'),
('20241119042343', '', '', 'XII MM 1', '2021/2022'),
('20241119043449', '', '', 'XII RPL', '2022/2023'),
('20241119043714', '', '', 'XII RPL', '2022/2023'),
('20241119044342', '', '', 'XII RPL', '2022/2023'),
('20241120094009', 'X AKL 1', '', '', '2020/2021'),
('20241120110155', 'X PPLG', '', '', '2020/2021'),
('20241120164252', '', 'XI PPLG', '', '2021/2022'),
('20241123100453', '', '', 'XII RPL', '2020/2021');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id_admin`);

--
-- Indeks untuk tabel `angkatan`
--
ALTER TABLE `angkatan`
  ADD PRIMARY KEY (`id_angkatan`);

--
-- Indeks untuk tabel `jurusan`
--
ALTER TABLE `jurusan`
  ADD PRIMARY KEY (`id_jurusan`);

--
-- Indeks untuk tabel `kelas`
--
ALTER TABLE `kelas`
  ADD PRIMARY KEY (`id_kelas`);

--
-- Indeks untuk tabel `pembayaran`
--
ALTER TABLE `pembayaran`
  ADD PRIMARY KEY (`idspp`);

--
-- Indeks untuk tabel `pengeluaran`
--
ALTER TABLE `pengeluaran`
  ADD PRIMARY KEY (`id_pengeluaran`);

--
-- Indeks untuk tabel `siswa`
--
ALTER TABLE `siswa`
  ADD PRIMARY KEY (`id_siswa`);

--
-- Indeks untuk tabel `siswatemp`
--
ALTER TABLE `siswatemp`
  ADD PRIMARY KEY (`nisn`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `admin`
--
ALTER TABLE `admin`
  MODIFY `id_admin` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT untuk tabel `angkatan`
--
ALTER TABLE `angkatan`
  MODIFY `id_angkatan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT untuk tabel `jurusan`
--
ALTER TABLE `jurusan`
  MODIFY `id_jurusan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `kelas`
--
ALTER TABLE `kelas`
  MODIFY `id_kelas` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT untuk tabel `pembayaran`
--
ALTER TABLE `pembayaran`
  MODIFY `idspp` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=181;

--
-- AUTO_INCREMENT untuk tabel `pengeluaran`
--
ALTER TABLE `pengeluaran`
  MODIFY `id_pengeluaran` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `siswa`
--
ALTER TABLE `siswa`
  MODIFY `id_siswa` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
