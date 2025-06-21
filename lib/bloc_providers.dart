import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:indrive_client/presentation/page/auth/login/bloc/login_bloc.dart';
import 'package:indrive_client/presentation/page/auth/register/bloc/register_bloc.dart';

List<BlocProvider> blocProviders = [
  BlocProvider<LoginBloc>(
    create: (context) => LoginBloc()..add(LoginInitialEvent()),
  ),
  BlocProvider<RegisterBloc>(
    create: (context) => RegisterBloc()..add(RegisterInitialEvent()),
  ),
];
