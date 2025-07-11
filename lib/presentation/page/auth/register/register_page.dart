import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:indrive_client/domain/models/auth_response.dart';
import 'package:indrive_client/domain/utils/resource.dart';
import 'package:indrive_client/presentation/page/auth/register/bloc/register_bloc.dart';
import 'package:indrive_client/presentation/page/auth/register/register_content.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<RegisterBloc, RegisterState>(
        listener: (context, state) {
          final response = state.response;
          if (response is ErrorData) {
            Fluttertoast.showToast(
              msg: '${response.message}',
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              backgroundColor: Colors.redAccent,
              textColor: Colors.white,
              fontSize: 16.0,
            );
          }
          if (response is Success) {
            context.read<RegisterBloc>().add(FormResetEvent());
            AuthResponse authResponse = response.data as AuthResponse;
            context.read<RegisterBloc>().add(
              SaveUserSessionEvent(authResponse: authResponse),
            );
            Navigator.pushNamedAndRemoveUntil(
              context,
              'client/home',
              (route) => false,
            );
          }
        },
        child: BlocBuilder<RegisterBloc, RegisterState>(
          builder: (context, state) {
            return RegisterContent(state);
          },
        ),
      ),
    );
  }
}
