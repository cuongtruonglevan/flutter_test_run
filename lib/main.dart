import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'app/screens/home_screen/home_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final List<Locale> _supportedLocales = [
    Locale('en', 'US'),
  ];

  final List<LocalizationsDelegate> _localizationDelegates = [
    GlobalMaterialLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      supportedLocales: _supportedLocales,
      localizationsDelegates: _localizationDelegates,
      home: HomeScreen(),
    );
  }
}
/// Test commit for CI #1