import 'package:flutter/material.dart';

import '../features/catalogo/models/destino.dart';

/// WIDGET 3 · EtiquetaCategoria (Integrante 2)
///
/// Etiqueta con el icono y nombre de una categoría.
/// - En Catálogo funciona como filtro (`seleccionada` + `alTocar`).
/// - En Inicio sirve como acceso rápido a una categoría.
/// - En Tarjeta y Detalle es solo informativa (sin `alTocar`).
class EtiquetaCategoria extends StatelessWidget {
  final Categoria? categoria; // null = "Todas"
  final bool seleccionada;
  final ValueChanged<Categoria?>? alTocar;

  const EtiquetaCategoria({
    super.key,
    required this.categoria,
    this.seleccionada = false,
    this.alTocar,
  });

  @override
  Widget build(BuildContext context) {
    final esquema = Theme.of(context).colorScheme;
    final String texto = categoria?.nombre ?? 'Todas';
    final IconData icono = categoria?.icono ?? Icons.apps_rounded;
    final Color colorContenido =
        seleccionada ? esquema.onSecondary : esquema.onSecondaryContainer;

    // Solo lectura: etiqueta compacta sin interacción.
    if (alTocar == null) {
      return Chip(
        avatar: Icon(icono, size: 16, color: colorContenido),
        label: Text(texto),
        visualDensity: VisualDensity.compact,
      );
    }

    // Interactiva: filtro seleccionable.
    return ChoiceChip(
      avatar: Icon(icono, size: 16, color: colorContenido),
      label: Text(texto, style: TextStyle(color: colorContenido)),
      selected: seleccionada,
      showCheckmark: false,
      onSelected: (_) => alTocar!(categoria),
    );
  }
}
