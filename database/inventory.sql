-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 24 Jul 2023 pada 20.47
-- Versi server: 10.4.17-MariaDB
-- Versi PHP: 8.0.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ecomm`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `barang`
--

CREATE TABLE `barang` (
  `id_barang` varchar(11) NOT NULL,
  `nm_barang` varchar(250) NOT NULL,
  `spek` text NOT NULL,
  `satuan` varchar(10) NOT NULL,
  `stok` int(11) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `barang`
--

INSERT INTO `barang` (`id_barang`, `nm_barang`, `spek`, `satuan`, `stok`, `created_at`, `updated_at`) VALUES
('B-230724001', 'Laptop', 'Asus', 'Unit', 50, '2023-07-24 18:24:24', '2023-07-24 18:45:44');

-- --------------------------------------------------------

--
-- Struktur dari tabel `keluar`
--

CREATE TABLE `keluar` (
  `id_keluar` varchar(12) NOT NULL,
  `tanggal` date NOT NULL,
  `keterangan` text NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `keluar`
--

INSERT INTO `keluar` (`id_keluar`, `tanggal`, `keterangan`, `created_at`, `updated_at`) VALUES
('BK-230729001', '2023-07-29', 'Sudah Terjual', '2023-07-24 18:45:44', '2023-07-24 18:45:44');

-- --------------------------------------------------------

--
-- Struktur dari tabel `keluar_detail`
--

CREATE TABLE `keluar_detail` (
  `id_keluar` varchar(12) NOT NULL,
  `id_barang` varchar(11) NOT NULL,
  `jumlah` int(11) NOT NULL,
  `spek` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `keluar_detail`
--

INSERT INTO `keluar_detail` (`id_keluar`, `id_barang`, `jumlah`, `spek`) VALUES
('BK-230729001', 'B-230724001', 50, 'Asus');

-- --------------------------------------------------------

--
-- Struktur dari tabel `suplai`
--

CREATE TABLE `suplai` (
  `id_suplai` varchar(12) NOT NULL,
  `penyuplai` varchar(250) NOT NULL,
  `tanggal` date NOT NULL,
  `keterangan` text NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `suplai`
--

INSERT INTO `suplai` (`id_suplai`, `penyuplai`, `tanggal`, `keterangan`, `created_at`, `updated_at`) VALUES
('BM-230725001', 'ASUS', '2023-07-25', 'Laptop Merk Asus', '2023-07-24 18:45:13', '2023-07-24 18:45:13');

-- --------------------------------------------------------

--
-- Struktur dari tabel `suplai_detail`
--

CREATE TABLE `suplai_detail` (
  `id_suplai` varchar(12) NOT NULL,
  `id_barang` varchar(11) NOT NULL,
  `jumlah` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `suplai_detail`
--

INSERT INTO `suplai_detail` (`id_suplai`, `id_barang`, `jumlah`) VALUES
('BM-230725001', 'B-230724001', 100);

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id_user` varchar(5) NOT NULL,
  `nm_user` varchar(150) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(255) NOT NULL,
  `level` varchar(20) NOT NULL,
  `status` varchar(20) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`id_user`, `nm_user`, `username`, `password`, `level`, `status`, `created_at`, `updated_at`) VALUES
('AD004', 'Reza Maudy', 'maudy123', '$2y$10$zSLOau6f2A1mtaDCPIGfaOahTkod6wl9OWyvbTGOZJFsoCH3Lo0Ga', 'Admin', 'Non Aktif', '2023-07-24 16:40:24', '2023-07-24 17:41:50'),
('AD005', 'Reza Maudy Alimy', 'maudy', '$2y$10$nTLHcvmvc1eYpT6atG5sfuwL3CigErWnX4bJZjxA78/xdQ214PDHK', 'Operator', 'Aktif', '2023-07-24 17:36:05', '2023-07-24 17:38:43'),
('AD006', 'Diki', 'diki', '$2y$10$x4Xg1SFohQUu.GSH1.794.O2kJLOSwJgcpPCw1hLG0s5tQoiY526W', 'Kasir', 'Aktif', '2023-07-24 17:39:08', '2023-07-24 17:39:08'),
('AD007', 'Admin', 'admin', '$2y$10$7XdXc7/Z502qo1M6SB.nPe7duKlGzc702N3O7hGl0mllNf3p93gV.', 'Admin', 'Aktif', '2023-07-24 17:41:32', '2023-07-24 17:41:32');

