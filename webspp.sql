-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 30 Nov 2024 pada 10.35
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
(2, 'Akuntansi dan Keuangan Lembaga'),
(4, 'Rekayasa Perangkat Lunak');

-- --------------------------------------------------------

--
-- Struktur dari tabel `kelas`
--

CREATE TABLE `kelas` (
  `id_kelas` int(11) NOT NULL,
  `nama_kelas` varchar(50) NOT NULL,
  `kelas` int(2) NOT NULL,
  `nama_jurusan` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `kelas`
--

INSERT INTO `kelas` (`id_kelas`, `nama_kelas`, `kelas`, `nama_jurusan`) VALUES
(1, 'X AKL 1', 10, 'Akutansi dan Keuangan Lembaga'),
(5, 'X AKL 2', 10, 'Akutansi dan Keuangan Lembaga'),
(6, 'X MM 1', 10, 'Multimedia'),
(7, 'X MM 2', 10, 'Multimedia'),
(8, 'XI AKL 1 ', 11, 'Akutansi dan Keuangan Lembaga'),
(9, 'XI AKL 2', 11, 'Akutansi dan Keuangan Lembaga'),
(10, 'XI MM 1', 11, 'Multimedia'),
(11, 'XI MM 2', 11, 'Multimedia'),
(12, 'XII AKL 1', 12, 'Akutansi dan Keuangan Lembaga'),
(13, 'XII AKL 2', 12, 'Akutansi dan Keuangan Lembaga'),
(14, 'XII MM 1', 12, 'Multimedia'),
(15, 'XII MM 2', 12, 'Multimedia'),
(16, 'X PPLG', 10, 'Rekayasa Perangkat Lunak'),
(17, 'XI PPLG', 11, 'Rekayasa Perangkat Lunak'),
(18, 'XII RPL', 12, 'Rekayasa Perangkat Lunak');

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
  `nisn` varchar(50) NOT NULL,
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

INSERT INTO `pembayaran` (`idspp`, `nisn`, `bulan`, `nobayar`, `tglbayar`, `jumlah`, `ket`, `id_admin`, `tahun`, `kelas`) VALUES
(133, '11', 'Juli 2021', '', '', '275000', 'BELUM DIBAYAR', 0, 2021, 11),
(134, '11', 'Agustus 2021', '', '', '275000', 'BELUM DIBAYAR', 0, 2021, 11),
(135, '11', 'September 2021', '', '', '275000', 'BELUM DIBAYAR', 0, 2021, 11),
(136, '11', 'Oktober 2021', '', '', '275000', 'BELUM DIBAYAR', 0, 2021, 11),
(137, '11', 'November 2021', '', '', '275000', 'BELUM DIBAYAR', 0, 2021, 11),
(138, '11', 'Desember 2021', '', '', '275000', 'BELUM DIBAYAR', 0, 2021, 11),
(139, '11', 'Januari 2022', '', '', '275000', 'BELUM DIBAYAR', 0, 2021, 11),
(140, '11', 'Februari 2022', '', '', '275000', 'BELUM DIBAYAR', 0, 2021, 11),
(141, '11', 'Maret 2022', '', '', '275000', 'BELUM DIBAYAR', 0, 2021, 11),
(142, '11', 'April 2022', '', '', '275000', 'BELUM DIBAYAR', 0, 2021, 11),
(143, '11', 'Mei 2022', '', '', '275000', 'BELUM DIBAYAR', 0, 2021, 11),
(144, '11', 'Juni 2022', '', '', '275000', 'BELUM DIBAYAR', 0, 2021, 11),
(169, '14', 'Juli 2020', '', '', '250000', 'BELUM DIBAYAR', 0, 2020, 12),
(170, '14', 'Agustus 2020', '', '', '250000', 'BELUM DIBAYAR', 0, 2020, 12),
(171, '14', 'September 2020', '', '', '250000', 'BELUM DIBAYAR', 0, 2020, 12),
(172, '14', 'Oktober 2020', '', '', '250000', 'BELUM DIBAYAR', 0, 2020, 12),
(173, '14', 'November 2020', '', '', '250000', 'BELUM DIBAYAR', 0, 2020, 12),
(174, '14', 'Desember 2020', '', '', '250000', 'BELUM DIBAYAR', 0, 2020, 12),
(175, '14', 'Januari 2021', '', '', '250000', 'BELUM DIBAYAR', 0, 2020, 12),
(176, '14', 'Februari 2021', '', '', '250000', 'BELUM DIBAYAR', 0, 2020, 12),
(177, '14', 'Maret 2021', '', '', '250000', 'BELUM DIBAYAR', 0, 2020, 12),
(178, '14', 'April 2021', '', '', '250000', 'BELUM DIBAYAR', 0, 2020, 12),
(179, '14', 'Mei 2021', '', '', '250000', 'BELUM DIBAYAR', 0, 2020, 12),
(180, '14', 'Juni 2021', '', '', '250000', 'BELUM DIBAYAR', 0, 2020, 12),
(181, '2147483647', 'Juli 2020', '', '', '250000', 'BELUM DIBAYAR', 0, 2020, 12),
(182, '2147483647', 'Agustus 2020', '', '', '250000', 'BELUM DIBAYAR', 0, 2020, 12),
(183, '2147483647', 'September 2020', '', '', '250000', 'BELUM DIBAYAR', 0, 2020, 12),
(184, '2147483647', 'Oktober 2020', '', '', '250000', 'BELUM DIBAYAR', 0, 2020, 12),
(185, '2147483647', 'November 2020', '', '', '250000', 'BELUM DIBAYAR', 0, 2020, 12),
(186, '2147483647', 'Desember 2020', '', '', '250000', 'BELUM DIBAYAR', 0, 2020, 12),
(187, '2147483647', 'Januari 2021', '', '', '250000', 'BELUM DIBAYAR', 0, 2020, 12),
(188, '2147483647', 'Februari 2021', '', '', '250000', 'BELUM DIBAYAR', 0, 2020, 12),
(189, '2147483647', 'Maret 2021', '', '', '250000', 'BELUM DIBAYAR', 0, 2020, 12),
(190, '2147483647', 'April 2021', '', '', '250000', 'BELUM DIBAYAR', 0, 2020, 12),
(191, '2147483647', 'Mei 2021', '', '', '250000', 'BELUM DIBAYAR', 0, 2020, 12),
(192, '2147483647', 'Juni 2021', '', '', '250000', 'BELUM DIBAYAR', 0, 2020, 12),
(193, '2147483647', 'Juli 2020', '', '', '250000', 'BELUM DIBAYAR', 0, 2020, 10),
(194, '2147483647', 'Agustus 2020', '', '', '250000', 'BELUM DIBAYAR', 0, 2020, 10),
(195, '2147483647', 'September 2020', '', '', '250000', 'BELUM DIBAYAR', 0, 2020, 10),
(196, '2147483647', 'Oktober 2020', '', '', '250000', 'BELUM DIBAYAR', 0, 2020, 10),
(197, '2147483647', 'November 2020', '', '', '250000', 'BELUM DIBAYAR', 0, 2020, 10),
(198, '2147483647', 'Desember 2020', '', '', '250000', 'BELUM DIBAYAR', 0, 2020, 10),
(199, '2147483647', 'Januari 2021', '', '', '250000', 'BELUM DIBAYAR', 0, 2020, 10),
(200, '2147483647', 'Februari 2021', '', '', '250000', 'BELUM DIBAYAR', 0, 2020, 10),
(201, '2147483647', 'Maret 2021', '', '', '250000', 'BELUM DIBAYAR', 0, 2020, 10),
(202, '2147483647', 'April 2021', '', '', '250000', 'BELUM DIBAYAR', 0, 2020, 10),
(203, '2147483647', 'Mei 2021', '', '', '250000', 'BELUM DIBAYAR', 0, 2020, 10),
(204, '2147483647', 'Juni 2021', '', '', '250000', 'BELUM DIBAYAR', 0, 2020, 10),
(205, '2147483647', 'Juli 2020', '', '', '', 'BELUM DIBAYAR', 0, 2020, 0),
(206, '2147483647', 'Agustus 2020', '', '', '', 'BELUM DIBAYAR', 0, 2020, 0),
(207, '2147483647', 'September 2020', '', '', '', 'BELUM DIBAYAR', 0, 2020, 0),
(208, '2147483647', 'Oktober 2020', '', '', '', 'BELUM DIBAYAR', 0, 2020, 0),
(209, '2147483647', 'November 2020', '', '', '', 'BELUM DIBAYAR', 0, 2020, 0),
(210, '2147483647', 'Desember 2020', '', '', '', 'BELUM DIBAYAR', 0, 2020, 0),
(211, '2147483647', 'Januari 2021', '', '', '', 'BELUM DIBAYAR', 0, 2021, 0),
(212, '2147483647', 'Februari 2021', '', '', '', 'BELUM DIBAYAR', 0, 2021, 0),
(213, '2147483647', 'Maret 2021', '', '', '', 'BELUM DIBAYAR', 0, 2021, 0),
(214, '2147483647', 'April 2021', '', '', '', 'BELUM DIBAYAR', 0, 2021, 0),
(215, '2147483647', 'Mei 2021', '', '', '', 'BELUM DIBAYAR', 0, 2021, 0),
(216, '2147483647', 'Juni 2021', '', '', '', 'BELUM DIBAYAR', 0, 2021, 0),
(217, '2147483647', 'Juli 2020', '', '', '250000', 'BELUM DIBAYAR', 0, 2020, 10),
(218, '2147483647', 'Agustus 2020', '', '', '250000', 'BELUM DIBAYAR', 0, 2020, 10),
(219, '2147483647', 'September 2020', '', '', '250000', 'BELUM DIBAYAR', 0, 2020, 10),
(220, '2147483647', 'Oktober 2020', '', '', '250000', 'BELUM DIBAYAR', 0, 2020, 10),
(221, '2147483647', 'November 2020', '', '', '250000', 'BELUM DIBAYAR', 0, 2020, 10),
(222, '2147483647', 'Desember 2020', '', '', '250000', 'BELUM DIBAYAR', 0, 2020, 10),
(223, '2147483647', 'Januari 2021', '', '', '250000', 'BELUM DIBAYAR', 0, 2020, 10),
(224, '2147483647', 'Februari 2021', '', '', '250000', 'BELUM DIBAYAR', 0, 2020, 10),
(225, '2147483647', 'Maret 2021', '', '', '250000', 'BELUM DIBAYAR', 0, 2020, 10),
(226, '2147483647', 'April 2021', '', '', '250000', 'BELUM DIBAYAR', 0, 2020, 10),
(227, '2147483647', 'Mei 2021', '', '', '250000', 'BELUM DIBAYAR', 0, 2020, 10),
(228, '2147483647', 'Juni 2021', '', '', '250000', 'BELUM DIBAYAR', 0, 2020, 10),
(301, '1701070004', 'Juli 2020', '281120240835553555', '2024-11-28', '250000', 'LUNAS', 5, 2020, 12),
(302, '1701070004', 'Agustus 2020', '', '', '250000', 'BELUM DIBAYAR', 0, 2020, 12),
(303, '1701070004', 'September 2020', '', '', '250000', 'BELUM DIBAYAR', 0, 2020, 12),
(304, '1701070004', 'Oktober 2020', '', '', '250000', 'BELUM DIBAYAR', 0, 2020, 12),
(305, '1701070004', 'November 2020', '', '', '250000', 'BELUM DIBAYAR', 0, 2020, 12),
(306, '1701070004', 'Desember 2020', '', '', '250000', 'BELUM DIBAYAR', 0, 2020, 12),
(307, '1701070004', 'Januari 2021', '', '', '250000', 'BELUM DIBAYAR', 0, 2020, 12),
(308, '1701070004', 'Februari 2021', '', '', '250000', 'BELUM DIBAYAR', 0, 2020, 12),
(309, '1701070004', 'Maret 2021', '', '', '250000', 'BELUM DIBAYAR', 0, 2020, 12),
(310, '1701070004', 'April 2021', '', '', '250000', 'BELUM DIBAYAR', 0, 2020, 12),
(311, '1701070004', 'Mei 2021', '', '', '250000', 'BELUM DIBAYAR', 0, 2020, 12),
(312, '1701070004', 'Juni 2021', '', '', '250000', 'BELUM DIBAYAR', 0, 2020, 12),
(313, '1702070004', 'Juli 2022', '', '', '300000', 'BELUM DIBAYAR', 0, 2022, 11),
(314, '1702070004', 'Agustus 2022', '', '', '300000', 'BELUM DIBAYAR', 0, 2022, 11),
(315, '1702070004', 'September 2022', '', '', '300000', 'BELUM DIBAYAR', 0, 2022, 11),
(316, '1702070004', 'Oktober 2022', '', '', '300000', 'BELUM DIBAYAR', 0, 2022, 11),
(317, '1702070004', 'November 2022', '', '', '300000', 'BELUM DIBAYAR', 0, 2022, 11),
(318, '1702070004', 'Desember 2022', '', '', '300000', 'BELUM DIBAYAR', 0, 2022, 11),
(319, '1702070004', 'Januari 2023', '', '', '300000', 'BELUM DIBAYAR', 0, 2022, 11),
(320, '1702070004', 'Februari 2023', '', '', '300000', 'BELUM DIBAYAR', 0, 2022, 11),
(321, '1702070004', 'Maret 2023', '', '', '300000', 'BELUM DIBAYAR', 0, 2022, 11),
(322, '1702070004', 'April 2023', '', '', '300000', 'BELUM DIBAYAR', 0, 2022, 11),
(323, '1702070004', 'Mei 2023', '', '', '300000', 'BELUM DIBAYAR', 0, 2022, 11),
(324, '1702070004', 'Juni 2023', '', '', '300000', 'BELUM DIBAYAR', 0, 2022, 11),
(325, '2020112237', 'Juli 2021', '', '', '275000', 'BELUM DIBAYAR', 0, 2021, 11),
(326, '2020112237', 'Agustus 2021', '', '', '275000', 'BELUM DIBAYAR', 0, 2021, 11),
(327, '2020112237', 'September 2021', '', '', '275000', 'BELUM DIBAYAR', 0, 2021, 11),
(328, '2020112237', 'Oktober 2021', '', '', '275000', 'BELUM DIBAYAR', 0, 2021, 11),
(329, '2020112237', 'November 2021', '', '', '275000', 'BELUM DIBAYAR', 0, 2021, 11),
(330, '2020112237', 'Desember 2021', '', '', '275000', 'BELUM DIBAYAR', 0, 2021, 11),
(331, '2020112237', 'Januari 2022', '', '', '275000', 'BELUM DIBAYAR', 0, 2021, 11),
(332, '2020112237', 'Februari 2022', '', '', '275000', 'BELUM DIBAYAR', 0, 2021, 11),
(333, '2020112237', 'Maret 2022', '', '', '275000', 'BELUM DIBAYAR', 0, 2021, 11),
(334, '2020112237', 'April 2022', '', '', '275000', 'BELUM DIBAYAR', 0, 2021, 11),
(335, '2020112237', 'Mei 2022', '', '', '275000', 'BELUM DIBAYAR', 0, 2021, 11),
(336, '2020112237', 'Juni 2022', '', '', '275000', 'BELUM DIBAYAR', 0, 2021, 11),
(337, '1701070008', 'Juli 2020', '', '', '250000', 'BELUM DIBAYAR', 0, 2020, 12),
(338, '1701070008', 'Agustus 2020', '', '', '250000', 'BELUM DIBAYAR', 0, 2020, 12),
(339, '1701070008', 'September 2020', '', '', '250000', 'BELUM DIBAYAR', 0, 2020, 12),
(340, '1701070008', 'Oktober 2020', '', '', '250000', 'BELUM DIBAYAR', 0, 2020, 12),
(341, '1701070008', 'November 2020', '', '', '250000', 'BELUM DIBAYAR', 0, 2020, 12),
(342, '1701070008', 'Desember 2020', '', '', '250000', 'BELUM DIBAYAR', 0, 2020, 12),
(343, '1701070008', 'Januari 2021', '', '', '250000', 'BELUM DIBAYAR', 0, 2020, 12),
(344, '1701070008', 'Februari 2021', '', '', '250000', 'BELUM DIBAYAR', 0, 2020, 12),
(345, '1701070008', 'Maret 2021', '', '', '250000', 'BELUM DIBAYAR', 0, 2020, 12),
(346, '1701070008', 'April 2021', '', '', '250000', 'BELUM DIBAYAR', 0, 2020, 12),
(347, '1701070008', 'Mei 2021', '', '', '250000', 'BELUM DIBAYAR', 0, 2020, 12),
(348, '1701070008', 'Juni 2021', '', '', '250000', 'BELUM DIBAYAR', 0, 2020, 12),
(349, '4252341234', 'Juli 2022', '', '', '300000', 'BELUM DIBAYAR', 0, 2022, 12),
(350, '4252341234', 'Agustus 2022', '', '', '300000', 'BELUM DIBAYAR', 0, 2022, 12),
(351, '4252341234', 'September 2022', '', '', '300000', 'BELUM DIBAYAR', 0, 2022, 12),
(352, '4252341234', 'Oktober 2022', '', '', '300000', 'BELUM DIBAYAR', 0, 2022, 12),
(353, '4252341234', 'November 2022', '', '', '300000', 'BELUM DIBAYAR', 0, 2022, 12),
(354, '4252341234', 'Desember 2022', '', '', '300000', 'BELUM DIBAYAR', 0, 2022, 12),
(355, '4252341234', 'Januari 2023', '', '', '300000', 'BELUM DIBAYAR', 0, 2023, 12),
(356, '4252341234', 'Februari 2023', '', '', '300000', 'BELUM DIBAYAR', 0, 2023, 12),
(357, '4252341234', 'Maret 2023', '', '', '300000', 'BELUM DIBAYAR', 0, 2023, 12),
(358, '4252341234', 'April 2023', '', '', '300000', 'BELUM DIBAYAR', 0, 2023, 12),
(359, '4252341234', 'Mei 2023', '', '', '300000', 'BELUM DIBAYAR', 0, 2023, 12),
(360, '4252341234', 'Juni 2023', '', '', '300000', 'BELUM DIBAYAR', 0, 2023, 12),
(361, '7553768585', 'Juli 2020', '', '', '250000', 'BELUM DIBAYAR', 0, 2020, 12),
(362, '7553768585', 'Agustus 2020', '301120240906150615', '2024-11-30', '250000', 'LUNAS', 5, 2020, 12),
(363, '7553768585', 'September 2020', '', '', '250000', 'BELUM DIBAYAR', 0, 2020, 12),
(364, '7553768585', 'Oktober 2020', '', '', '250000', 'BELUM DIBAYAR', 0, 2020, 12),
(365, '7553768585', 'November 2020', '', '', '250000', 'BELUM DIBAYAR', 0, 2020, 12),
(366, '7553768585', 'Desember 2020', '', '', '250000', 'BELUM DIBAYAR', 0, 2020, 12),
(367, '7553768585', 'Januari 2021', '', '', '250000', 'BELUM DIBAYAR', 0, 2021, 12),
(368, '7553768585', 'Februari 2021', '', '', '250000', 'BELUM DIBAYAR', 0, 2021, 12),
(369, '7553768585', 'Maret 2021', '', '', '250000', 'BELUM DIBAYAR', 0, 2021, 12),
(370, '7553768585', 'April 2021', '', '', '250000', 'BELUM DIBAYAR', 0, 2021, 12),
(371, '7553768585', 'Mei 2021', '', '', '250000', 'BELUM DIBAYAR', 0, 2021, 12),
(372, '7553768585', 'Juni 2021', '', '', '250000', 'BELUM DIBAYAR', 0, 2021, 12);

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

INSERT INTO `siswa` (`nisn`, `nama`, `id_angkatan`, `id_jurusan`, `id_kelas`, `alamat`, `jenis_kelamin`, `ttl`) VALUES
('0101010101', 'Muhammad Gilang Hamdani Tes', '2020/2021', 1, 14, 'Ewqweqewq', 'laki-laki', 'Jakarta, 17-01-2007'),
('1701070004', 'Muhammad Gilang Hamdani', '2020/2021', 4, 18, 'Jl.Mawar, Pisangan, Ciputat Timur', 'laki-laki', 'Jakarta, 17-01-2007'),
('1701070008', 'Coba', '2020/2021', 1, 15, 'Tes', 'laki-laki', 'Jakarta, 17-01-2007'),
('1702070004', 'Lang', '2022/2023', 4, 17, 'Tes', 'laki-laki', 'Bogor, 17-02-2007'),
('2020112237', 'Tes', '2021/2022', 2, 9, 'Tes', 'perempuan', 'Jakarta, 17-01-2009'),
('4252341234', 'Beneran Nii Bismillah', '2022/2023', 4, 18, 'Tes Alhamdulillah', 'laki-laki', 'Bogor, 17-02-2007'),
('4362345136', 'Tes Coba', '2020/2021', 1, 10, 'Tes', 'laki-laki', 'Jakarta, 17-01-2007'),
('7553768585', 'Logo', '2020/2021', 1, 14, 'Tteyer', 'laki-laki', 'Jakarta, 17-01-2007');

-- --------------------------------------------------------

--
-- Struktur dari tabel `siswatemp`
--

CREATE TABLE `siswatemp` (
  `nisn` varchar(50) NOT NULL,
  `kls10` varchar(10) NOT NULL,
  `kls11` varchar(10) NOT NULL,
  `kls12` varchar(10) NOT NULL,
  `tahun` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `siswatemp`
--

INSERT INTO `siswatemp` (`nisn`, `kls10`, `kls11`, `kls12`, `tahun`) VALUES
('0101010101', '', '', 'XII MM 1', '2020/2021'),
('1701070004', '', '', 'XII RPL', '2020/2021'),
('1701070008', '', '', 'XII MM 2', '2020/2021'),
('1702070004', '', 'XI PPLG', '', '2022/2023'),
('2020112237', '', 'XI AKL 2', '', '2021/2022'),
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
('4252341234', '', '', 'XII RPL', '2022/2023'),
('4362345136', '', 'XI MM 1', '', '2020/2021'),
('7553768585', '', '', 'XII MM 1', '2020/2021');

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
  ADD PRIMARY KEY (`nisn`);

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
  MODIFY `idspp` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=373;

--
-- AUTO_INCREMENT untuk tabel `pengeluaran`
--
ALTER TABLE `pengeluaran`
  MODIFY `id_pengeluaran` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
