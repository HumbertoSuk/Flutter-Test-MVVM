// view/my_home_page.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../view_model/counter_view_model.dart';

// Vista: Representa la interfaz de usuario
class MyHomePage extends ConsumerWidget {
  // Constructor para inicializar el título de la página
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // Título de la página
  final String title;

  // Método build que construye la interfaz de usuario
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Obtener el ViewModel desde el proveedor utilizando ref.watch
    final viewModel = ref.watch(counterProvider);

    // Retornar la estructura de la página
    return Scaffold(
      appBar: AppBar(
        // Configuración de la barra de la aplicación
        backgroundColor: Theme.of(context).colorScheme.secondary,
        title: Text(title), // Título de la barra de la aplicación
      ),
      body: Center(
        // Contenido centralizado en la página
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Hola mundo enfermo y triste (╥﹏╥):', // Texto fijo
            ),
            Text(
              '${viewModel.counter}', // Mostrar el valor actual del contador obtenido del ViewModel
              style: Theme.of(context).textTheme.headline6, // Estilo del texto
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        // Botón flotante para incrementar el contador
        onPressed: () => ref
            .read(counterProvider)
            .incrementCounter(), // Acción al presionar el botón
        tooltip:
            'Incrementar?', // Mensaje emergente al mantener presionado el botón
        child: const Icon(Icons.add), // Icono del botón
      ),
    );
  }
}
