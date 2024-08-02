import 'dart:async';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:color_app/funciones/logica.dart';
import 'package:color_app/funciones/guardar_record.dart';
import 'package:color_app/presentacion/pantallas/inicio.dart';
import 'package:color_app/presentacion/pantallas/records.dart';
import 'package:color_app/presentacion/pantallas/juego.dart';
import 'package:color_app/presentacion/pantallas/juegopersonalizado.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => RecordsNotifier()),
        ChangeNotifierProvider(create: (context) => JuegoLogica()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: const Color.fromARGB(255, 255, 255, 255),
      ),
      home: const SplashScreen(),
      routes: {
        '/inicio': (context) => const PantallaInicial(),
        '/records': (context) => const RecordsPantalla(),
        '/juego': (context) => const Juego(),
        '/juegopersonalizado': (context) => const JuegoPersonalizado(),
      },
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
      const Duration(seconds: 2),
      () => Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const PantallaInicial()),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: FadeInImage( 
          image: AssetImage('assets/images/LogoApp.png'), // Reemplaza con la ruta de tu imagen
          placeholder: AssetImage('assets/images/cargando.gif'), // Imagen de carga opcional
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
