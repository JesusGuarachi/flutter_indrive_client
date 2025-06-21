import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:indrive_client/presentation/page/auth/utils/bloc_form_item.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final formKey = GlobalKey<FormState>();

  RegisterBloc() : super(RegisterState()) {
    on<RegisterInitialEvent>((event, emit) {
      emit(state.copyWith(formKey: formKey));
    });

    on<NombreChangedEvent>((event, emit) {
      emit(
        state.copyWith(
          nombre: BlocFormItem(
            value: event.nombre.value,
            error: event.nombre.value.isEmpty ? 'Ingrese el nombre' : null,
          ),
          formKey: formKey,
        ),
      );
    });

    on<ApellidoChangedEvent>((event, emit) {
      emit(
        state.copyWith(
          apellido: BlocFormItem(
            value: event.apellido.value,
            error: event.apellido.value.isEmpty ? 'Ingrese el apellido' : null,
          ),
          formKey: formKey,
        ),
      );
    });

    on<EmailChangedEvent>((event, emit) {
      emit(
        state.copyWith(
          email: BlocFormItem(
            value: event.email.value,
            error: event.email.value.isEmpty ? 'Ingrese el email' : null,
          ),
          formKey: formKey,
        ),
      );
    });

    on<TelefonoChangedEvent>((event, emit) {
      emit(
        state.copyWith(
          telefono: BlocFormItem(
            value: event.telefono.value,
            error: event.telefono.value.isEmpty ? 'Ingrese el teléfono' : null,
          ),
          formKey: formKey,
        ),
      );
    });

    on<PasswordChangedEvent>((event, emit) {
      emit(
        state.copyWith(
          password: BlocFormItem(
            value: event.password.value,
            error:
                event.password.value.isEmpty ? 'Ingrese la contraseña' : null,
          ),
          formKey: formKey,
        ),
      );
    });

    on<ConfirmarPasswordChangedEvent>((event, emit) {
      emit(
        state.copyWith(
          confirmarPassword: BlocFormItem(
            value: event.confirmarPassword.value,
            error:
                event.confirmarPassword.value.isEmpty
                    ? 'Confirme la contraseña'
                    : null,
          ),
          formKey: formKey,
        ),
      );
    });

    on<FormSubmitEvent>((event, emit) {
      print('Nombre: ${state.nombre.value}');
      print('Apellido: ${state.apellido.value}');
      print('Email: ${state.email.value}');
      print('Teléfono: ${state.telefono.value}');
      print('Password: ${state.password.value}');
      print('Confirmar Password: ${state.confirmarPassword.value}');
    });
  }
}
