import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:indrive_client/domain/use_cases/auth/auth_use_cases.dart';
import 'package:indrive_client/injection.dart';
import 'package:indrive_client/presentation/page/auth/login/bloc/login_bloc.dart';
import 'package:indrive_client/presentation/page/auth/register/bloc/register_bloc.dart';
import 'package:indrive_client/presentation/page/client/home/bloc/client_home_bloc.dart';

List<BlocProvider> blocProviders = [
  BlocProvider<LoginBloc>(
    create:
        (context) =>
            LoginBloc(locator<AuthUseCases>())..add(LoginInitialEvent()),
  ),
  BlocProvider<RegisterBloc>(
    create:
        (context) =>
            RegisterBloc(locator<AuthUseCases>())..add(RegisterInitialEvent()),
  ),
  BlocProvider<ClientHomeBloc>(
    create: (context) => ClientHomeBloc(locator<AuthUseCases>()),
  ),
];
