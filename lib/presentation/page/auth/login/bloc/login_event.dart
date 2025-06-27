part of 'login_bloc.dart';

@immutable
sealed class LoginEvent {}

class LoginInitialEvent extends LoginEvent {}

class EmailChangedEvent extends LoginEvent {
  final BlocFormItem email;
  EmailChangedEvent({required this.email});
}

class PasswordChangedEvent extends LoginEvent {
  final BlocFormItem passsword;

  PasswordChangedEvent({required this.passsword});
}

class SaveUserSessionEvent extends LoginEvent {
  final AuthResponse authResponse;

  SaveUserSessionEvent({required this.authResponse});
}

class FormSubmitEvent extends LoginEvent {}
