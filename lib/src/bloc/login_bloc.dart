import 'dart:async';

import 'package:formvalidation/src/bloc/validators.dart';
import 'package:rxdart/rxdart.dart';

class LoginBloc with Validators {
  final _emailController = BehaviorSubject<String>();
  final _passwordController = BehaviorSubject<String>();
  final _nombreController = BehaviorSubject<String>();
  final _apellidoController = BehaviorSubject<String>();

  //RECUPERAR DATOS STRING
  Stream<String> get emailStream =>
      _emailController.stream.transform(validarEmail);
  Stream<String> get passwordStream =>
      _passwordController.stream.transform(validarPassword);
  Stream<String> get nombreStream =>
      _nombreController.stream.transform(validarNombre);
  Stream<String> get apellidoStream =>
      _apellidoController.stream.transform(validarApellido);

  Stream<bool> get formValidStream => Rx.combineLatest4(emailStream,
      passwordStream, nombreStream, apellidoStream, (e, p, n, a) => true);

  // INSERTAR VALORES AL STREAM
  Function(String) get changeEmail => _emailController.sink.add;
  Function(String) get changePassword => _passwordController.sink.add;
  Function(String) get changeNombre => _nombreController.sink.add;
  Function(String) get changeApellido => _apellidoController.sink.add;
  //ULTIMO VALOR EN STREM
  String get email => _emailController.value;
  String get passwod => _passwordController.value;
  String get nombre => _nombreController.value;
  String get apellido => _apellidoController.value;
  dispose() {
    _emailController?.close();
    _passwordController?.close();
    _nombreController?.close();
    _apellidoController?.close();
  }
}
