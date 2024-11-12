import 'package:flutter/material.dart';
import 'package:training/profil/profil_page.dart';
import 'package:training/login_page.dart';

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
      initialRoute: '/login_page',
      routes: {
        '/login_page': (context) => LoginPage(),
        '/profil_page': (context) => ProfilPage(),
      },
    );
  }
}
