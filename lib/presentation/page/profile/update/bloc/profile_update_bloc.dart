import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:indrive_client/presentation/page/auth/utils/bloc_form_item.dart';
import 'package:indrive_client/presentation/page/profile/update/bloc/profile_update_event.dart';
import 'package:indrive_client/presentation/page/profile/update/bloc/profile_update_state.dart';

class ProfileUpdateBloc extends Bloc<ProfileUpdateEvent, ProfileUpdateState> {
  final formKey = GlobalKey<FormState>();
  ProfileUpdateBloc() : super(ProfileUpdateState()) {
    on<ProfileUpdateInitEvent>((event, emit) {
      emit(
        state.copyWith(
          name: BlocFormItem(value: event.user?.name ?? ''),
          lastName: BlocFormItem(value: event.user?.lastname ?? ''),
          phone: BlocFormItem(value: event.user?.phone ?? ''),
        ),
      );
    });

    on<NameChangedEvent>((event, emit) {
      emit(
        state.copyWith(
          name: BlocFormItem(
            value: event.name.value,
            error: event.name.value.isEmpty ? 'Ingrese el Nombre' : null,
          ),
        ),
      );
    });

    on<LastNameChangedEvent>((event, emit) {
      emit(
        state.copyWith(
          lastName: BlocFormItem(
            value: event.lastName.value,
            error: event.lastName.value.isEmpty ? 'Ingrese el Apellido' : null,
          ),
        ),
      );
    });

    on<PhoneChangedEvent>((event, emit) {
      emit(
        state.copyWith(
          phone: BlocFormItem(
            value: event.phone.value,
            error: event.phone.value.isEmpty ? 'Ingrese el telefono' : null,
          ),
        ),
      );
    });

    on<FormSubmitEvent>((event, emit) {
      print('Nombre: ${state.name}');
      print('Apellido: ${state.lastName}');
      print('Telefeno: ${state.phone}');
    });
  }
}
