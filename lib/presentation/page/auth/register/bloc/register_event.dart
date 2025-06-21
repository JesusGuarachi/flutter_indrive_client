part of 'register_bloc.dart';

@immutable
sealed class RegisterEvent {}

class RegisterInitialEvent extends RegisterEvent {}

class NombreChangedEvent extends RegisterEvent {
  final BlocFormItem nombre;
  NombreChangedEvent({required this.nombre});
}

class ApellidoChangedEvent extends RegisterEvent {
  final BlocFormItem apellido;
  ApellidoChangedEvent({required this.apellido});
}

class EmailChangedEvent extends RegisterEvent {
  final BlocFormItem email;
  EmailChangedEvent({required this.email});
}

class TelefonoChangedEvent extends RegisterEvent {
  final BlocFormItem telefono;
  TelefonoChangedEvent({required this.telefono});
}

class PasswordChangedEvent extends RegisterEvent {
  final BlocFormItem password;
  PasswordChangedEvent({required this.password});
}

class ConfirmarPasswordChangedEvent extends RegisterEvent {
  final BlocFormItem confirmarPassword;
  ConfirmarPasswordChangedEvent({required this.confirmarPassword});
}

class FormSubmitEvent extends RegisterEvent {}
