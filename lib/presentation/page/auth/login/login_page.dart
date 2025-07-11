import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:indrive_client/domain/models/auth_response.dart';
import 'package:indrive_client/domain/utils/resource.dart';
import 'package:indrive_client/presentation/page/auth/login/bloc/login_bloc.dart';
import 'package:indrive_client/presentation/page/auth/login/login_content.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<LoginBloc, LoginState>(
        listener: (context, state) {
          final response = state.response;
          if (response is ErrorData) {
            Fluttertoast.showToast(
              msg: '${response.message}',
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              backgroundColor: const Color.fromARGB(255, 186, 82, 255),
              textColor: Colors.white,
              fontSize: 16.0,
            );
            print('Error data ${response.message}');
          }
          if (response is Success) {
            print('Success ${response.data}');
            final authResponse = response.data as AuthResponse;
            context.read<LoginBloc>().add(
              SaveUserSessionEvent(authResponse: authResponse),
            );
            Navigator.pushNamedAndRemoveUntil(
              context,
              'client/home',
              (route) => false,
            );
          }
        },
        child: BlocBuilder<LoginBloc, LoginState>(
          builder: (context, state) {
            final response = state.response;
            if (response is Loading) {
              return Center(child: CircularProgressIndicator());
            }
            return LoginContent(state);
          },
        ),
      ),
    );
  }
}
