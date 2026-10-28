import 'package:flutter/material.dart';

import 'core/theme/app_theme.dart';
import 'features/inicio/inicio_screen.dart';

void main() {
  runApp(const RutasMixtecaApp());
}

class RutasMixtecaApp extends StatelessWidget {
  const RutasMixtecaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Rutas Mixtecas',
      debugShowCheckedModeBanner: false,
      // Un solo punto de configuración visual para TODA la aplicación.
      theme: AppTheme.tema,
      home: const InicioScreen(),
    );
  }
}
