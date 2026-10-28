import 'package:flutter/material.dart';

import '../models/destino.dart';

/// Datos estáticos del catálogo (la práctica no consume API).
const List<Destino> destinos = [
  Destino(
    id: 'apoala',
    nombre: 'Santiago Apoala',
    municipio: 'Nochixtlán',
    categoria: Categoria.naturaleza,
    resumen: 'Cascadas, cañón y ríos de agua cristalina.',
    descripcion:
        'Comunidad rodeada de un cañón profundo donde nacen cascadas y '
        'pozas. En la tradición mixteca se le considera un lugar de origen, '
        'y hoy es un sitio de ecoturismo comunitario.',
    icono: Icons.water_rounded,
    actividades: ['Senderismo', 'Rapel', 'Nadar en pozas', 'Acampar'],
    destacado: true,
  ),
  Destino(
    id: 'yanhuitlan',
    nombre: 'Ex convento de Yanhuitlán',
    municipio: 'Santo Domingo Yanhuitlán',
    categoria: Categoria.historia,
    resumen: 'Templo dominico del siglo XVI sobre una plataforma.',
    descripcion:
        'Uno de los conjuntos dominicos más grandes de la Mixteca Alta. '
        'Destaca por su fachada, sus retablos y su museo de arte sacro.',
    icono: Icons.church_rounded,
    actividades: ['Visita guiada', 'Museo', 'Fotografía'],
    destacado: true,
  ),
  Destino(
    id: 'teposcolula',
    nombre: 'Capilla abierta de Teposcolula',
    municipio: 'San Pedro y San Pablo Teposcolula',
    categoria: Categoria.historia,
    resumen: 'Capilla abierta con arcos monumentales.',
    descripcion:
        'Construida por los dominicos para evangelizar al aire libre. '
        'Sus arcos y bóvedas la vuelven una de las capillas abiertas más '
        'conocidas de México.',
    icono: Icons.architecture_rounded,
    actividades: ['Recorrido', 'Fotografía', 'Plaza del pueblo'],
  ),
  Destino(
    id: 'coixtlahuaca',
    nombre: 'Ex convento de Coixtlahuaca',
    municipio: 'San Juan Bautista Coixtlahuaca',
    categoria: Categoria.historia,
    resumen: 'Fachada labrada y capilla abierta del siglo XVI.',
    descripcion:
        'Conjunto conventual de la Mixteca Alta con portada finamente '
        'labrada en cantera y una capilla abierta de gran tamaño.',
    icono: Icons.castle_rounded,
    actividades: ['Visita guiada', 'Fotografía'],
  ),
  Destino(
    id: 'cerro_minas',
    nombre: 'Cerro de las Minas',
    municipio: 'Huajuapan de León',
    categoria: Categoria.arqueologia,
    resumen: 'Zona arqueológica ñuiñe con vista a la ciudad.',
    descripcion:
        'Asentamiento prehispánico de la cultura ñuiñe en la Mixteca Baja. '
        'Conserva terrazas, plazas y tumbas, y ofrece un mirador natural.',
    icono: Icons.landscape_rounded,
    actividades: ['Caminata', 'Mirador', 'Historia prehispánica'],
    destacado: true,
  ),
  Destino(
    id: 'mercado_tlaxiaco',
    nombre: 'Tianguis de Tlaxiaco',
    municipio: 'Heroica Ciudad de Tlaxiaco',
    categoria: Categoria.cultura,
    resumen: 'Mercado tradicional de los sábados.',
    descripcion:
        'Cada sábado comunidades de la región llegan a vender e '
        'intercambiar productos: pan, textiles, barro, flores y comida '
        'típica de la Mixteca.',
    icono: Icons.shopping_basket_rounded,
    actividades: ['Comida típica', 'Artesanías', 'Recorrido por el centro'],
  ),
];
