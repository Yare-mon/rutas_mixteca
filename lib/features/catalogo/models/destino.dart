import 'package:flutter/material.dart';

/// Categorías posibles de un destino.
enum Categoria {
  naturaleza('Naturaleza', Icons.forest_rounded),
  historia('Historia', Icons.account_balance_rounded),
  arqueologia('Arqueología', Icons.terrain_rounded),
  cultura('Cultura', Icons.storefront_rounded);

  const Categoria(this.nombre, this.icono);

  final String nombre;
  final IconData icono;
}

/// Modelo de un destino turístico del catálogo.
class Destino {
  final String id;
  final String nombre;
  final String municipio;
  final Categoria categoria;
  final String resumen;
  final String descripcion;
  final IconData icono;
  final List<String> actividades;
  final bool destacado;

  const Destino({
    required this.id,
    required this.nombre,
    required this.municipio,
    required this.categoria,
    required this.resumen,
    required this.descripcion,
    required this.icono,
    required this.actividades,
    this.destacado = false,
  });
}
