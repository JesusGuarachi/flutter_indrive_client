part of 'register_bloc.dart';

@immutable
class RegisterState extends Equatable {
  final GlobalKey<FormState>? formKey;
  final BlocFormItem nombre;
  final BlocFormItem apellido;
  final BlocFormItem email;
  final BlocFormItem telefono;
  final BlocFormItem password;
  final BlocFormItem confirmarPassword;
  final Resource? response;

  const RegisterState({
    this.nombre = const BlocFormItem(error: 'Ingrese el nombre'),
    this.apellido = const BlocFormItem(error: 'Ingrese el apellido'),
    this.email = const BlocFormItem(error: 'Ingrese el email'),
    this.telefono = const BlocFormItem(error: 'Ingrese el teléfono'),
    this.password = const BlocFormItem(error: 'Ingrese la contraseña'),
    this.confirmarPassword = const BlocFormItem(
      error: 'Confirme la contraseña',
    ),
    this.formKey,
    this.response,
  });

  toUser() => User(
    name: nombre.value,
    lastname: apellido.value,
    email: email.value,
    phone: telefono.value,
    password: password.value,
  );

  @override
  List<Object?> get props => [
    nombre,
    apellido,
    email,
    telefono,
    password,
    confirmarPassword,
    response,
  ];

  RegisterState copyWith({
    BlocFormItem? nombre,
    BlocFormItem? apellido,
    BlocFormItem? email,
    BlocFormItem? telefono,
    BlocFormItem? password,
    BlocFormItem? confirmarPassword,
    Resource? response,
    GlobalKey<FormState>? formKey,
  }) {
    return RegisterState(
      nombre: nombre ?? this.nombre,
      apellido: apellido ?? this.apellido,
      email: email ?? this.email,
      telefono: telefono ?? this.telefono,
      password: password ?? this.password,
      confirmarPassword: confirmarPassword ?? this.confirmarPassword,
      response: response ?? this.response,
      formKey: formKey,
    );
  }
}

final class RegisterInitial extends RegisterState {}
