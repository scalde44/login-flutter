import 'dart:async';

class Validators {
  final validarEmail =
      StreamTransformer<String, String>.fromHandlers(handleData: (email, sink) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp = new RegExp(pattern);

    if (regExp.hasMatch(email)) {
      sink.add(email);
    } else {
      sink.addError('Email invalido');
    }
  });

  final validarPassword = StreamTransformer<String, String>.fromHandlers(
      handleData: (password, sink) {
    if (password.length >= 6) {
      sink.add(password);
    } else {
      sink.addError('Deben ser mas de 6 caracteres');
    }
  });
  final validarNombre = StreamTransformer<String, String>.fromHandlers(
      handleData: (nombre, sink) {
    Pattern pattern = r'[!@#<>?":_`~,.;[\]\\|=+)(*&^%0-9-]';
    RegExp regExp = new RegExp(pattern);
    if (regExp.hasMatch(nombre)) {
      sink.addError('Nombre invalido');
    } else if (nombre.trim().length >= 3 && nombre.trim().isNotEmpty) {
      print(nombre.trim());
      sink.add(nombre);
    } else {
      sink.addError('Deben ser más de 3 caracteres');
    }
  });
  final validarApellido = StreamTransformer<String, String>.fromHandlers(
      handleData: (apellido, sink) {
    Pattern pattern = r'[!@#<>?":_`~,.;[\]\\|=+)(*&^%0-9-]';
    RegExp regExp = new RegExp(pattern);
    if (regExp.hasMatch(apellido)) {
      sink.addError('Nombre invalido');
    } else if (apellido.trim().length >= 3 && apellido.trim().isNotEmpty) {
      print(apellido.trim());
      sink.add(apellido);
    } else {
      sink.addError('Deben ser más de 3 caracteres');
    }
  });
}
