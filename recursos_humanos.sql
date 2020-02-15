-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 15-02-2020 a las 03:15:01
-- Versión del servidor: 10.4.11-MariaDB
-- Versión de PHP: 7.3.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `recursos_humanos`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `candidato`
--

CREATE TABLE `candidato` (
  `Curp` varchar(18) NOT NULL,
  `RFC` varchar(13) NOT NULL,
  `Nombre` varchar(50) NOT NULL,
  `Domicilio` varchar(100) NOT NULL,
  `Telefono` varchar(15) NOT NULL,
  `Email` varchar(50) NOT NULL,
  `Sexo` char(1) NOT NULL,
  `Edad` tinyint(2) NOT NULL,
  `NSS` varchar(11) NOT NULL,
  `Fotografia` blob NOT NULL,
  `idEstado_Civil` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `candidato_has_habilidad`
--

CREATE TABLE `candidato_has_habilidad` (
  `Curp` varchar(18) NOT NULL,
  `idHabilidad` int(11) NOT NULL,
  `Nivel` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `candidato_has_idioma`
--

CREATE TABLE `candidato_has_idioma` (
  `Curp` varchar(18) NOT NULL,
  `idIdioma` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `carrera`
--

CREATE TABLE `carrera` (
  `idCarrera` int(11) NOT NULL,
  `Descripcion` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estado_civil`
--

CREATE TABLE `estado_civil` (
  `idEstado_Civil` int(11) NOT NULL,
  `Descripcion` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `experiencia`
--

CREATE TABLE `experiencia` (
  `idExperiencia` int(11) NOT NULL,
  `Nombre_Empresa` varchar(150) NOT NULL,
  `Descripcion_Puesto` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `experiencia_has_candidato`
--

CREATE TABLE `experiencia_has_candidato` (
  `Curp` varchar(18) NOT NULL,
  `idExperiencia` int(11) NOT NULL,
  `Nombre_Empresa` varchar(150) NOT NULL,
  `Años` tinyint(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `habilidad`
--

CREATE TABLE `habilidad` (
  `idHabilidad` int(11) NOT NULL,
  `Descripcion` varchar(100) NOT NULL,
  `Nivel` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `idioma`
--

CREATE TABLE `idioma` (
  `idIdioma` int(11) NOT NULL,
  `Lenguaje` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `nivel_academico`
--

CREATE TABLE `nivel_academico` (
  `idNivel_Academico` int(11) NOT NULL,
  `Descripcion` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `nivel_academico_has_candidato`
--

CREATE TABLE `nivel_academico_has_candidato` (
  `Curp` varchar(18) NOT NULL,
  `idNivel_Academico` int(11) NOT NULL,
  `idCarrera` int(11) NOT NULL,
  `Institucion` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `nivel_idioma`
--

CREATE TABLE `nivel_idioma` (
  `idNivel_Idioma` int(11) NOT NULL,
  `Descripcion` varchar(50) NOT NULL,
  `idIdioma` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `candidato`
--
ALTER TABLE `candidato`
  ADD PRIMARY KEY (`Curp`),
  ADD KEY `idEstado_Civil` (`idEstado_Civil`);

--
-- Indices de la tabla `candidato_has_habilidad`
--
ALTER TABLE `candidato_has_habilidad`
  ADD PRIMARY KEY (`Curp`,`idHabilidad`),
  ADD KEY `idHabilidad` (`idHabilidad`);

--
-- Indices de la tabla `candidato_has_idioma`
--
ALTER TABLE `candidato_has_idioma`
  ADD PRIMARY KEY (`Curp`,`idIdioma`),
  ADD KEY `idIdioma` (`idIdioma`);

--
-- Indices de la tabla `carrera`
--
ALTER TABLE `carrera`
  ADD PRIMARY KEY (`idCarrera`);

--
-- Indices de la tabla `estado_civil`
--
ALTER TABLE `estado_civil`
  ADD PRIMARY KEY (`idEstado_Civil`);

--
-- Indices de la tabla `experiencia`
--
ALTER TABLE `experiencia`
  ADD PRIMARY KEY (`idExperiencia`);

--
-- Indices de la tabla `experiencia_has_candidato`
--
ALTER TABLE `experiencia_has_candidato`
  ADD PRIMARY KEY (`Curp`,`idExperiencia`),
  ADD KEY `idExperiencia` (`idExperiencia`);

--
-- Indices de la tabla `habilidad`
--
ALTER TABLE `habilidad`
  ADD PRIMARY KEY (`idHabilidad`);

--
-- Indices de la tabla `idioma`
--
ALTER TABLE `idioma`
  ADD PRIMARY KEY (`idIdioma`);

--
-- Indices de la tabla `nivel_academico`
--
ALTER TABLE `nivel_academico`
  ADD PRIMARY KEY (`idNivel_Academico`);

--
-- Indices de la tabla `nivel_academico_has_candidato`
--
ALTER TABLE `nivel_academico_has_candidato`
  ADD PRIMARY KEY (`Curp`,`idNivel_Academico`,`idCarrera`),
  ADD KEY `idNivel_Academico` (`idNivel_Academico`),
  ADD KEY `idCarrera` (`idCarrera`);

--
-- Indices de la tabla `nivel_idioma`
--
ALTER TABLE `nivel_idioma`
  ADD PRIMARY KEY (`idIdioma`,`idNivel_Idioma`),
  ADD KEY `idNivel_Idioma` (`idNivel_Idioma`,`idIdioma`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `carrera`
--
ALTER TABLE `carrera`
  MODIFY `idCarrera` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `estado_civil`
--
ALTER TABLE `estado_civil`
  MODIFY `idEstado_Civil` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `experiencia`
--
ALTER TABLE `experiencia`
  MODIFY `idExperiencia` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `habilidad`
--
ALTER TABLE `habilidad`
  MODIFY `idHabilidad` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `idioma`
--
ALTER TABLE `idioma`
  MODIFY `idIdioma` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `nivel_academico`
--
ALTER TABLE `nivel_academico`
  MODIFY `idNivel_Academico` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `candidato`
--
ALTER TABLE `candidato`
  ADD CONSTRAINT `candidato_ibfk_1` FOREIGN KEY (`idEstado_Civil`) REFERENCES `estado_civil` (`idEstado_Civil`);

--
-- Filtros para la tabla `candidato_has_habilidad`
--
ALTER TABLE `candidato_has_habilidad`
  ADD CONSTRAINT `candidato_has_habilidad_ibfk_1` FOREIGN KEY (`Curp`) REFERENCES `candidato` (`Curp`),
  ADD CONSTRAINT `candidato_has_habilidad_ibfk_2` FOREIGN KEY (`idHabilidad`) REFERENCES `habilidad` (`idHabilidad`);

--
-- Filtros para la tabla `candidato_has_idioma`
--
ALTER TABLE `candidato_has_idioma`
  ADD CONSTRAINT `candidato_has_idioma_ibfk_1` FOREIGN KEY (`Curp`) REFERENCES `candidato` (`Curp`),
  ADD CONSTRAINT `candidato_has_idioma_ibfk_2` FOREIGN KEY (`idIdioma`) REFERENCES `idioma` (`idIdioma`);

--
-- Filtros para la tabla `experiencia_has_candidato`
--
ALTER TABLE `experiencia_has_candidato`
  ADD CONSTRAINT `experiencia_has_candidato_ibfk_1` FOREIGN KEY (`idExperiencia`) REFERENCES `experiencia` (`idExperiencia`),
  ADD CONSTRAINT `experiencia_has_candidato_ibfk_2` FOREIGN KEY (`Curp`) REFERENCES `candidato` (`Curp`);

--
-- Filtros para la tabla `nivel_academico_has_candidato`
--
ALTER TABLE `nivel_academico_has_candidato`
  ADD CONSTRAINT `nivel_academico_has_candidato_ibfk_1` FOREIGN KEY (`idNivel_Academico`) REFERENCES `nivel_academico` (`idNivel_Academico`),
  ADD CONSTRAINT `nivel_academico_has_candidato_ibfk_2` FOREIGN KEY (`idCarrera`) REFERENCES `carrera` (`idCarrera`),
  ADD CONSTRAINT `nivel_academico_has_candidato_ibfk_3` FOREIGN KEY (`Curp`) REFERENCES `candidato` (`Curp`),
  ADD CONSTRAINT `nivel_academico_has_candidato_ibfk_4` FOREIGN KEY (`Curp`) REFERENCES `candidato` (`Curp`);

--
-- Filtros para la tabla `nivel_idioma`
--
ALTER TABLE `nivel_idioma`
  ADD CONSTRAINT `nivel_idioma_ibfk_1` FOREIGN KEY (`idIdioma`) REFERENCES `idioma` (`idIdioma`),
  ADD CONSTRAINT `nivel_idioma_ibfk_2` FOREIGN KEY (`idIdioma`) REFERENCES `idioma` (`idIdioma`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
