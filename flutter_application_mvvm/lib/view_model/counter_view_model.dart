// view_model/counter_view_model.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../model/counter_model.dart';

// Provider: Define un proveedor para proporcionar el ViewModel a la vista
// counterProvider. Este será el proveedor que proporcionará una instancia del ViewModel (CounterViewModel) a la Vista.
// La clase de ChangeNotifierProvider Riverpod se utiliza para proporcionar el ViewModel a la vista.
final counterProvider = ChangeNotifierProvider((ref) => CounterViewModel());

// ViewModel: Actúa como intermediario entre la vista y el modelo
class CounterViewModel extends ChangeNotifier {
  final CounterModel _model = CounterModel(); // Instancia del modelo

  // Getter para obtener el valor del contador desde el modelo
  int get counter => _model.counter;

  // Método para incrementar el contador
  void incrementCounter() {
    _model
        .increment(); // Llama al método increment del modelo para aumentar el contador
    notifyListeners(); // Notifica a los oyentes (vista) sobre el cambio en los datos
  }
}
