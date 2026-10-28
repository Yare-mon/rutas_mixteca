import 'package:flutter/material.dart';

import '../../widgets/etiqueta_categoria.dart';
import '../../widgets/tarjeta_destino.dart';
import 'data/destinos_data.dart';
import 'detalle_screen.dart';
import 'models/destino.dart';

/// PANTALLA 2 · Catálogo (Integrante 2)
///
/// Lista filtrable por categoría. En pantallas anchas (tablet u
/// horizontal) muestra 2 columnas gracias a LayoutBuilder.
class CatalogoScreen extends StatefulWidget {
  final Categoria? categoriaInicial;

  const CatalogoScreen({super.key, this.categoriaInicial});

  @override
  State<CatalogoScreen> createState() => _CatalogoScreenState();
}

class _CatalogoScreenState extends State<CatalogoScreen> {
  Categoria? _filtro; // null = todas

  @override
  void initState() {
    super.initState();
    _filtro = widget.categoriaInicial;
  }

  void _abrirDetalle(Destino destino) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => DetalleScreen(destino: destino)),
    );
  }

  @override
  Widget build(BuildContext context) {
    final lista = _filtro == null
        ? destinos
        : destinos.where((d) => d.categoria == _filtro).toList();

    return Scaffold(
      appBar: AppBar(title: const Text('Catálogo')),
      body: Column(
        children: [
          // ---- Filtros: WIDGET 3 en modo interactivo ----
          SizedBox(
            height: 56,
            child: ListView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              children: [null, ...Categoria.values]
                  .map(
                    (c) => Padding(
                      padding: const EdgeInsets.only(right: 8),
                      child: EtiquetaCategoria(
                        categoria: c,
                        seleccionada: _filtro == c,
                        alTocar: (nueva) => setState(() => _filtro = nueva),
                      ),
                    ),
                  )
                  .toList(),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                '${lista.length} destino(s)',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
          ),

          // ---- Lista: WIDGET 4 en modo fila ----
          Expanded(
            child: LayoutBuilder(
              builder: (context, restricciones) {
                final int columnas = restricciones.maxWidth >= 700 ? 2 : 1;
                return GridView.builder(
                  padding: const EdgeInsets.all(16),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: columnas,
                    crossAxisSpacing: 12,
                    mainAxisExtent: 146,
                  ),
                  itemCount: lista.length,
                  itemBuilder: (_, i) => TarjetaDestino(
                    destino: lista[i],
                    onTap: () => _abrirDetalle(lista[i]),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
