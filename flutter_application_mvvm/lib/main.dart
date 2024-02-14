// main.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'view/my_home_page.dart';

void main() {
  // Iniciar la aplicación y envolverla en ProviderScope
  //tu aplicación con ProviderScope crea un ámbito global para tus proveedores,
  //lo que permite una gestión centralizada y acceso fácil a los mismos en toda tu aplicación.
  // Proveedor/provider: objetos que proporcionan y gestionan datos

  runApp(const ProviderScope(child: MyApp()));
}

// id key
// stateless = info estatica inmutable.
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // Método build para construir la aplicación
  @override
  Widget build(BuildContext context) {
    // Retorna un MaterialApp que contiene la configuración de la aplicación
    return MaterialApp(
      title: 'Flutter app test MVVM', // Título de la aplicación

      theme: ThemeData(
        // Configuración del tema de la aplicación
        colorScheme: ColorScheme.fromSwatch(
            primarySwatch: Colors.deepPurple), // Esquema de colores
      ),

      home: const MyHomePage(title: 'Hola mundo enfermo y triste'),
    );
  }
}
