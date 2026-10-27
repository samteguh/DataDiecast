import 'package:flutter/material.dart';
import 'login_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DataBlecast',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFFEEEEEE), // Warna abu-abu terang background
        primaryColor: const Color(0xFF3F4E88), // Warna biru dongker
        fontFamily: 'Roboto', // Ganti dengan font pilihanmu nanti
      ),
      home: const LoginPage(),
    );
  }
}