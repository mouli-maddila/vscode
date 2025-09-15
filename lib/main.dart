import 'package:flutter/material.dart';
import 'package:aegis/pages/shell.dart';
import 'package:aegis/i18n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Locale _locale = const Locale('te');

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aegis',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: const ColorScheme.light(
          primary: Color(0xFFFF3B30),
          secondary: Color(0xFF34C759),
          surface: Color(0xFFF1F1F1),
        ),
        scaffoldBackgroundColor: const Color(0xFFF1F1F1),
        fontFamily: 'Roboto',
        useMaterial3: true,
      ),
      locale: _locale,
      supportedLocales: AppLocalizations.supportedLocales,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      home: Shell(
        onLocaleChanged: (loc) => setState(() => _locale = loc),
      ),
    );
  }
}

// Entry is Shell (Home/Analytics/Settings) with i18n.
