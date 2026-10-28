# Rutas Mixtecas · Práctica 1

**Personalización visual y componentes reutilizables**
Equipo 1: Yaretzy  y Mario · Desarrollo de Aplicaciones Móviles · 7 US

Catálogo de destinos turísticos de la Mixteca con datos estáticos, 3 pantallas,
4 widgets reutilizables y un tema global en `lib/core/theme/app_theme.dart`.


## Estructura (arquitectura por features)

```
lib/
├── main.dart                      → MaterialApp con theme: AppTheme.tema
├── core/theme/app_theme.dart      → ColorScheme, TextTheme, AppBar, Card, botones, chips
├── features/
│   ├── inicio/inicio_screen.dart          PANTALLA 1
│   └── catalogo/
│       ├── catalogo_screen.dart           PANTALLA 2 (filtros + lista adaptable)
│       ├── detalle_screen.dart            PANTALLA 3
│       ├── models/destino.dart            modelo + enum Categoria
│       └── data/destinos_data.dart        6 destinos estáticos
└── widgets/                       → compartidos entre features
    ├── encabezado_seccion.dart    WIDGET 1
    ├── boton_principal.dart       WIDGET 2
    ├── etiqueta_categoria.dart    WIDGET 3
    └── tarjeta_destino.dart       WIDGET 4 (+ PortadaDestino)
```

## División del trabajo

| | Integrante 1 · Yaretzy | Integrante 2 · Mario |
|---|---|---|
| Archivos | `main.dart`, `core/theme/app_theme.dart`, `features/inicio/` | `features/catalogo/` (pantallas, modelo y datos) |
| Widgets | `EncabezadoSeccion`, `BotonPrincipal` | `TarjetaDestino`, `EtiquetaCategoria` |
| Tareas | Estructura inicial, paleta, tipografía, estilos globales, pantalla de inicio | Catálogo y detalle, navegación, filtro por categoría, diseño adaptable, pruebas finales |

Si prefieren intercambiar los papeles, no hay problema: cada lado toca archivos distintos.



## Dónde se reutiliza cada widget

| Widget | Parámetros | Dónde se usa |
|---|---|---|
| `EncabezadoSeccion` | `titulo` (required), `subtitulo`, `icono`, `textoAccion`, `alPresionarAccion` | Inicio ×2 ("Destacados" con acción, "Explora por categoría" sin acción), Detalle ("Qué hacer") |
| `BotonPrincipal` | `texto`, `onPressed` (required), `icono`, `contorno` | Inicio (relleno), Detalle (contorno) |
| `EtiquetaCategoria` | `categoria`, `seleccionada`, `alTocar` | Inicio (acceso rápido), Catálogo (filtro), Tarjeta y Detalle (solo lectura) |
| `TarjetaDestino` | `destino`, `onTap` (required), `compacta` | Inicio (vertical, carrusel), Catálogo (fila) |
