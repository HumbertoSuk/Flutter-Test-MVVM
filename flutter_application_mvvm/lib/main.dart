// Importar librerias, es importante instalar riverpod
// Riverpod podría ser utilizado para manejar la conexión entre la Vista y el ViewModel,
// así como para proporcionar y administrar los datos utilizados por la Vista.
// pueden actuar como ViewModel, proporcionando y administrando los datos utilizados por la Vista.

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// ViewModel: Actúa como intermediario entre la vista y el modelo
//lase proporcionada por Flutter que implementa el patrón de diseño "Observador".
//Este patrón de diseño se utiliza para notificar a los objetos interesados (llamados observadores)
//cuando cambia el estado de un objeto observado.
class CounterViewModel extends ChangeNotifier {
  int _counter = 0;

  // Getter para obtener el valor del contador
  int get counter => _counter;

  // Método para incrementar el contador
  void incrementCounter() {
    _counter++;
    notifyListeners(); // Notifica a los oyentes (en este caso, la vista) sobre el cambio en los datos
  }
}

// Provider: Define un proveedor para proporcionar el ViewModel a la vista
//counterProvider. Este será el proveedor que proporcionará una instancia del ViewModel (CounterViewModel) a la Vista.
// clase de ChangeNotifierProvider Riverpod
final counterProvider = ChangeNotifierProvider((ref) => CounterViewModel());

//permite que la Vista acceda y utilice el ViewModel para manejar el estado y la lógica de la aplicación.

// Home Page: Representa la interfaz de usuario
class MyHomePage extends ConsumerWidget {
  // Usa ConsumerWidget para acceder a los providers
  //ConsumerWidget es una herramienta útil en riverpod para manejar la suscripción
  //a cambios en los proveedores y la reconstrucción de los widgets en respuesta a esos cambios.

  //Constructor, key para identificar de manera unica el widget.
  //Ademas, requiere un parametro title que se utiliza como título de la página de inicio.
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Obtén el ViewModel desde el proveedor
    final viewModel = ref.watch(counterProvider);
    // Obtiene el ViewModel usando ref.watch
    // el widget se reconstruirá automáticamente cuando el valor del proveedor cambie.

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.secondary,
        title: Text(title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Hola mundo enfermo y triste (╥﹏╥):', // Texto
            ),
            Text(
              '${viewModel.counter}', // Muestra el valor actual del contador obtenido del ViewModel dinamicamente
              style: Theme.of(context).textTheme.headline6, // Aplica el estilo.
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => ref
            .read(
                counterProvider) //  se utiliza para definir una acción a realizar cuando el usuario presiona el botón
            .incrementCounter(), // Llama al método 'incrementCounter' del ViewModel cuando se presiona el botón
        tooltip:
            'Incrementar?', // Muestra un mensaje emergente cuando el usuario mantiene presionado el botón
        child: const Icon(Icons.add), // Icono del botón flotante
      ),
    );
  }
}

// Main App: Punto de entrada de la aplicación
void main() {
  runApp(const ProviderScope(
      child:
          MyApp())); // Envuelve la aplicación en ProviderScope para que los proveedores esten en toda la app
}

// StatelessWidget es inmutable una vez que se construye.
//Son útiles para representar partes de la interfaz de usuario que no dependen del estado de la aplicación
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

//Definir la escructura principal de la pantalla y app, como se menciona anteriormente esto es inmutable.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter app test MVVM',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.deepPurple),
      ),
      home: const MyHomePage(title: 'Hola mundo enfermo y triste'),
    );
  }
}
