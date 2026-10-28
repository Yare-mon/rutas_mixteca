import 'package:flutter/material.dart';

import '../../widgets/boton_principal.dart';
import '../../widgets/encabezado_seccion.dart';
import '../../widgets/etiqueta_categoria.dart';
import '../../widgets/tarjeta_destino.dart';
import '../catalogo/catalogo_screen.dart';
import '../catalogo/data/destinos_data.dart';
import '../catalogo/detalle_screen.dart';
import '../catalogo/models/destino.dart';

/// PANTALLA 1 · Inicio (Integrante 1)
class InicioScreen extends StatelessWidget {
  const InicioScreen({super.key});

  void _abrirCatalogo(BuildContext context, [Categoria? categoria]) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => CatalogoScreen(categoriaInicial: categoria),
      ),
    );
  }

  void _abrirDetalle(BuildContext context, Destino destino) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => DetalleScreen(destino: destino)),
    );
  }

  @override
  Widget build(BuildContext context) {
    final tema = Theme.of(context);
    final destacados = destinos.where((d) => d.destacado).toList();

    return Scaffold(
      appBar: AppBar(title: const Text('Rutas Mixtecas')),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        children: [
          // ---- Bienvenida (usa colores del tema) ----
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: tema.colorScheme.primaryContainer,
              borderRadius: BorderRadius.circular(18),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Descubre la Mixteca',
                  style: tema.textTheme.headlineMedium,
                ),
                const SizedBox(height: 8),
                Text(
                  'Cañones, conventos, zonas arqueológicas y mercados '
                  'de la región, en un solo lugar.',
                  style: tema.textTheme.bodyLarge,
                ),
              ],
            ),
          ),

          // ---- WIDGET 1 reutilizado ----
          EncabezadoSeccion(
            titulo: 'Destacados',
            subtitulo: 'Los favoritos de quienes visitan',
            icono: Icons.star_rounded,
            textoAccion: 'Ver todos',
            alPresionarAccion: () => _abrirCatalogo(context),
          ),

          // ---- WIDGET 4 en modo compacto ----
          SizedBox(
            height: 230,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: destacados.length,
              separatorBuilder: (_, __) => const SizedBox(width: 12),
              itemBuilder: (_, i) => TarjetaDestino(
                destino: destacados[i],
                compacta: true,
                onTap: () => _abrirDetalle(context, destacados[i]),
              ),
            ),
          ),

          // ---- WIDGET 1 de nuevo, con otros datos ----
          const EncabezadoSeccion(
            titulo: 'Explora por categoría',
            icono: Icons.category_rounded,
          ),

          // ---- WIDGET 3 como acceso rápido ----
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: Categoria.values
                .map(
                  (c) => EtiquetaCategoria(
                    categoria: c,
                    alTocar: (categoria) => _abrirCatalogo(context, categoria),
                  ),
                )
                .toList(),
          ),
          const SizedBox(height: 28),

          // ---- WIDGET 2 ----
          BotonPrincipal(
            texto: 'Ver catálogo completo',
            icono: Icons.map_rounded,
            onPressed: () => _abrirCatalogo(context),
          ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }
}
