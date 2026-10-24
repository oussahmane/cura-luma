import 'package:flutter/material.dart';

const curaSeed = Color(0xFF1F6B4A);
const curaInk = Color(0xFF1C2822);
const curaPaper = Color(0xFFF7F4EF);
const curaPaperDark = Color(0xFF121614);

const medicinePalette = <int>[
  0xFF1F6B4A,
  0xFF3D6B8C,
  0xFF8C5E3D,
  0xFF6B4A7A,
  0xFF3F6B5A,
  0xFF8A4E55,
  0xFF4E6A4A,
  0xFF5C6570,
];

ThemeData buildLightTheme() {
  final scheme = ColorScheme.fromSeed(
    seedColor: curaSeed,
    brightness: Brightness.light,
  ).copyWith(
    primary: const Color(0xFF1B5E45),
    onPrimary: Colors.white,
    primaryContainer: const Color(0xFFD5EDE3),
    onPrimaryContainer: const Color(0xFF06281C),
    secondary: const Color(0xFF5C6F64),
    onSecondary: Colors.white,
    surface: curaPaper,
    onSurface: curaInk,
    surfaceContainerLowest: Colors.white,
    surfaceContainerLow: const Color(0xFFF1EDE6),
    surfaceContainer: const Color(0xFFE8E3DB),
    outline: const Color(0xFFC9C2B6),
    outlineVariant: const Color(0xFFDDD6CC),
    error: const Color(0xFF8C3A3A),
  );
  return _theme(scheme);
}

ThemeData buildDarkTheme() {
  final scheme = ColorScheme.fromSeed(
    seedColor: curaSeed,
    brightness: Brightness.dark,
  ).copyWith(
    primary: const Color(0xFF9ED4BC),
    onPrimary: const Color(0xFF063224),
    primaryContainer: const Color(0xFF1B4A38),
    onPrimaryContainer: const Color(0xFFD7F3E6),
    secondary: const Color(0xFFB7C7BD),
    surface: curaPaperDark,
    onSurface: const Color(0xFFE7E3DC),
    surfaceContainerLowest: const Color(0xFF0E1210),
    surfaceContainerLow: const Color(0xFF1A201C),
    surfaceContainer: const Color(0xFF232A26),
    outline: const Color(0xFF5C675F),
    outlineVariant: const Color(0xFF3A443E),
    error: const Color(0xFFFFB4AB),
  );
  return _theme(scheme);
}

ThemeData _theme(ColorScheme scheme) {
  final base = ThemeData(
    useMaterial3: true,
    colorScheme: scheme,
    scaffoldBackgroundColor: scheme.surface,
  );
  final text = base.textTheme;
  return base.copyWith(
    textTheme: text.copyWith(
      headlineMedium: text.headlineMedium?.copyWith(
        fontWeight: FontWeight.w600,
        letterSpacing: -0.4,
        color: scheme.onSurface,
      ),
      titleLarge: text.titleLarge?.copyWith(
        fontWeight: FontWeight.w600,
        fontSize: 22,
        color: scheme.onSurface,
      ),
      titleMedium: text.titleMedium?.copyWith(fontWeight: FontWeight.w600, fontSize: 18),
      bodyLarge: text.bodyLarge?.copyWith(fontSize: 17, height: 1.4),
      bodyMedium: text.bodyMedium?.copyWith(fontSize: 15, height: 1.4),
      labelLarge: text.labelLarge?.copyWith(fontSize: 15, fontWeight: FontWeight.w600),
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: scheme.surface,
      foregroundColor: scheme.onSurface,
      elevation: 0,
      scrolledUnderElevation: 0,
      centerTitle: false,
    ),
    cardTheme: CardThemeData(
      color: scheme.surfaceContainerLowest,
      elevation: 0,
      margin: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
        side: BorderSide(color: scheme.outlineVariant),
      ),
    ),
    navigationBarTheme: NavigationBarThemeData(
      height: 72,
      backgroundColor: scheme.surfaceContainerLowest,
      indicatorColor: scheme.primaryContainer,
      labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
      labelTextStyle: WidgetStatePropertyAll(
        text.labelMedium?.copyWith(fontWeight: FontWeight.w600),
      ),
    ),
    filledButtonTheme: FilledButtonThemeData(
      style: FilledButton.styleFrom(minimumSize: const Size(64, 48)),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(minimumSize: const Size(64, 48)),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(minimumSize: const Size(48, 48)),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: scheme.surfaceContainerLow,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide(color: scheme.outlineVariant),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide(color: scheme.outlineVariant),
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
    ),
    snackBarTheme: SnackBarThemeData(
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    ),
    dividerTheme: DividerThemeData(color: scheme.outlineVariant),
  );
}
