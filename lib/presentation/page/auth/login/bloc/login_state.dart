part of 'login_bloc.dart';

@immutable
class LoginState extends Equatable {
  final GlobalKey<FormState>? formKey;
  final BlocFormItem email;
  final BlocFormItem password;
  final Resource? response;

  const LoginState({
    this.email = const BlocFormItem(error: 'Ingrese el email'),
    this.password = const BlocFormItem(error: 'Ingrese el password'),
    this.formKey,
    this.response,
  });

  @override
  List<Object?> get props => [email, password, response];

  LoginState copyWith({
    BlocFormItem? email,
    BlocFormItem? password,
    GlobalKey<FormState>? formKey,
    Resource? response,
  }) {
    return LoginState(
      email: email ?? this.email,
      password: password ?? this.password,
      formKey: formKey,
      response: response ?? this.response,
    );
  }
}

final class LoginInitial extends LoginState {}
