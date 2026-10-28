import 'package:flutter/material.dart';

import '../features/catalogo/models/destino.dart';
import 'etiqueta_categoria.dart';

class TarjetaDestino extends StatelessWidget {
  final Destino destino;
  final VoidCallback onTap;
  final bool compacta;

  const TarjetaDestino({
    super.key,
    required this.destino,
    required this.onTap,
    this.compacta = false,
  });

  @override
  Widget build(BuildContext context) {
    final textos = Theme.of(context).textTheme;

    final Widget portada = PortadaDestino(
      icono: destino.icono,
      heroTag: compacta ? 'inicio-${destino.id}' : destino.id,
    );

    if (compacta) {
      return SizedBox(
        width: 200,
        child: Card(
          child: InkWell(
            onTap: onTap,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 110, width: double.infinity, child: portada),
                Padding(
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        destino.nombre,
                        style: textos.titleMedium,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 4),
                      Text(destino.municipio, style: textos.bodyMedium),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }

    return Card(
      child: InkWell(
        onTap: onTap,
        // IntrinsicHeight + stretch: la portada crece a la altura del texto,
        // así la tarjeta nunca se desborda aunque el nombre ocupe 2 líneas.
        child: IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ConstrainedBox(
                constraints: const BoxConstraints(minHeight: 130),
                child: SizedBox(width: 110, child: portada),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        destino.nombre,
                        style: textos.titleMedium,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 4),
                      Text(
                        destino.resumen,
                        style: textos.bodyMedium,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 6),
                      EtiquetaCategoria(categoria: destino.categoria),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// Portada con degradado de los colores del tema + icono del destino.
/// También la usa la pantalla de Detalle (a tamaño grande).
class PortadaDestino extends StatelessWidget {
  final IconData icono;
  final String heroTag;
  final double tamanoIcono;

  const PortadaDestino({
    super.key,
    required this.icono,
    required this.heroTag,
    this.tamanoIcono = 48,
  });

  @override
  Widget build(BuildContext context) {
    final esquema = Theme.of(context).colorScheme;
    return Hero(
      tag: heroTag,
      child: DecoratedBox(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [esquema.primary, esquema.secondary],
          ),
        ),
        child: Center(
          child: Icon(icono, size: tamanoIcono, color: esquema.onPrimary),
        ),
      ),
    );
  }
}
