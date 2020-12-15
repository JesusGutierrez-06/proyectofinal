-- phpMyAdmin SQL Dump
-- version 4.9.5deb2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Dec 14, 2020 at 07:54 PM
-- Server version: 8.0.22-0ubuntu0.20.04.3
-- PHP Version: 7.4.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `proyectotesis`
--

-- --------------------------------------------------------

--
-- Table structure for table `area_capa`
--

CREATE TABLE `area_capa` (
  `id` int NOT NULL,
  `nombre` varchar(100) CHARACTER SET utf8 COLLATE utf8_spanish2_ci NOT NULL,
  `estado` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- --------------------------------------------------------

--
-- Table structure for table `area_laboral`
--

CREATE TABLE `area_laboral` (
  `id` int NOT NULL,
  `nombre` varchar(100) CHARACTER SET utf8 COLLATE utf8_spanish2_ci DEFAULT NULL,
  `estado` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- --------------------------------------------------------

--
-- Table structure for table `capacitacion`
--

CREATE TABLE `capacitacion` (
  `id` int NOT NULL,
  `tipo_capa_id` int NOT NULL,
  `estudiante_id` int NOT NULL,
  `area_capa_id` int NOT NULL,
  `nombre` varchar(100) CHARACTER SET utf8 COLLATE utf8_spanish2_ci NOT NULL,
  `institucion` varchar(100) CHARACTER SET utf8 COLLATE utf8_spanish2_ci NOT NULL,
  `fechainicio` date DEFAULT NULL,
  `fechafin` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- --------------------------------------------------------

--
-- Table structure for table `carrera`
--

CREATE TABLE `carrera` (
  `id` int NOT NULL,
  `nombre` varchar(100) CHARACTER SET utf8 COLLATE utf8_spanish2_ci NOT NULL,
  `estado` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Dumping data for table `carrera`
--

INSERT INTO `carrera` (`id`, `nombre`, `estado`, `created_at`, `updated_at`) VALUES
(1, 'Sistemas Informaticos', 1, '2020-12-06 19:58:57', '2020-12-06 19:58:57'),
(2, 'Contaduria General', 1, '2020-12-06 19:58:57', '2020-12-06 19:58:57');

-- --------------------------------------------------------

--
-- Table structure for table `contacto`
--

CREATE TABLE `contacto` (
  `id` int NOT NULL,
  `empresa_id` int NOT NULL,
  `users_id` int NOT NULL,
  `nombre` varchar(100) CHARACTER SET utf8 COLLATE utf8_spanish2_ci DEFAULT NULL,
  `celular` int DEFAULT NULL,
  `telefono` int DEFAULT NULL,
  `estado` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Dumping data for table `contacto`
--

INSERT INTO `contacto` (`id`, `empresa_id`, `users_id`, `nombre`, `celular`, `telefono`, `estado`, `created_at`, `updated_at`) VALUES
(1, 2, 25, 'pedro martinez', 62342342, 32412, 1, '2020-12-10 18:50:34', '2020-12-10 18:50:34'),
(2, 1, 10, 'juan perez', 6123123, 23423, 1, '2020-12-06 19:58:57', '2020-12-06 21:51:50'),
(3, 3, 7, 'leonardo', 623123, 123123, 1, '2020-12-10 19:46:49', '2020-12-10 19:46:49'),
(4, 7, 27, 'Roberto Salvatierra', 632323, 34242, 1, '2020-12-14 18:09:17', '2020-12-14 18:09:17'),
(5, 8, 28, 'juan tenorio', 523423, 43412, 1, '2020-12-14 21:01:24', '2020-12-14 21:01:24');

-- --------------------------------------------------------

--
-- Table structure for table `contrato`
--

CREATE TABLE `contrato` (
  `id` int NOT NULL,
  `nombre` varchar(60) CHARACTER SET utf8 COLLATE utf8_spanish2_ci NOT NULL,
  `estado` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Dumping data for table `contrato`
--

INSERT INTO `contrato` (`id`, `nombre`, `estado`, `created_at`, `updated_at`) VALUES
(1, 'Medio tiempo', 1, '2020-12-06 21:51:50', '2020-12-06 21:51:50'),
(2, 'Tiempo completo', 1, '2020-12-06 19:58:57', '2020-12-06 19:58:57');

-- --------------------------------------------------------

--
-- Table structure for table `departamento`
--

CREATE TABLE `departamento` (
  `id` int NOT NULL,
  `nombre` varchar(70) CHARACTER SET utf8 COLLATE utf8_spanish2_ci NOT NULL,
  `estado` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Dumping data for table `departamento`
--

INSERT INTO `departamento` (`id`, `nombre`, `estado`, `created_at`, `updated_at`) VALUES
(1, 'Santa Cruz', 1, '2020-12-06 19:34:19', '2020-12-06 19:34:19'),
(2, 'Pando', 1, '2020-12-06 19:34:19', '2020-12-06 19:34:19');

-- --------------------------------------------------------

--
-- Table structure for table `empresa`
--

CREATE TABLE `empresa` (
  `id` int NOT NULL,
  `dpto_id` int NOT NULL,
  `users_id` int NOT NULL,
  `nombre` varchar(100) CHARACTER SET utf8 COLLATE utf8_spanish2_ci NOT NULL,
  `direccion` varchar(250) CHARACTER SET utf8 COLLATE utf8_spanish2_ci NOT NULL,
  `url_pagina` varchar(50) CHARACTER SET utf8 COLLATE utf8_spanish2_ci DEFAULT NULL,
  `descripcion` varchar(500) CHARACTER SET utf8 COLLATE utf8_spanish2_ci NOT NULL,
  `celular` int DEFAULT NULL,
  `telefono` int DEFAULT NULL,
  `nit` varchar(20) CHARACTER SET utf8 COLLATE utf8_spanish2_ci DEFAULT NULL,
  `logo` varchar(255) CHARACTER SET utf8 COLLATE utf8_spanish2_ci DEFAULT NULL,
  `fechaalta` date DEFAULT NULL,
  `estado` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Dumping data for table `empresa`
--

INSERT INTO `empresa` (`id`, `dpto_id`, `users_id`, `nombre`, `direccion`, `url_pagina`, `descripcion`, `celular`, `telefono`, `nit`, `logo`, `fechaalta`, `estado`, `created_at`, `updated_at`) VALUES
(1, 1, 17, 'Sofia', '4to anillo, parque industrial', 'www.sofia.com', 'empresa distribuidora aviocola', 723123, 342142, '1242324', 'public/35VJTTwLW7D9hy3aCbldV6Gnzn7c18cK6sW7ORfr.png', NULL, 1, '2020-12-06 19:58:57', '2020-12-14 21:09:33'),
(2, 1, 17, 'caja nacional de salud', 'av 2 de agosto', 'www.cajanacional.com', 'centro de salud', 123123, 3424124, '12312312312', 'public/ihggdCESKROaXYGdcPIHgh786DNvvbtRrBdvfQy0.png', NULL, 0, '2020-12-10 18:50:20', '2020-12-10 20:43:24'),
(3, 1, 7, 'Cuadernos Lider', 'av 2 de agosto', 'www.lider.com', 'distribuidora de papeleria', 123123, 3424124, '123123', 'public/IlA2KCDcGrcDQCzGZhG5gNvH1IC9UeMe5qNn1E5q.png', NULL, 1, '2020-12-10 19:46:32', '2020-12-14 21:35:49'),
(4, 2, 26, 'Cuadernos Lider', 'av 2 de agosto', 'www.lider.com', 'distribuidora de papeleria', 123123, 3424124, '123123', 'public/Sl1VKbLSXYYxHUGQqaSHJcPTjoJM0X4QaLnDPy3D.png', NULL, 1, '2020-12-10 20:23:39', '2020-12-14 21:36:55'),
(5, 2, 26, 'Cuadernos Lider y TOP', 'av 2 de agosto', 'www.lider.com', 'distribuidora de papeleria', 123123, 3424124, '123123', 'public/ihggdCESKROaXYGdcPIHgh786DNvvbtRrBdvfQy0.png', NULL, 1, '2020-12-10 20:27:11', '2020-12-10 20:27:11'),
(6, 1, 17, 'Sofia S.R.L.', '4to anillo, parque industrial', 'www.sofia.com', 'empresa distribuidora aviocola', 723123, 342142, '1242324', 'public/ihggdCESKROaXYGdcPIHgh786DNvvbtRrBdvfQy0.png', NULL, 1, '2020-12-10 20:30:45', '2020-12-11 12:47:22'),
(7, 1, 27, 'Netflix', 'av 2 de agosto', 'www.netflix.com', 'entretenimiento', 72342342, 3424124, '12312312', 'public/ihggdCESKROaXYGdcPIHgh786DNvvbtRrBdvfQy0.png', NULL, 1, '2020-12-14 18:07:58', '2020-12-14 18:07:58'),
(8, 1, 28, 'cumbre', 'av cañoto', 'www.cumbre.com', 'universidad', 65423234, 435235, '123123123', 'public/hmYahPVxAUqJQ0e16zm7jnLVB9IOf2CBkheN4D41.png', NULL, 1, '2020-12-14 21:00:59', '2020-12-14 21:00:59');

-- --------------------------------------------------------

--
-- Table structure for table `estado_civil`
--

CREATE TABLE `estado_civil` (
  `id` int NOT NULL,
  `nombre` varchar(20) CHARACTER SET utf8 COLLATE utf8_spanish2_ci NOT NULL,
  `estado` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Dumping data for table `estado_civil`
--

INSERT INTO `estado_civil` (`id`, `nombre`, `estado`, `created_at`, `updated_at`) VALUES
(1, 'Soltero/a', 1, '2020-12-06 19:58:57', '2020-12-06 19:58:57'),
(2, 'Casado/a', 1, '2020-12-06 19:58:57', '2020-12-06 19:58:57'),
(5, 'Divorciado/a', 1, '2020-12-06 19:58:57', '2020-12-06 19:58:57'),
(6, 'Viudo/a', 1, '2020-12-06 19:58:57', '2020-12-06 19:58:57'),
(7, 'Concubinato', 1, '2020-12-06 19:58:57', '2020-12-06 19:58:57');

-- --------------------------------------------------------

--
-- Table structure for table `estudiante`
--

CREATE TABLE `estudiante` (
  `id` int NOT NULL,
  `tipo_sangre_id` int NOT NULL,
  `estado_civil_id` int NOT NULL,
  `provincia_id` int NOT NULL,
  `users_id` int NOT NULL,
  `genero_id` int NOT NULL,
  `matricula` int NOT NULL,
  `nombre` varchar(50) CHARACTER SET utf8 COLLATE utf8_spanish2_ci NOT NULL,
  `apellidop` varchar(30) CHARACTER SET utf8 COLLATE utf8_spanish2_ci DEFAULT NULL,
  `apellidom` varchar(30) CHARACTER SET utf8 COLLATE utf8_spanish2_ci DEFAULT NULL,
  `fechanac` date NOT NULL,
  `telefono` int DEFAULT NULL,
  `celular` int DEFAULT NULL,
  `dni` int NOT NULL,
  `direccion` varchar(100) CHARACTER SET utf8 COLLATE utf8_spanish2_ci NOT NULL,
  `foto` varchar(255) CHARACTER SET utf8 COLLATE utf8_spanish2_ci DEFAULT NULL,
  `email` varchar(100) CHARACTER SET utf8 COLLATE utf8_spanish2_ci DEFAULT NULL,
  `strpassword` varchar(16) CHARACTER SET utf8 COLLATE utf8_spanish2_ci DEFAULT NULL,
  `fechaalta` date DEFAULT NULL,
  `estado` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Dumping data for table `estudiante`
--

INSERT INTO `estudiante` (`id`, `tipo_sangre_id`, `estado_civil_id`, `provincia_id`, `users_id`, `genero_id`, `matricula`, `nombre`, `apellidop`, `apellidom`, `fechanac`, `telefono`, `celular`, `dni`, `direccion`, `foto`, `email`, `strpassword`, `fechaalta`, `estado`, `created_at`, `updated_at`) VALUES
(2, 1, 1, 1, 7, 2, 1123123, 'jesus', 'gutierrez', 'sipe', '2000-02-04', 3424124, 6572723, 323123, 'Zona barrio lindo', 'public/JExuw53sZOJKTq1fNTEfUq3NL3xVmpohVpq9HN2g.png', NULL, NULL, NULL, 1, '2020-12-07 20:39:07', '2020-12-14 22:22:13'),
(3, 1, 1, 1, 24, 1, 13123123, 'maria', 'guzman', 'suarez', '2000-02-03', 324242, 7123123, 123123123, 'Zona barrio lindo', NULL, NULL, NULL, NULL, 0, '2020-12-08 00:32:47', '2020-12-13 21:29:41'),
(4, 4, 1, 1, 29, 1, 1123123, 'Yerelin', 'gutierrez', 'suarez', '2000-02-03', 3424124, 123123, 323123, 'Zona barrio lindo', 'public/JrbNM0hjyzpEO1AGdPfAcbopaQpSqkP34o5dhS6M.png', NULL, NULL, NULL, 1, '2020-12-14 22:57:06', '2020-12-14 22:57:06');

-- --------------------------------------------------------

--
-- Table structure for table `estudios_idioma`
--

CREATE TABLE `estudios_idioma` (
  `id` int NOT NULL,
  `idioma_id` int NOT NULL,
  `estudiante_id` int NOT NULL,
  `hablar` varchar(30) CHARACTER SET utf8 COLLATE utf8_spanish2_ci NOT NULL,
  `escribir` varchar(30) CHARACTER SET utf8 COLLATE utf8_spanish2_ci NOT NULL,
  `leer` varchar(30) CHARACTER SET utf8 COLLATE utf8_spanish2_ci NOT NULL,
  `estado` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- --------------------------------------------------------

--
-- Table structure for table `exp_laboral`
--

CREATE TABLE `exp_laboral` (
  `id` int NOT NULL,
  `area_laboral_id` int NOT NULL,
  `estudiante_id` int NOT NULL,
  `institucion` varchar(100) CHARACTER SET utf8 COLLATE utf8_spanish2_ci NOT NULL,
  `puesto` varchar(100) CHARACTER SET utf8 COLLATE utf8_spanish2_ci NOT NULL,
  `fechainicial` date NOT NULL,
  `fechafin` date NOT NULL,
  `descripcion` varchar(100) CHARACTER SET utf8 COLLATE utf8_spanish2_ci NOT NULL,
  `estado` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `uuid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `genero`
--

CREATE TABLE `genero` (
  `id` int NOT NULL,
  `nombre` varchar(20) CHARACTER SET utf8 COLLATE utf8_spanish2_ci NOT NULL,
  `estado` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Dumping data for table `genero`
--

INSERT INTO `genero` (`id`, `nombre`, `estado`, `created_at`, `updated_at`) VALUES
(1, 'Femenino', 1, '2020-12-06 21:51:50', '2020-12-06 21:51:50'),
(2, 'Masculino', 1, '2020-12-06 18:08:29', '2020-12-06 18:08:29');

-- --------------------------------------------------------

--
-- Table structure for table `idioma`
--

CREATE TABLE `idioma` (
  `id` int NOT NULL,
  `nombre` varchar(50) CHARACTER SET utf8 COLLATE utf8_spanish2_ci NOT NULL,
  `estado` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Dumping data for table `idioma`
--

INSERT INTO `idioma` (`id`, `nombre`, `estado`, `created_at`, `updated_at`) VALUES
(1, 'Español', 1, '2020-12-06 19:58:57', '2020-12-06 19:58:57'),
(2, 'Frances', 1, '2020-12-06 19:58:57', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `inf_vocacional`
--

CREATE TABLE `inf_vocacional` (
  `id` int NOT NULL,
  `carrera_id` int NOT NULL,
  `estudiante_id` int NOT NULL,
  `semestre` varchar(30) CHARACTER SET utf8 COLLATE utf8_spanish2_ci DEFAULT NULL,
  `institucion` varchar(100) CHARACTER SET utf8 COLLATE utf8_spanish2_ci NOT NULL,
  `fechainicio` date NOT NULL,
  `fechafin` date DEFAULT NULL,
  `estado` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2014_10_12_200000_add_two_factor_columns_to_users_table', 1),
(4, '2019_08_19_000000_create_failed_jobs_table', 1),
(5, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(6, '2020_05_21_100000_create_teams_table', 1),
(7, '2020_12_07_150315_create_sessions_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `oferta_laboral`
--

CREATE TABLE `oferta_laboral` (
  `id` int NOT NULL,
  `carrera_id` int NOT NULL,
  `empresa_id` int NOT NULL,
  `salario_id` int NOT NULL,
  `tipo_sueldo_id` int NOT NULL,
  `contrato_id` int NOT NULL,
  `titulo` varchar(100) CHARACTER SET utf8 COLLATE utf8_spanish2_ci NOT NULL,
  `descripcion` varchar(1000) CHARACTER SET utf8 COLLATE utf8_spanish2_ci NOT NULL,
  `requisito` varchar(1000) CHARACTER SET utf8 COLLATE utf8_spanish2_ci DEFAULT NULL,
  `publicado` date DEFAULT NULL,
  `vencimiento` date DEFAULT NULL,
  `telefono` int DEFAULT NULL,
  `celular` int DEFAULT NULL,
  `estado` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Dumping data for table `oferta_laboral`
--

INSERT INTO `oferta_laboral` (`id`, `carrera_id`, `empresa_id`, `salario_id`, `tipo_sueldo_id`, `contrato_id`, `titulo`, `descripcion`, `requisito`, `publicado`, `vencimiento`, `telefono`, `celular`, `estado`, `created_at`, `updated_at`) VALUES
(1, 1, 3, 2, 2, 2, 'Analista de Compensaciones', 'Elaborar las Planillas de Salarios y Aportes a la Seguridad Social del personal de la empresa y gestionar el pago y presentaciones en forma oportuna y correcta a fin de cumplir con las obligaciones y plazos establecidos por las Leyes y Reglamentos en materia Laboral. ', 'Titulado Universitario (Carrera de Nivel Licenciatura) en:\r\nAdministración de Empresas,\r\nAdministración de RRHH,\r\nIngeniería Comercial,\r\nContaduría Pública O ramas afines', '2020-12-10', '2020-12-30', 344244, 6525332, 1, '2020-12-06 19:58:57', NULL),
(2, 2, 4, 1, 2, 1, 'ENCARGADO DE ALMACÉN', 'EMPRESA PRIVADA\r\n\r\nSubsede La Paz', 'Profesional en el área de Administración de Empresas o Contaduría\r\nManejo de Office\r\nResidencia en la ciudad de El Alto', '2020-12-06', '2020-12-11', 4323223, 7232323, 1, '2020-12-06 19:58:57', '2020-12-06 19:58:57'),
(3, 1, 3, 1, 1, 1, 'DOCENTE DE MEDIO TIEMPO DE LA CARRERA DE DERECHO', 'La Universidad Católica Boliviana \"San Pablo\" necesita incorporar un profesional, para ocupar el siguiente cargo:\r\n\r\nCONVOCATORIA N° 19/2020\r\n\r\nDOCENTE MEDIO TIEMPO CARRERA: DERECHO\r\n\r\n(Sede Santa Cruz)', 'Titulado a nivel de pregrado en la carrera de Derecho.\r\nMaestría o Doctorado en área de Derecho. Diplomado en Educación Superior.\r\nExperiencia en docencia, mínima de 5 años.\r\nExperiencia laboral en su especialidad minima de 5 años.\r\nConocimientos y experiencia de investigación científica, mínima de 3 años.\r\nDominio del Idioma Ingles.\r\nSe requiere un profesional comprometido con capacidad trabajo en equipo, con buen nivel de comunicación y relacionamiento.', '2020-12-14', '2000-02-03', 3242412, 6342323, 1, '2020-12-14 10:35:59', '2020-12-14 10:35:59'),
(4, 2, 3, 2, 2, 2, 'SECRETARIA - RECEPCIONISTA', 'Asunto: Secretaria Recepcionista', 'Santa Cruz Si te gusta el trabajo en equipo y te preocupas por ofrecer un buen servicio al cliente ¡Postúlate!', '2020-12-14', '2000-02-03', 345223, 752323, 1, '2020-12-14 12:05:35', '2020-12-14 12:05:35'),
(5, 2, 3, 1, 2, 1, 'Ejecutivo Comercial Y De Negocios', 'Banco mercantil santa cruz\r\n\r\ntendrÁs la oportunidad de generar contactos empresariales, ser embajador de la marca bmsc a travÉs de la gestiÓn y asesoramiento eficiente  a clientes potenciales y leales. generarÁs volumen de negocio a travÉs de ofertas de valor acompaÑadas de un servicio de calidad, basada en la post venta', 'Licenciatura en ciencias econÓmico-financieras y comerciales\r\nvaloraciÓn especial en estudios superiores relacionados a negocios y finanza\r\nexperiencia en ventas de al menos 1 aÑ\r\nanÁlisis matemÁtico- financier\r\ndisponibilidad y flexibilidad de horarios', '2020-12-14', '2001-03-03', 3425252, 72342342, 1, '2020-12-14 12:18:06', '2020-12-14 12:18:06'),
(6, 2, 3, 2, 1, 2, 'Regente FarmacÉutico/a', 'Únete a la familia chaveciana, premiada como uno de los mejores lugares para trabajar en el país.\r\n\r\nofrecemos un clima ideal de trabajo y una cultura interna que no querrás cambiar.\r\n\r\nenvía tu curriculum vitae con el asunto \"regente farmacéutico - la paz\" al correo', 'Licenciado/a en bioquímica y farmacia o lic. en farmacia.\r\nconocimiento en farmacología.\r\ndisponibilidad para turnos rotativos.\r\nganas de crecer profesionalmente.\r\npreferiblemente experiencia en atención de farmacia.', '2020-12-14', '2001-03-03', 324242, 72342342, 1, '2020-12-14 12:31:08', '2020-12-14 12:31:08'),
(7, 2, 3, 2, 2, 2, 'Personal De Atencion Al Cliente - Supervisor', 'AtenciÓn al cliente - supervisor', 'Envía tu cv a 78103063  shorturl.at/bxix0', '2020-12-14', '2000-02-03', 232323, 7123123, 1, '2020-12-14 12:42:56', '2020-12-14 12:42:56');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal`
--

CREATE TABLE `personal` (
  `id` int NOT NULL,
  `users_id` int NOT NULL,
  `nombre` varchar(60) CHARACTER SET utf8 COLLATE utf8_spanish2_ci NOT NULL,
  `apellidop` varchar(80) CHARACTER SET utf8 COLLATE utf8_spanish2_ci DEFAULT NULL,
  `apellidom` varchar(80) CHARACTER SET utf8 COLLATE utf8_spanish2_ci DEFAULT NULL,
  `carnet` varchar(10) CHARACTER SET utf8 COLLATE utf8_spanish2_ci NOT NULL,
  `celular` varchar(10) CHARACTER SET utf8 COLLATE utf8_spanish2_ci NOT NULL,
  `estado` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `postular_oferta`
--

CREATE TABLE `postular_oferta` (
  `id` int NOT NULL,
  `estudiante_id` int NOT NULL,
  `oferta_laboral_id` int NOT NULL,
  `fecha_postulacion` date NOT NULL,
  `estado_preseleccion` int DEFAULT NULL,
  `estado_final_contrato` int DEFAULT NULL,
  `aspiracion_salarial` int DEFAULT NULL,
  `estado` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Dumping data for table `postular_oferta`
--

INSERT INTO `postular_oferta` (`id`, `estudiante_id`, `oferta_laboral_id`, `fecha_postulacion`, `estado_preseleccion`, `estado_final_contrato`, `aspiracion_salarial`, `estado`, `created_at`, `updated_at`) VALUES
(1, 2, 2, '2020-12-11', 0, NULL, NULL, 1, '2020-12-11 18:10:59', '2020-12-13 23:27:24'),
(2, 2, 1, '2020-12-11', 1, NULL, NULL, 1, '2020-12-11 18:44:20', '2020-12-12 00:14:26'),
(3, 2, 2, '2020-12-11', 1, NULL, NULL, 1, '2020-12-11 18:45:04', '2020-12-11 21:06:04'),
(4, 2, 1, '2020-12-11', 0, NULL, NULL, 1, '2020-12-11 21:10:34', '2020-12-11 21:12:26'),
(5, 2, 1, '2020-12-11', 0, NULL, NULL, 1, '2020-12-12 00:08:02', '2020-12-12 00:08:02'),
(6, 2, 3, '2020-12-14', 0, NULL, NULL, 1, '2020-12-14 10:36:58', '2020-12-14 10:36:58'),
(7, 2, 3, '2020-12-14', 0, NULL, NULL, 1, '2020-12-14 10:37:13', '2020-12-14 10:37:13'),
(8, 2, 3, '2020-12-14', 0, NULL, NULL, 1, '2020-12-14 10:55:50', '2020-12-14 10:55:50');

-- --------------------------------------------------------

--
-- Table structure for table `provincia`
--

CREATE TABLE `provincia` (
  `id` int NOT NULL,
  `dpto_id` int NOT NULL,
  `nombre` varchar(50) CHARACTER SET utf8 COLLATE utf8_spanish2_ci NOT NULL,
  `estado` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Dumping data for table `provincia`
--

INSERT INTO `provincia` (`id`, `dpto_id`, `nombre`, `estado`, `created_at`, `updated_at`) VALUES
(1, 1, 'warnes', 1, '2020-12-06 19:54:20', '2020-12-06 19:54:20');

-- --------------------------------------------------------

--
-- Table structure for table `referencia`
--

CREATE TABLE `referencia` (
  `id` int NOT NULL,
  `estudiante_id` int NOT NULL,
  `nombre` varchar(100) CHARACTER SET utf8 COLLATE utf8_spanish2_ci NOT NULL,
  `apellidop` varchar(70) CHARACTER SET utf8 COLLATE utf8_spanish2_ci DEFAULT NULL,
  `apellidom` varchar(70) CHARACTER SET utf8 COLLATE utf8_spanish2_ci DEFAULT NULL,
  `telefono` varchar(15) CHARACTER SET utf8 COLLATE utf8_spanish2_ci DEFAULT NULL,
  `email` varchar(100) CHARACTER SET utf8 COLLATE utf8_spanish2_ci DEFAULT NULL,
  `trabajo` varchar(50) CHARACTER SET utf8 COLLATE utf8_spanish2_ci DEFAULT NULL,
  `estado` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- --------------------------------------------------------

--
-- Table structure for table `salario`
--

CREATE TABLE `salario` (
  `id` int NOT NULL,
  `nombre` varchar(60) CHARACTER SET utf8 COLLATE utf8_spanish2_ci NOT NULL,
  `estado` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Dumping data for table `salario`
--

INSERT INTO `salario` (`id`, `nombre`, `estado`, `created_at`, `updated_at`) VALUES
(1, 'De 2100 Bs. a 2.999 Bs.', 1, '2020-12-06 19:58:57', '2020-12-06 19:58:57'),
(2, 'De 3.000 Bs. a 3.999 Bs.', 1, '2020-12-06 19:58:57', '2020-12-06 19:58:57');

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `payload` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('QGxX0nRiNmMj9GnYG6GE3rVeiCi4G00nVebmNbgd', 7, '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.88 Safari/537.36', 'YTo1OntzOjY6Il90b2tlbiI7czo0MDoibG11eUg3b0pqUWlzYmpWWUVkam9OMWdhRkl4YlpyZWFDcm9veWp1NyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mzc6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9vZmVydGFzP2J1c2Nhcj0iO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX1zOjUwOiJsb2dpbl93ZWJfNTliYTM2YWRkYzJiMmY5NDAxNTgwZjAxNGM3ZjU4ZWE0ZTMwOTg5ZCI7aTo3O3M6MTc6InBhc3N3b3JkX2hhc2hfd2ViIjtzOjYwOiIkMnkkMTAkbVFkR0N6TGpPczFUeTRGcDZONWNLZUNDTGgvbTQzVi5HMjNMZWRDZURDZ1d1UWpPUkxZR20iO30=', 1607989861);

-- --------------------------------------------------------

--
-- Table structure for table `teams`
--

CREATE TABLE `teams` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `personal_team` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `teams`
--

INSERT INTO `teams` (`id`, `user_id`, `email`, `personal_team`, `created_at`, `updated_at`) VALUES
(1, 7, 'jesusgutierrez0106@gmail.com\'s Team', 1, '2020-12-07 15:52:17', '2020-12-07 15:52:17');

-- --------------------------------------------------------

--
-- Table structure for table `tipo_capa`
--

CREATE TABLE `tipo_capa` (
  `id` int NOT NULL,
  `nombre` varchar(100) CHARACTER SET utf8 COLLATE utf8_spanish2_ci NOT NULL,
  `estado` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tipo_sangre`
--

CREATE TABLE `tipo_sangre` (
  `id` int NOT NULL,
  `nombre` varchar(20) CHARACTER SET utf8 COLLATE utf8_spanish2_ci NOT NULL,
  `estado` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Dumping data for table `tipo_sangre`
--

INSERT INTO `tipo_sangre` (`id`, `nombre`, `estado`, `created_at`, `updated_at`) VALUES
(1, 'O negativo.', 1, '2020-12-06 19:58:57', '2020-12-06 19:58:57'),
(2, 'O positivo.', 1, '2020-12-06 19:58:57', '2020-12-06 19:58:57'),
(3, 'A negativo', 1, '2020-12-06 21:51:50', NULL),
(4, 'A positivo', 1, '2020-12-06 19:58:57', '2020-12-06 19:58:57'),
(5, 'B negativo', 1, '2020-12-06 19:58:57', '2020-12-06 19:58:57'),
(6, 'B positivo', 1, '2020-12-06 19:58:57', '2020-12-06 19:58:57'),
(7, 'AB negativo', 1, '2020-12-06 19:58:57', '2020-12-06 19:58:57'),
(8, 'AB positivo', 1, '2020-12-06 18:08:29', '2020-12-06 18:08:29');

-- --------------------------------------------------------

--
-- Table structure for table `tipo_sueldo`
--

CREATE TABLE `tipo_sueldo` (
  `id` int NOT NULL,
  `nombre` varchar(60) CHARACTER SET utf8 COLLATE utf8_spanish2_ci NOT NULL,
  `estado` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Dumping data for table `tipo_sueldo`
--

INSERT INTO `tipo_sueldo` (`id`, `nombre`, `estado`, `created_at`, `updated_at`) VALUES
(1, 'Por hora', 1, '2020-12-06 19:58:57', '2020-12-06 19:58:57'),
(2, 'Por Dia', 1, '2020-12-06 19:58:57', '2020-12-06 19:58:57');

-- --------------------------------------------------------

--
-- Table structure for table `tipo_usuario`
--

CREATE TABLE `tipo_usuario` (
  `id` int NOT NULL,
  `nombre` varchar(100) CHARACTER SET utf8 COLLATE utf8_spanish2_ci NOT NULL,
  `estado` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Dumping data for table `tipo_usuario`
--

INSERT INTO `tipo_usuario` (`id`, `nombre`, `estado`, `created_at`, `updated_at`) VALUES
(1, 'Administrador', 1, '2020-12-06 18:08:29', '2020-12-06 18:08:29'),
(2, 'Estudiante', 1, '2020-12-06 18:08:29', '2020-12-06 18:08:29'),
(3, 'Empresa', 1, '2020-12-06 18:09:44', '2020-12-06 18:09:44');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int NOT NULL,
  `tipo_usuario_id` int NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `two_factor_secret` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `two_factor_recovery_codes` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `profile_photo_path` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `estado` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `tipo_usuario_id`, `email`, `email_verified_at`, `password`, `two_factor_secret`, `two_factor_recovery_codes`, `remember_token`, `profile_photo_path`, `estado`, `created_at`, `updated_at`) VALUES
(7, 1, 'jesusgutierrez0106@gmail.com', NULL, '$2y$10$mQdGCzLjOs1Ty4Fp6N5cKeCCLh/m43V.G23LedCeDCgWuQjORLYGm', NULL, NULL, NULL, NULL, 1, '2020-12-07 15:52:17', '2020-12-13 23:10:26'),
(8, 2, 'Casimiro@gmail.com', NULL, '$2y$10$McDUDt9VdOsrtrbrdSS.d.Ieua6D9eAlInB2oYB.s8OCDhUCMgRBy', NULL, NULL, NULL, NULL, 1, '2020-12-07 16:56:27', '2020-12-13 23:07:18'),
(9, 3, 'gamin@gmail.com', NULL, '$2y$10$ZNsynXO/Y4eZNj0YfPgrZeeiSe7OteoF0EcPQVfCAu/JuSy.kdVoa', NULL, NULL, NULL, NULL, 1, '2020-12-07 17:16:08', '2020-12-13 23:13:44'),
(10, 3, 'puedeserzaszar@gmail.com', NULL, '$2y$10$9VgaV7sc7c3DEPoYtddUnurpZmztPw5QPg.M19aLkhLjwybwn5t6m', NULL, NULL, NULL, NULL, 1, '2020-12-07 21:44:35', '2020-12-14 18:03:52'),
(11, 2, 'asd@gmal.com', NULL, '$2y$10$OnxrFYtfxNS9wiXEIEBDseDc9.JlWtxp3judpMorf6sxLvzLjIriK', NULL, NULL, NULL, NULL, 0, '2020-12-07 21:47:58', '2020-12-13 13:27:18'),
(13, 2, 'elmlefco1@gmail.com', NULL, '$2y$10$pEi.30Ddvt6fo5cbMhA3D.P8N2p9FOaQKlvzzaIHr1By6cAaDiTVe', NULL, NULL, NULL, NULL, 0, '2020-12-07 21:54:12', '2020-12-13 22:13:39'),
(14, 2, 'prueba@gmail.com', NULL, '$2y$10$upGMrR7VAkRfg3kMrmtxUeMP7W6Dhym5qr1TVi59.rM4UVvOY.6EW', NULL, NULL, NULL, NULL, 0, '2020-12-07 22:04:15', '2020-12-13 22:09:53'),
(17, 2, 'prueba1@gmail.com', NULL, '$2y$10$GSgbuFw7S1YLv36C0TJDbey5d.3vsqnmD6sWV3fgUaf651nfVHt1O', NULL, NULL, NULL, NULL, 0, '2020-12-07 22:06:26', '2020-12-13 22:09:49'),
(18, 2, 'prueba2@gmail.com', NULL, '$2y$10$96npF8rF.ORaewtKR2MNjuR/2GQZoerhd.UqgiuO3mcfl.2WViFB2', NULL, NULL, NULL, NULL, 0, '2020-12-07 22:07:42', '2020-12-13 22:12:12'),
(19, 2, 'prueba3@gmail.com', NULL, '$2y$10$f4YagUGEsg5UIN1Lm.qDZuHh5f.N2dR9J/L4zjoWqCtxHQMmb5N2u', NULL, NULL, NULL, NULL, 0, '2020-12-07 22:35:08', '2020-12-13 22:55:26'),
(21, 2, 'prueba4@gmail.com', NULL, '$2y$10$gOcRHTQ.RM3gGfSeu2SAMOd9ZuZP0sL45RZlUr//HDvWmR.ymUygG', NULL, NULL, NULL, NULL, 0, '2020-12-07 22:38:59', '2020-12-13 22:09:43'),
(23, 2, 'prueba5@gmail.com', NULL, '$2y$10$VKDqr8q8RzrzHvfnZXMWbeCsw6J1KQ8GbgMnXJc3.WNE.IpBExKTO', NULL, NULL, NULL, NULL, 0, '2020-12-07 22:39:48', '2020-12-13 22:56:50'),
(24, 2, 'prueba6@gmail.com', NULL, '$2y$10$rkiGQonvMNSblt5zD.lF.upV3IrBNJk3OQcTWWUEPf8K2Z8p16E8i', NULL, NULL, NULL, NULL, 0, '2020-12-08 00:24:15', '2020-12-13 22:57:00'),
(25, 3, 'prueba7@gmail.com', NULL, '$2y$10$rrmQusVjv5ub9qu/JWp2bu2yhXLfYdhsGvW75OJ9GZ50rlNaoMp2u', NULL, NULL, NULL, NULL, 0, '2020-12-10 18:49:39', '2020-12-13 22:55:45'),
(26, 3, 'prueba8@gmail.com', NULL, '$2y$10$I1HddX265PpkDQTmapH3f.zNCqewSL2zJhhVtQ7LZg34ExM4UbmNi', NULL, NULL, NULL, NULL, 0, '2020-12-10 19:30:53', '2020-12-13 22:56:42'),
(27, 3, 'prueba10@gmail.com', NULL, '$2y$10$moTA/BVeY8nofbMAQ63UiO3MsjjYnpwQERsF3ZcqghYPXmAsLIila', NULL, NULL, NULL, NULL, 1, '2020-12-14 18:04:27', '2020-12-14 18:04:27'),
(28, 3, 'prueba11@gmail.com', NULL, '$2y$10$M6RpKVZqDi5jsklhY0ICKuQfJGhnxs.OlPvPiPLepAitwq8r80apO', NULL, NULL, NULL, NULL, 1, '2020-12-14 20:59:25', '2020-12-14 20:59:25'),
(29, 2, 'prueba12@gmail.com', NULL, '$2y$10$3OhAvKtX97ic1eEM6MMMpuEJ6em5xKpR8ENXBb2YmYATyTQ8q5vli', NULL, NULL, NULL, NULL, 1, '2020-12-14 22:30:35', '2020-12-14 22:30:35');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `area_capa`
--
ALTER TABLE `area_capa`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `area_laboral`
--
ALTER TABLE `area_laboral`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `capacitacion`
--
ALTER TABLE `capacitacion`
  ADD PRIMARY KEY (`id`),
  ADD KEY `capacitacion_estudiante_id` (`estudiante_id`),
  ADD KEY `capacitacion_area_capa_id` (`area_capa_id`),
  ADD KEY `capacitacion_tipo_capa_id` (`tipo_capa_id`);

--
-- Indexes for table `carrera`
--
ALTER TABLE `carrera`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contacto`
--
ALTER TABLE `contacto`
  ADD PRIMARY KEY (`id`),
  ADD KEY `contacto_empresa_id` (`empresa_id`),
  ADD KEY `contacto_users_id` (`users_id`);

--
-- Indexes for table `contrato`
--
ALTER TABLE `contrato`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `departamento`
--
ALTER TABLE `departamento`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `empresa`
--
ALTER TABLE `empresa`
  ADD PRIMARY KEY (`id`),
  ADD KEY `empresa_departamento_id` (`dpto_id`);

--
-- Indexes for table `estado_civil`
--
ALTER TABLE `estado_civil`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `estudiante`
--
ALTER TABLE `estudiante`
  ADD PRIMARY KEY (`id`),
  ADD KEY `estudiante_users_id` (`users_id`),
  ADD KEY `estudiante_tipo_sangre_id` (`tipo_sangre_id`),
  ADD KEY `estudiante_estado_civil_id` (`estado_civil_id`),
  ADD KEY `estudiante_genero_id` (`genero_id`),
  ADD KEY `estudiante_provincia_id` (`provincia_id`);

--
-- Indexes for table `estudios_idioma`
--
ALTER TABLE `estudios_idioma`
  ADD PRIMARY KEY (`id`),
  ADD KEY `estudios_idioma_estudiante_id` (`estudiante_id`),
  ADD KEY `estudios_idioma_idioma_id` (`idioma_id`);

--
-- Indexes for table `exp_laboral`
--
ALTER TABLE `exp_laboral`
  ADD PRIMARY KEY (`id`),
  ADD KEY `exp_laboral_estudiante_id` (`estudiante_id`),
  ADD KEY `exp_laboral_area_laboral_id` (`area_laboral_id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `genero`
--
ALTER TABLE `genero`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `idioma`
--
ALTER TABLE `idioma`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `inf_vocacional`
--
ALTER TABLE `inf_vocacional`
  ADD PRIMARY KEY (`id`),
  ADD KEY `inf_vocacional_estudiante_id` (`estudiante_id`),
  ADD KEY `inf_vocacional_carrera_id` (`carrera_id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oferta_laboral`
--
ALTER TABLE `oferta_laboral`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oferta_laboral_carrera_id` (`carrera_id`),
  ADD KEY `oferta_laboral_salario_id` (`salario_id`),
  ADD KEY `oferta_laboral_tipo_sueldo_id` (`tipo_sueldo_id`),
  ADD KEY `oferta_laboral_contrato_id` (`contrato_id`),
  ADD KEY `oferta_laboral_empresa_id` (`empresa_id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `personal`
--
ALTER TABLE `personal`
  ADD PRIMARY KEY (`id`),
  ADD KEY `personal_users_id` (`users_id`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `postular_oferta`
--
ALTER TABLE `postular_oferta`
  ADD PRIMARY KEY (`id`),
  ADD KEY `postular_oferta_estudiante_id` (`estudiante_id`),
  ADD KEY `postular_oferta_oferta_laboral_id` (`oferta_laboral_id`);

--
-- Indexes for table `provincia`
--
ALTER TABLE `provincia`
  ADD PRIMARY KEY (`id`),
  ADD KEY `provincia_departamento_id` (`dpto_id`);

--
-- Indexes for table `referencia`
--
ALTER TABLE `referencia`
  ADD PRIMARY KEY (`id`),
  ADD KEY `referencia_estudiante_id` (`estudiante_id`);

--
-- Indexes for table `salario`
--
ALTER TABLE `salario`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `teams`
--
ALTER TABLE `teams`
  ADD PRIMARY KEY (`id`),
  ADD KEY `teams_user_id_index` (`user_id`);

--
-- Indexes for table `tipo_capa`
--
ALTER TABLE `tipo_capa`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tipo_sangre`
--
ALTER TABLE `tipo_sangre`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tipo_sueldo`
--
ALTER TABLE `tipo_sueldo`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tipo_usuario`
--
ALTER TABLE `tipo_usuario`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD KEY `users_tipo_usuario_id` (`tipo_usuario_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `area_capa`
--
ALTER TABLE `area_capa`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `area_laboral`
--
ALTER TABLE `area_laboral`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `capacitacion`
--
ALTER TABLE `capacitacion`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `carrera`
--
ALTER TABLE `carrera`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `contacto`
--
ALTER TABLE `contacto`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `contrato`
--
ALTER TABLE `contrato`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `departamento`
--
ALTER TABLE `departamento`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `empresa`
--
ALTER TABLE `empresa`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `estado_civil`
--
ALTER TABLE `estado_civil`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `estudiante`
--
ALTER TABLE `estudiante`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `estudios_idioma`
--
ALTER TABLE `estudios_idioma`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `exp_laboral`
--
ALTER TABLE `exp_laboral`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `genero`
--
ALTER TABLE `genero`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `idioma`
--
ALTER TABLE `idioma`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `inf_vocacional`
--
ALTER TABLE `inf_vocacional`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `oferta_laboral`
--
ALTER TABLE `oferta_laboral`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `personal`
--
ALTER TABLE `personal`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `postular_oferta`
--
ALTER TABLE `postular_oferta`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `provincia`
--
ALTER TABLE `provincia`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `referencia`
--
ALTER TABLE `referencia`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `salario`
--
ALTER TABLE `salario`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `teams`
--
ALTER TABLE `teams`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tipo_capa`
--
ALTER TABLE `tipo_capa`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tipo_sangre`
--
ALTER TABLE `tipo_sangre`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `tipo_sueldo`
--
ALTER TABLE `tipo_sueldo`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tipo_usuario`
--
ALTER TABLE `tipo_usuario`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `capacitacion`
--
ALTER TABLE `capacitacion`
  ADD CONSTRAINT `capacitacion_area_capa_id` FOREIGN KEY (`area_capa_id`) REFERENCES `area_capa` (`id`),
  ADD CONSTRAINT `capacitacion_estudiante_id` FOREIGN KEY (`estudiante_id`) REFERENCES `estudiante` (`id`),
  ADD CONSTRAINT `capacitacion_tipo_capa_id` FOREIGN KEY (`tipo_capa_id`) REFERENCES `tipo_capa` (`id`);

--
-- Constraints for table `contacto`
--
ALTER TABLE `contacto`
  ADD CONSTRAINT `contacto_empresa_id` FOREIGN KEY (`empresa_id`) REFERENCES `empresa` (`id`),
  ADD CONSTRAINT `contacto_users_id` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `empresa`
--
ALTER TABLE `empresa`
  ADD CONSTRAINT `empresa_departamento_id` FOREIGN KEY (`dpto_id`) REFERENCES `departamento` (`id`);

--
-- Constraints for table `estudiante`
--
ALTER TABLE `estudiante`
  ADD CONSTRAINT `estudiante_estado_civil_id` FOREIGN KEY (`estado_civil_id`) REFERENCES `estado_civil` (`id`),
  ADD CONSTRAINT `estudiante_genero_id` FOREIGN KEY (`genero_id`) REFERENCES `genero` (`id`),
  ADD CONSTRAINT `estudiante_provincia_id` FOREIGN KEY (`provincia_id`) REFERENCES `provincia` (`id`),
  ADD CONSTRAINT `estudiante_tipo_sangre_id` FOREIGN KEY (`tipo_sangre_id`) REFERENCES `tipo_sangre` (`id`),
  ADD CONSTRAINT `estudiante_users_id` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `estudios_idioma`
--
ALTER TABLE `estudios_idioma`
  ADD CONSTRAINT `estudios_idioma_estudiante_id` FOREIGN KEY (`estudiante_id`) REFERENCES `estudiante` (`id`),
  ADD CONSTRAINT `estudios_idioma_idioma_id` FOREIGN KEY (`idioma_id`) REFERENCES `idioma` (`id`);

--
-- Constraints for table `exp_laboral`
--
ALTER TABLE `exp_laboral`
  ADD CONSTRAINT `exp_laboral_area_laboral_id` FOREIGN KEY (`area_laboral_id`) REFERENCES `area_laboral` (`id`),
  ADD CONSTRAINT `exp_laboral_estudiante_id` FOREIGN KEY (`estudiante_id`) REFERENCES `estudiante` (`id`);

--
-- Constraints for table `inf_vocacional`
--
ALTER TABLE `inf_vocacional`
  ADD CONSTRAINT `inf_vocacional_carrera_id` FOREIGN KEY (`carrera_id`) REFERENCES `carrera` (`id`),
  ADD CONSTRAINT `inf_vocacional_estudiante_id` FOREIGN KEY (`estudiante_id`) REFERENCES `estudiante` (`id`);

--
-- Constraints for table `oferta_laboral`
--
ALTER TABLE `oferta_laboral`
  ADD CONSTRAINT `oferta_laboral_carrera_id` FOREIGN KEY (`carrera_id`) REFERENCES `carrera` (`id`),
  ADD CONSTRAINT `oferta_laboral_contrato_id` FOREIGN KEY (`contrato_id`) REFERENCES `contrato` (`id`),
  ADD CONSTRAINT `oferta_laboral_empresa_id` FOREIGN KEY (`empresa_id`) REFERENCES `empresa` (`id`),
  ADD CONSTRAINT `oferta_laboral_salario_id` FOREIGN KEY (`salario_id`) REFERENCES `salario` (`id`),
  ADD CONSTRAINT `oferta_laboral_tipo_sueldo_id` FOREIGN KEY (`tipo_sueldo_id`) REFERENCES `tipo_sueldo` (`id`);

--
-- Constraints for table `personal`
--
ALTER TABLE `personal`
  ADD CONSTRAINT `personal_users_id` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `postular_oferta`
--
ALTER TABLE `postular_oferta`
  ADD CONSTRAINT `postular_oferta_estudiante_id` FOREIGN KEY (`estudiante_id`) REFERENCES `estudiante` (`id`),
  ADD CONSTRAINT `postular_oferta_oferta_laboral_id` FOREIGN KEY (`oferta_laboral_id`) REFERENCES `oferta_laboral` (`id`);

--
-- Constraints for table `provincia`
--
ALTER TABLE `provincia`
  ADD CONSTRAINT `provincia_departamento_id` FOREIGN KEY (`dpto_id`) REFERENCES `departamento` (`id`);

--
-- Constraints for table `referencia`
--
ALTER TABLE `referencia`
  ADD CONSTRAINT `referencia_estudiante_id` FOREIGN KEY (`estudiante_id`) REFERENCES `estudiante` (`id`);

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_tipo_usuario_id` FOREIGN KEY (`tipo_usuario_id`) REFERENCES `tipo_usuario` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
