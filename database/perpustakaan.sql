-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 22, 2021 at 10:53 AM
-- Server version: 10.4.14-MariaDB
-- PHP Version: 7.4.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `perpustakaan`
--

-- --------------------------------------------------------

--
-- Table structure for table `buku`
--

CREATE TABLE `buku` (
  `id` int(11) NOT NULL,
  `judul` varchar(200) NOT NULL,
  `pengarang` varchar(100) DEFAULT NULL,
  `penerbit` varchar(100) DEFAULT NULL,
  `kategori_id` int(11) NOT NULL,
  `kode_buku` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `buku`
--

INSERT INTO `buku` (`id`, `judul`, `pengarang`, `penerbit`, `kategori_id`, `kode_buku`) VALUES
(1, 'Naruto Ninja Strom', 'Masasih Kimoto', 'akbar', 4, 'B0001'),
(2, 'Attack On Titan', 'Masasih Kimoto', 'akbar', 3, 'B0002'),
(3, 'Naruto Ninja Strom', 'Masasih Kimoto', 'akbar', 4, 'B0001'),
(4, 'Naruto Ninja Strom', 'Masasih Kimoto', 'akbar', 4, 'B0001'),
(5, 'Attack On Titan', 'Masasih Kimoto', 'akbar', 4, 'B0001'),
(6, 'Naruto Ninja Strom', 'Masasih Kimoto', 'akbar', 4, 'B0001'),
(7, 'Naruto Ninja Strom', 'Masasih Kimoto', 'akbar', 3, 'B0001'),
(8, 'Naruto Ninja Strom', 'Singo yamamoto', 'akbar', 3, 'B0001'),
(9, 'Naruto Ninja Strom', 'Masasih Kimoto', 'akbar', 4, 'B0001'),
(10, 'Naruto Ninja Strom', 'Singo yamamoto', 'akbar', 3, 'B0001'),
(11, 'Attack On Titan', 'Masasih Kimoto', 'akbar', 3, 'B0001');

-- --------------------------------------------------------

--
-- Table structure for table `kategori`
--

CREATE TABLE `kategori` (
  `id` int(11) NOT NULL,
  `nama` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `kategori`
--

INSERT INTO `kategori` (`id`, `nama`) VALUES
(1, 'komputer'),
(2, 'sejarah'),
(3, 'akuntansi'),
(4, 'programing');

-- --------------------------------------------------------

--
-- Table structure for table `transaksi`
--

CREATE TABLE `transaksi` (
  `id` int(11) NOT NULL,
  `kode_buku` varchar(10) NOT NULL,
  `nomor_anggota` varchar(10) NOT NULL,
  `tanggal_pinjam` datetime NOT NULL DEFAULT current_timestamp(),
  `tanggal_kembali` datetime NOT NULL,
  `status` enum('Dipinjam','Kembali','','') NOT NULL DEFAULT 'Dipinjam',
  `denda` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `transaksi`
--

INSERT INTO `transaksi` (`id`, `kode_buku`, `nomor_anggota`, `tanggal_pinjam`, `tanggal_kembali`, `status`, `denda`) VALUES
(1, 'B0002', 'A0003', '2020-07-23 23:00:05', '2020-07-23 18:24:38', 'Kembali', 0),
(2, 'B0002', 'A0001', '2020-07-23 23:13:51', '2020-07-30 18:13:51', 'Dipinjam', 0),
(3, 'B0002', 'A0004', '2020-07-24 13:31:16', '2020-07-24 08:31:57', 'Kembali', 0),
(4, 'B0002', 'A0002', '2020-07-24 13:32:31', '2020-07-31 08:32:31', 'Dipinjam', 0),
(5, 'B0002', 'A0002', '2020-07-24 13:34:23', '2020-07-31 08:34:23', 'Dipinjam', 0),
(6, 'B0002', 'A0004', '2020-07-24 20:16:21', '2020-07-24 15:16:26', 'Kembali', 0),
(7, 'B0001', 'A0003', '2020-07-26 18:28:05', '2020-07-26 13:28:08', 'Kembali', 0),
(8, 'B0001', 'A0004', '2021-01-22 16:48:08', '2021-01-22 10:48:55', 'Kembali', 0);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `nama_lengkap` varchar(50) NOT NULL,
  `nomor_anggota` varchar(10) NOT NULL,
  `hak_akses` enum('O','A','P') NOT NULL DEFAULT 'P'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `username`, `password`, `nama_lengkap`, `nomor_anggota`, `hak_akses`) VALUES
(1, 'akbar', '123', 'Muhammad Akbar', 'A0001', 'P'),
(2, 'markus', '123', 'Markus Horison', 'A0002', 'P'),
(5, 'budi', '123', 'Budi Pergi ke Pasar', 'A0003', 'O'),
(6, 'admin', '123', 'administrator', 'A0004', 'A');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `buku`
--
ALTER TABLE `buku`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `kategori`
--
ALTER TABLE `kategori`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transaksi`
--
ALTER TABLE `transaksi`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `buku`
--
ALTER TABLE `buku`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `kategori`
--
ALTER TABLE `kategori`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `transaksi`
--
ALTER TABLE `transaksi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
