import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'cart.dart';
import 'details.dart';
import 'menu.dart';
import 'summary.dart';
import 'auth/login.dart';
import 'auth/register.dart';

void main() async {
  // Inisialisasi Firebase
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  // Jalankan aplikasi
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CartModel()),
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
      title: 'Flutter App with Firebase',
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
