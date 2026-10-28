import 'package:flutter/material.dart';

/// WIDGET 1 · EncabezadoSeccion (Integrante 1)
///
/// Título + subtítulo opcional + acción opcional a la derecha.
/// Se reutiliza en Inicio ("Destacados", "Explora por categoría")
/// y en Detalle ("Qué hacer").
class EncabezadoSeccion extends StatelessWidget {
  final String titulo;
  final String? subtitulo;
  final IconData? icono;
  final String? textoAccion;
  final VoidCallback? alPresionarAccion;

  const EncabezadoSeccion({
    super.key,
    required this.titulo,
    this.subtitulo,
    this.icono,
    this.textoAccion,
    this.alPresionarAccion,
  });

  @override
  Widget build(BuildContext context) {
    // Todo el estilo viene del tema global, no está escrito aquí.
    final tema = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.only(top: 20, bottom: 8),
      child: Row(
        children: [
          if (icono != null) ...[
            Icon(icono, size: 22),
            const SizedBox(width: 8),
          ],
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(titulo, style: tema.textTheme.titleLarge),
                if (subtitulo != null)
                  Text(subtitulo!, style: tema.textTheme.bodyMedium),
              ],
            ),
          ),
          if (textoAccion != null)
            TextButton(onPressed: alPresionarAccion, child: Text(textoAccion!)),
        ],
      ),
    );
  }
}
