import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'screens/main_layout.dart';
import 'theme/app_theme.dart';

void main() {
  runApp(const CouldAIApp());
}

class CouldAIApp extends StatelessWidget {
  const CouldAIApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CouldAI - منصة العلوم',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.dark, // Default to dark for space theme
      // Support for Arabic RTL
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('ar', 'AE'), // Arabic
      ],
      locale: const Locale('ar', 'AE'),
      home: const MainLayout(),
    );
  }
}
