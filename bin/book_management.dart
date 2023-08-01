import 'books.dart';
import 'dart:io';

void main(List<String> arguments) {

  while (true) {
    print('\nMenú:');
    print('1. Registrar libro');
    print('2. Buscar un libro');
    print('3. Cambiar la disponibilidad de un libro');
    print('4. Mostrar la cantidad de libros y no disponibles');
    print('5. Mostrar todos los libros registrados');
    print('6. Salir');
    print('Ingrese el número de la opción deseada:');

    var opcion = int.parse(stdin.readLineSync()!);

    switch (opcion) {
      case 1:
        Biblioteca.registerBook();
        break;
      case 2:
        Biblioteca.searchBook();
        break;
      case 3:
        Biblioteca.changeAvailability();
        break;
      case 4:
        Biblioteca.information();
        break;
      case 5:
        Biblioteca.toList();
        break;
      case 6:
        print('Saliendo del programa...');
        exit(0);
      default:
        print('Opción inválida. Intente nuevamente.');
        break;
    }
  }
}