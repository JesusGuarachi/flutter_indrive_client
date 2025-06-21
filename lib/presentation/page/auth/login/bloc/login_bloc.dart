import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:indrive_client/presentation/page/auth/utils/bloc_form_item.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final formKey = GlobalKey<FormState>();
  LoginBloc() : super(LoginState()) {
    on<LoginInitialEvent>((event, emit) {
      emit(state.copyWith(formKey: formKey));
    });

    on<EmailChangedEvent>((event, emit) {
      emit(
        state.copyWith(
          email: BlocFormItem(
            value: event.email.value,
            error: event.email.value.isEmpty ? 'Ingresa el email' : null,
          ),
          formKey: formKey,
        ),
      );
    });

    on<PasswordChangedEvent>((event, emit) {
      emit(
        state.copyWith(
          password: BlocFormItem(
            value: event.passsword.value,
            error: event.passsword.value.isEmpty ? 'Ingresa el password' : null,
          ),
          formKey: formKey,
        ),
      );
    });

    on<FormSubmitEvent>((event, emit) {
      print('Email: ${state.email}');
      print('Password: ${state.password}');
    });
  }
}
