part of 'login_bloc.dart';

@immutable
class LoginState extends Equatable {
  final GlobalKey<FormState>? formKey;
  final BlocFormItem email;
  final BlocFormItem password;

  const LoginState({
    this.email = const BlocFormItem(error: 'Ingrese el email'),
    this.password = const BlocFormItem(error: 'Ingrese el password'),
    this.formKey,
  });

  @override
  List<Object?> get props => [email, password];

  LoginState copyWith({
    BlocFormItem? email,
    BlocFormItem? password,
    GlobalKey<FormState>? formKey,
  }) {
    return LoginState(
      email: email ?? this.email,
      password: password ?? this.password,
      formKey: formKey,
    );
  }
}

final class LoginInitial extends LoginState {}
