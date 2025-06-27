import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:indrive_client/data/data_source/remote/services/auth_service.dart';
import 'package:indrive_client/domain/models/auth_response.dart';
import 'package:indrive_client/domain/use_cases/auth/auth_use_cases.dart';
import 'package:indrive_client/domain/use_cases/auth/login_use_case.dart';
import 'package:indrive_client/domain/utils/resource.dart';
import 'package:indrive_client/presentation/page/auth/utils/bloc_form_item.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final formKey = GlobalKey<FormState>();

  final AuthUseCases authUseCases;

  LoginBloc(this.authUseCases) : super(LoginState()) {
    on<LoginInitialEvent>((event, emit) async {
      AuthResponse? authResponse = await authUseCases.getUserSession.run();
      print('authResponse: ${authResponse?.toJson()}');
      emit(state.copyWith(formKey: formKey));
      if (authResponse != null) {
        emit(state.copyWith(response: Success(authResponse), formKey: formKey));
      }
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

    on<SaveUserSessionEvent>((event, emit) async {
      await authUseCases.saveUserSession.run(event.authResponse);
    });

    on<FormSubmitEvent>((event, emit) async {
      print('FormSubmitEvent');
      emit(state.copyWith(response: Loading(), formKey: formKey));
      Resource response = await authUseCases.login.run(
        email: state.email.value,
        password: state.password.value,
      );
      print('FormSubmitEvent2');
      emit(state.copyWith(response: response, formKey: formKey));
    });
  }
}
