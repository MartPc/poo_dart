import 'dart:io';

class Biblioteca {
  int codigo;
  String titulo;
  String autor;
  int fechaPublicacion;
  String genero;
  bool disponibilidad;

  static List<Biblioteca> libros = [];

  Biblioteca(this.codigo, this.titulo, this.autor, this.fechaPublicacion, this.genero, this.disponibilidad);

  
  static Biblioteca? findBook(int codigo, List<Biblioteca> listaLibros) {
    for (var i in listaLibros) {
      if (codigo == i.codigo) {
        return i;
      }
    }
    return null;
  }


  static Biblioteca? searchBook(){
    print('Ingrese el código del libro que desea buscar:');
    int codigo = int.parse(stdin.readLineSync()!);
    var dato = findBook(codigo, libros);
    if (dato!= null) {
          print('Información del libro:');
          print('Código: ${dato.codigo}');
          print('Título: ${dato.titulo}');
          print('Autor: ${dato.autor}');
          print('Año de publicación: ${dato.fechaPublicacion}');
          print('Género: ${dato.genero}');
          print('Disponibilidad: ${dato.disponibilidad}');
        }
      else {
        print('No se encontró el libro');
      }
    return null;
  }


  static registerBook() {
    print('Ingrese el código del libro:');
    int codigo = int.parse(stdin.readLineSync()!);
    if (findBook(codigo, libros)!= null) {
      print('El libro ya está registrado.');
      return;
    }

    print('Ingrese el título del libro:');
    String titulo = stdin.readLineSync()!;
    print('Ingrese el autor del libro:');
    String autor = stdin.readLineSync()!;
    print('Ingrese el año de publicación del libro:');
    int fechaPublicacion = int.parse(stdin.readLineSync()!);
    print('Ingrese el género del libro:');
    String genero = stdin.readLineSync()!;

    var libro = Biblioteca(codigo, titulo, autor, fechaPublicacion, genero, true);
    libros.add(libro);
    print('El libro ha sido registrado exitosamente.');
  }

  static changeAvailability() {
    print('Ingrese el código del libro para cambiar la disponibilidad:');
    int codigo = int.parse(stdin.readLineSync()!);

    Biblioteca? libroEncontrado = findBook(codigo, libros);

    if (libroEncontrado != null) {
      print('Ingrese la nueva disponibilidad (true/false):');
      bool nuevaDisponibilidad = bool.parse(stdin.readLineSync()!);
      if(nuevaDisponibilidad != libroEncontrado.disponibilidad){
      libroEncontrado.disponibilidad = nuevaDisponibilidad;
      print('La disponibilidad del libro ha sido actualizada.');
      }else{
        print('La disponibilidad del libro no ha cambiado.');
      }
    } else {
      print('El libro no ha sido encontrado.');
    }
  }

  static information() {
    int totalLibros = libros.length;
    int indisponibleLibros = 0;

    for(var b in libros) {
    if (b.disponibilidad == false){
      indisponibleLibros++;
    }
    }
    print('Cantidad total de libros registrados: $totalLibros');
    print('Cantidad de libros no disponibles: $indisponibleLibros');
  }

  static toList() {
    print('Listado de libros:');
    if(libros.isNotEmpty) {
    for (var n in libros) {
      print('Título: ${n.titulo}, Autor: ${n.autor}, Disponibilidad: ${n.disponibilidad}');
    }
  }else{
    print('No hay libros registrados.');
  }
  
}

}
