import 'package:flutter/material.dart';

import '../../widgets/etiqueta_categoria.dart';
import '../../widgets/tarjeta_destino.dart';
import 'data/destinos_data.dart';
import 'detalle_screen.dart';
import 'models/destino.dart';

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
                // Pantalla angosta (celular vertical): lista normal, cada
                // tarjeta mide lo que necesite su contenido.
                if (restricciones.maxWidth < 700) {
                  return ListView.builder(
                    padding: const EdgeInsets.all(16),
                    itemCount: lista.length,
                    itemBuilder: (_, i) => TarjetaDestino(
                      destino: lista[i],
                      onTap: () => _abrirDetalle(lista[i]),
                    ),
                  );
                }
                // Pantalla ancha (tablet u horizontal): 2 columnas.
                return GridView.builder(
                  padding: const EdgeInsets.all(16),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 12,
                    mainAxisExtent: 190,
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
