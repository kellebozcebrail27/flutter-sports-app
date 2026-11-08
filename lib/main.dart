import 'package:flutter/material.dart';

import 'screens/login_screen.dart';

void main() {
  runApp(const SportCatalogApp());
}

class SportCatalogApp extends StatelessWidget {
  const SportCatalogApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Sporcu Katalog Uygulaması',
      theme: ThemeData(primarySwatch: Colors.orange),
      home: const LoginScreen(),
    );
  }
}
