import 'package:flutter/material.dart';
import 'package:training/profil/profil_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      initialRoute: '/profil_page',
      routes: {
        '/profil_page': (context) => ProfilPage(),
      },
    );
  }
}
