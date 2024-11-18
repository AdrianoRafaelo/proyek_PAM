import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'cart.dart'; // Pastikan lokasi file sesuai dengan struktur proyek Anda
import 'details.dart';
import 'menu.dart';
import 'summary.dart';
import 'auth/login.dart';
import 'auth/register.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CartModel()), // Menggunakan CartModel
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter App',
      theme: ThemeData(
        primarySwatch: Colors.brown, // Tema warna coklat
      ),
      initialRoute: '/', // Halaman awal adalah LoginPage
      routes: {
        '/': (context) => LoginPage(), // Halaman login
        '/menu': (context) => Menu(), // Halaman menu
        '/details': (context) => Details(), // Halaman detail produk
        '/summary': (context) => Summary(), // Halaman ringkasan
        '/register': (context) => RegisterPage(), // Halaman registrasi
      },
    );
  }
}
