import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:indrive_client/domain/models/auth_response.dart';
import 'package:indrive_client/domain/use_cases/auth/auth_use_cases.dart';
import 'package:indrive_client/presentation/page/profile/info/bloc/profile_info_event.dart';
import 'package:indrive_client/presentation/page/profile/info/bloc/profile_info_state.dart';

class ProfileInfoBloc extends Bloc<ProfileInfoEvent, ProfileInfoState> {
  final AuthUseCases authUseCases;
  ProfileInfoBloc(this.authUseCases) : super(ProfileInfoState()) {
    on<GetUserInfo>((event, emit) async {
      AuthResponse authResponse = await authUseCases.getUserSession.run();
      emit(state.copyWith(user: authResponse.user));
    });
  }
}
