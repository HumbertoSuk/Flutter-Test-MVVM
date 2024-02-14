// Model: Representa los datos y la logica
class CounterModel {
  int _counter = 0;

  // Getter para obtener el valor del contador
  int get counter => _counter;

  // Método para incrementar el contador
  void increment() {
    _counter++;
  }
}
