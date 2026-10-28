import 'package:flutter/material.dart';

/// WIDGET 2 · BotonPrincipal (Integrante 1)
///
/// Botón de ancho completo con icono. Tiene dos variantes:
/// - relleno (por defecto): usa el ElevatedButtonTheme global.
/// - contorno (`contorno: true`): usa el OutlinedButtonTheme global.
/// Se usa en Inicio ("Ver catálogo") y en Detalle ("Volver al catálogo").
class BotonPrincipal extends StatelessWidget {
  final String texto;
  final IconData icono;
  final VoidCallback onPressed;
  final bool contorno;

  const BotonPrincipal({
    super.key,
    required this.texto,
    required this.onPressed,
    this.icono = Icons.arrow_forward_rounded,
    this.contorno = false,
  });

  @override
  Widget build(BuildContext context) {
    final Widget contenido = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(texto),
        const SizedBox(width: 8),
        Icon(icono, size: 20),
      ],
    );

    return SizedBox(
      width: double.infinity,
      child: contorno
          ? OutlinedButton(onPressed: onPressed, child: contenido)
          : ElevatedButton(onPressed: onPressed, child: contenido),
    );
  }
}
