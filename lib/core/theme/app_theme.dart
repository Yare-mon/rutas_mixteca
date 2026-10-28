import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._();

  static const Color colorSemilla = Color(0xFFB4532A);

  /// Color de acento: verde maguey.
  static const Color colorAcento = Color(0xFF4F7A3A);

  /// Fondo general: papel crema.
  static const Color colorFondo = Color(0xFFFBF5EE);

  /// Redondeo usado por tarjetas, botones y etiquetas.
  static const double radioBordes = 18;

  static ThemeData get tema {
    final ColorScheme esquema = ColorScheme.fromSeed(
      seedColor: colorSemilla,
      primary: colorSemilla,
      secondary: colorAcento,
      surface: colorFondo,
      brightness: Brightness.light,
    );

    final TextTheme textos = _textos(esquema);

    return ThemeData(
      useMaterial3: true,
      colorScheme: esquema,
      scaffoldBackgroundColor: colorFondo,
      textTheme: textos,

      // ---- AppBar ----
      appBarTheme: AppBarTheme(
        backgroundColor: esquema.primary,
        foregroundColor: esquema.onPrimary,
        centerTitle: true,
        elevation: 0,
        titleTextStyle: textos.titleLarge?.copyWith(
          color: esquema.onPrimary,
          fontWeight: FontWeight.w700,
          letterSpacing: 0.5,
        ),
      ),

      // ---- Tarjetas ----
      cardTheme: CardThemeData(
        color: Colors.white,
        elevation: 2,
        shadowColor: esquema.primary.withValues(alpha: 0.25),
        margin: const EdgeInsets.symmetric(vertical: 8),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radioBordes),
        ),
        clipBehavior: Clip.antiAlias,
      ),

      // ---- Botones ----
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: esquema.primary,
          foregroundColor: esquema.onPrimary,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          textStyle: textos.labelLarge?.copyWith(fontWeight: FontWeight.w700),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radioBordes),
          ),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: esquema.primary,
          side: BorderSide(color: esquema.primary, width: 1.5),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radioBordes),
          ),
        ),
      ),

      // ---- Etiquetas (Chips) ----
      chipTheme: ChipThemeData(
        backgroundColor: esquema.secondaryContainer,
        selectedColor: esquema.secondary,
        labelStyle: textos.labelMedium,
        side: BorderSide.none,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radioBordes),
        ),
      ),

      iconTheme: IconThemeData(color: esquema.primary),
      dividerTheme: DividerThemeData(
        color: esquema.primary.withValues(alpha: 0.15),
        thickness: 1,
      ),
    );
  }

  /// Jerarquía tipográfica de la app.
  static TextTheme _textos(ColorScheme esquema) {
    const Color tinta = Color(0xFF3B2A20); // café oscuro para leer cómodo
    return TextTheme(
      headlineMedium: const TextStyle(
        fontSize: 28,
        fontWeight: FontWeight.w800,
        color: tinta,
        height: 1.15,
      ),
      titleLarge: const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w700,
        color: tinta,
      ),
      titleMedium: const TextStyle(
        fontSize: 17,
        fontWeight: FontWeight.w700,
        color: tinta,
      ),
      bodyLarge: const TextStyle(fontSize: 16, color: tinta, height: 1.5),
      bodyMedium: TextStyle(
        fontSize: 14,
        color: tinta.withValues(alpha: 0.75),
        height: 1.4,
      ),
      labelLarge: const TextStyle(fontSize: 15, letterSpacing: 0.4),
      labelMedium: TextStyle(
        fontSize: 13,
        fontWeight: FontWeight.w600,
        color: esquema.onSecondaryContainer,
      ),
    );
  }
}
