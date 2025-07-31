import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:indrive_client/domain/use_cases/auth/auth_use_cases.dart';
import 'package:indrive_client/injection.dart';
import 'package:indrive_client/presentation/page/auth/login/bloc/login_bloc.dart';
import 'package:indrive_client/presentation/page/auth/register/bloc/register_bloc.dart';
import 'package:indrive_client/presentation/page/client/home/bloc/client_home_bloc.dart';
import 'package:indrive_client/presentation/page/profile/info/bloc/profile_info_bloc.dart';
import 'package:indrive_client/presentation/page/profile/info/bloc/profile_info_event.dart';
import 'package:indrive_client/presentation/page/profile/update/bloc/profile_update_bloc.dart';
import 'package:indrive_client/presentation/page/profile/update/bloc/profile_update_event.dart';

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
  BlocProvider<ProfileInfoBloc>(
    create:
        (context) =>
            ProfileInfoBloc(locator<AuthUseCases>())..add(GetUserInfo()),
  ),
  BlocProvider<ProfileUpdateBloc>(create: (context) => ProfileUpdateBloc()),
];
