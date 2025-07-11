import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:indrive_client/domain/repository/auth_repository.dart';
import 'package:indrive_client/domain/use_cases/auth/auth_use_cases.dart';
import 'package:indrive_client/presentation/page/client/home/bloc/client_home_event.dart';
import 'package:indrive_client/presentation/page/client/home/bloc/client_home_state.dart';

class ClientHomeBloc extends Bloc<ClientHomeEvent, ClientHomeState> {
  final AuthUseCases authUseCases;
  ClientHomeBloc(this.authUseCases) : super(ClientHomeState()) {
    on<ChangeDrawerPage>((event, emit) {
      emit(state.copyWith(pageIndex: event.pageIndex));
    });
    on<Logout>((event, emit) async {
      await authUseCases.logout.run();
    });
  }
}
