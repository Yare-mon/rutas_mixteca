import 'package:flutter/material.dart';
import 'core/theme/app_theme.dart';

void main() => runApp(const RutasMixtecaApp());

class RutasMixtecaApp extends StatelessWidget {
  const RutasMixtecaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Rutas Mixtecas',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.tema,
      home: const Scaffold(body: Center(child: Text('Rutas Mixtecas'))),
    );
  }
}
