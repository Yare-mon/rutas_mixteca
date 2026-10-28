import 'package:flutter/material.dart';

import '../../widgets/boton_principal.dart';
import '../../widgets/encabezado_seccion.dart';
import '../../widgets/etiqueta_categoria.dart';
import '../../widgets/tarjeta_destino.dart';
import 'models/destino.dart';

/// PANTALLA 3 · Detalle (Integrante 2)
class DetalleScreen extends StatelessWidget {
  final Destino destino;

  const DetalleScreen({super.key, required this.destino});

  @override
  Widget build(BuildContext context) {
    final tema = Theme.of(context);

    return Scaffold(
      appBar: AppBar(title: Text(destino.categoria.nombre)),
      body: ListView(
        children: [
          SizedBox(
            height: 220,
            child: PortadaDestino(
              icono: destino.icono,
              heroTag: destino.id,
              tamanoIcono: 96,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                EtiquetaCategoria(categoria: destino.categoria),
                const SizedBox(height: 8),
                Text(destino.nombre, style: tema.textTheme.headlineMedium),
                const SizedBox(height: 4),
                Row(
                  children: [
                    const Icon(Icons.place_rounded, size: 18),
                    const SizedBox(width: 4),
                    Expanded(
                      child: Text(
                        destino.municipio,
                        style: tema.textTheme.bodyMedium,
                      ),
                    ),
                  ],
                ),
                const Divider(height: 32),
                Text(destino.descripcion, style: tema.textTheme.bodyLarge),

                // WIDGET 1 reutilizado en otra pantalla
                const EncabezadoSeccion(
                  titulo: 'Qué hacer',
                  icono: Icons.hiking_rounded,
                ),
                Card(
                  child: Column(
                    children: destino.actividades
                        .map(
                          (a) => ListTile(
                            leading: Icon(
                              Icons.check_circle_rounded,
                              color: tema.colorScheme.secondary,
                            ),
                            title: Text(a, style: tema.textTheme.bodyLarge),
                            dense: true,
                          ),
                        )
                        .toList(),
                  ),
                ),
                const SizedBox(height: 24),

                // WIDGET 2 en su variante de contorno
                BotonPrincipal(
                  texto: 'Volver',
                  icono: Icons.undo_rounded,
                  contorno: true,
                  onPressed: () => Navigator.pop(context),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