-- --------------------------------------------------------

--
-- Stand-in struktur untuk tampilan `vhistory`
-- (Lihat di bawah untuk tampilan aktual)
--
CREATE TABLE `vhistory` (
`id_barang` varchar(11)
,`nm_barang` varchar(250)
,`jumlah` int(11)
,`id` varchar(12)
,`satuan` varchar(10)
,`created_at` datetime
);

-- --------------------------------------------------------

--
-- Struktur dari tabel `web`
--

CREATE TABLE `web` (
  `id_web` int(1) NOT NULL,
  `nm_web` varchar(250) NOT NULL,
  `alamat` text NOT NULL,
  `email` varchar(250) NOT NULL,
  `telp` varchar(15) NOT NULL,
  `min_stok` tinyint(4) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `web`
--

INSERT INTO `web` (`id_web`, `nm_web`, `alamat`, `email`, `telp`, `min_stok`, `created_at`, `updated_at`) VALUES
(1, 'InventoryGudang', 'Universitas Indonesia, Jl. Prof. DR. G.A. Siwabessy, Kukusan, Kecamatan Beji, Kota Depok, Jawa Barat 16425', 'InventoryGudang@gmail.com', '087715728968', 5, '2021-06-22 22:44:00', '2023-07-24 17:43:20');

-- --------------------------------------------------------

--
-- Struktur untuk view `vhistory`
--
DROP TABLE IF EXISTS `vhistory`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vhistory`  AS  (select `barang`.`id_barang` AS `id_barang`,`barang`.`nm_barang` AS `nm_barang`,`suplai_detail`.`jumlah` AS `jumlah`,`suplai`.`id_suplai` AS `id`,`barang`.`satuan` AS `satuan`,`suplai`.`created_at` AS `created_at` from ((`suplai` join `suplai_detail`) join `barang`) where `suplai`.`id_suplai` = `suplai_detail`.`id_suplai` and `suplai_detail`.`id_barang` = `barang`.`id_barang`) union (select `barang`.`id_barang` AS `id_barang`,`barang`.`nm_barang` AS `nm_barang`,`keluar_detail`.`jumlah` AS `jumlah`,`keluar`.`id_keluar` AS `id`,`barang`.`satuan` AS `satuan`,`keluar`.`created_at` AS `created_at` from ((`keluar` join `keluar_detail`) join `barang`) where `keluar`.`id_keluar` = `keluar_detail`.`id_keluar` and `keluar_detail`.`id_barang` = `barang`.`id_barang`) ;

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `barang`
--
ALTER TABLE `barang`
  ADD PRIMARY KEY (`id_barang`);

--
-- Indeks untuk tabel `keluar`
--
ALTER TABLE `keluar`
  ADD PRIMARY KEY (`id_keluar`);

--
-- Indeks untuk tabel `keluar_detail`
--
ALTER TABLE `keluar_detail`
  ADD KEY `id_keluar` (`id_keluar`),
  ADD KEY `id_barang` (`id_barang`);

--
-- Indeks untuk tabel `suplai`
--
ALTER TABLE `suplai`
  ADD PRIMARY KEY (`id_suplai`);

--
-- Indeks untuk tabel `suplai_detail`
--
ALTER TABLE `suplai_detail`
  ADD KEY `id_suplai` (`id_suplai`),
  ADD KEY `id_barang` (`id_barang`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id_user`);

--
-- Indeks untuk tabel `web`
--
ALTER TABLE `web`
  ADD PRIMARY KEY (`id_web`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
