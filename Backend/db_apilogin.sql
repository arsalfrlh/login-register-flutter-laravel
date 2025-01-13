-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 13 Jan 2025 pada 10.16
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
-- Database: `db_apilogin`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES
(2, 'App\\Models\\User', 2, 'auth_token', 'e71205eed2bc1f9f745f9373e8dfaf805073c51e5c272bbb03b16d7613043e0a', '[\"*\"]', '2025-01-03 03:23:03', NULL, '2025-01-03 03:22:45', '2025-01-03 03:23:03'),
(13, 'App\\Models\\User', 3, 'auth_token', 'b14aa40db67271fb34ab0ffdb4199ed4ce88150c61e8a41af3fbc18ff8d868ea', '[\"*\"]', NULL, NULL, '2025-01-04 00:06:38', '2025-01-04 00:06:38'),
(14, 'App\\Models\\User', 4, 'auth_token', 'ecf5202c1786eab5200fe4ef3a2ce6cef8b402acde3ce7888481f37d448fb317', '[\"*\"]', NULL, NULL, '2025-01-04 00:07:57', '2025-01-04 00:07:57'),
(15, 'App\\Models\\User', 5, 'auth_token', '0414336538028cc0854abb413683cbe85719865ecfdaf076c2242e1dbebaa8a4', '[\"*\"]', NULL, NULL, '2025-01-04 00:11:49', '2025-01-04 00:11:49'),
(43, 'App\\Models\\User', 9, 'auth_token', '21fb2bb0186d206e625000265b95630191ff3084399f9a8b110a96493d90c5a5', '[\"*\"]', '2025-01-11 05:53:00', NULL, '2025-01-11 05:52:39', '2025-01-11 05:53:00'),
(44, 'App\\Models\\User', 9, 'auth_token', '41c1cedaaa72ff6489686360e0aa433c4a56afbaa8160692f87512d2453e7bb2', '[\"*\"]', '2025-01-11 05:53:39', NULL, '2025-01-11 05:53:26', '2025-01-11 05:53:39'),
(80, 'App\\Models\\User', 1, 'auth_token', '231c0834c8226d3379d951b06c0e826d51e78fd05edd425abca5a1495ecaf2da', '[\"*\"]', NULL, NULL, '2025-01-12 00:52:02', '2025-01-12 00:52:02'),
(85, 'App\\Models\\User', 1, 'auth_token', '3dd000be184b1c3854728d1672f25e7c0986d67b82bb7d8bd6670f4955e72949', '[\"*\"]', NULL, NULL, '2025-01-13 01:03:00', '2025-01-13 01:03:00'),
(99, 'App\\Models\\User', 6, 'auth_token', 'e43a272c75ba2d9098c469796a3eb1ac4c56e3cee4315c3429a813248ee10020', '[\"*\"]', NULL, NULL, '2025-01-13 01:57:14', '2025-01-13 01:57:14'),
(100, 'App\\Models\\User', 11, 'auth_token', '9d0bfc3a64fc22806e76837814519a73bd86db2a2e7e657c6f655060c59818c9', '[\"*\"]', '2025-01-13 02:01:19', NULL, '2025-01-13 01:57:37', '2025-01-13 02:01:19');

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `alamat` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `alamat`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Kwanzza', 'arsal@gmail.com', 'Isekai', NULL, '$2y$10$r7YPeOIihH0WWsZg.t.UKeI6.elS11h7N7NM9RW31EqLBqozdonoS', NULL, '2025-01-02 00:52:05', '2025-01-02 00:52:05'),
(6, 'Fahrulloh', 'sasa@gmail.com', 'Isekai', NULL, '$2y$10$vYVxgkF35OjHslpB/z3X7uy35V7gA4b3A.jlJ7Ecer9m8ew1nnh0W', NULL, '2025-01-04 00:12:57', '2025-01-04 00:12:57'),
(7, 'Arsal', 'test@gmail.com', 'Isekai', NULL, '$2y$10$far5nQ4cKLxL2W0gm6nRZ.3fuMnPAefYbD/CcFuyYWFcaExjuyFh2', NULL, '2025-01-04 00:40:15', '2025-01-04 00:40:15'),
(8, 'wowo', 'wowo@gmail.com', 'Isekai', NULL, '$2y$10$SSMxWwLXwIyVs31Y1DZZrORPAfe/LoWo4RhB6wVuqbNtPy/A0Tufu', NULL, '2025-01-09 05:06:25', '2025-01-09 05:06:25'),
(9, 'woi', 'woi@gmail.com', 'Isekai', NULL, '$2y$10$ola.r0cDnMs5LPdYSanFreCKentrX5AsaYwwc9qq4lsuu2WX/gkwq', NULL, '2025-01-11 05:52:39', '2025-01-11 05:52:39'),
(10, 'wer', 'wer@gmail.com', 'Isekai', NULL, '$2y$10$o29uZDJQO8lv6MqUv4KfWeVTdLpOkMwLeNN2Qhk5gVxYoE5nXYGU.', NULL, '2025-01-13 01:27:55', '2025-01-13 01:27:55'),
(11, 'woi1', 'woi1@gmail.com', 'Isekai', NULL, '$2y$10$zfRqN3RU4cfF1c/aj.Qh9OpwyATnf3vDEzwDsRZREGPV2QFnYwjhi', NULL, '2025-01-13 01:57:37', '2025-01-13 01:57:37'),
(12, 'qwerty', 'qwerty@gmail.com', 'Isekai', NULL, '$2y$10$4wsxO7Pu0bw17TONm6N1E.4IMcKdMaD1NpgDqADeq2bWjgumZrvqi', NULL, '2025-01-13 02:15:16', '2025-01-13 02:15:16');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indeks untuk tabel `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indeks untuk tabel `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=103;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
