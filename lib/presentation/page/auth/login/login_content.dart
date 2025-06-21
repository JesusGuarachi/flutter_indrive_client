import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:indrive_client/presentation/page/auth/login/bloc/login_bloc.dart';
import 'package:indrive_client/presentation/page/auth/utils/bloc_form_item.dart';
import 'package:indrive_client/presentation/widgets/default_button.dart';
import 'package:indrive_client/presentation/widgets/default_text_field.dart';

class LoginContent extends StatelessWidget {
  LoginState state;
  LoginContent(this.state, {super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: state.formKey,
      child: Stack(
        children: [
          Container(
            padding: EdgeInsets.only(left: 12),
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Colors.black87, Colors.blueAccent],
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _textLoginRotate(),
                SizedBox(height: 50),
                _textRegisterRotate(context: context),
                SizedBox(height: 50),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 60, bottom: 60),

            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [Colors.black87, Colors.blueAccent],
              ),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(35),
                bottomLeft: Radius.circular(35),
              ),
            ),
            child: Container(
              margin: EdgeInsets.only(left: 20, right: 20),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 50),
                    _textWelcome(text: 'Welcome'),
                    _textWelcome(text: 'back..'),
                    _imageCar(),
                    _textWelcome(text: 'Log in'),
                    DefaultTextField(
                      onChanged: (text) {
                        context.read<LoginBloc>().add(
                          EmailChangedEvent(email: BlocFormItem(value: text)),
                        );
                      },
                      validator: (value) {
                        return context.read<LoginBloc>().state.email.error;
                      },
                      text: 'Email',
                      icon: Icons.email_outlined,
                    ),
                    DefaultTextField(
                      onChanged: (text) {
                        context.read<LoginBloc>().add(
                          PasswordChangedEvent(
                            passsword: BlocFormItem(value: text),
                          ),
                        );
                      },
                      validator: (value) {
                        return context.read<LoginBloc>().state.password.error;
                      },
                      text: 'Password',
                      icon: Icons.lock_outline,
                      margin: EdgeInsets.only(top: 20, left: 20, right: 20),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.01),

                    DefaultButton(
                      text: 'Login rey',
                      onPressed: () {
                        if (state.formKey!.currentState!.validate()) {
                          context.read<LoginBloc>().add(FormSubmitEvent());
                        } else {
                          print('El formulario no es valido');
                        }
                      },
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.2),
                    _separatorOr(),
                    _textDontHaveAccount(context: context),
                    SizedBox(height: 50),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Row _textDontHaveAccount({required BuildContext context}) {
    return Row(
      children: [
        Text(
          'No tienes cuenta?',
          style: TextStyle(color: Color(0xffBDBDBD), fontSize: 18),
        ),
        SizedBox(width: 20),
        GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, 'register');
          },
          child: Text(
            'Registrate',
            style: TextStyle(
              color: Color(0xffBDBDBD),
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }

  Row _separatorOr() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 100,
          height: 1,
          color: Colors.grey,
          margin: EdgeInsets.only(left: 10),
        ),
        Text('o', style: TextStyle(color: Color(0xffBDBDBD), fontSize: 18)),
        Container(width: 100, height: 1, color: Colors.grey),
      ],
    );
  }

  Container _imageCar() {
    return Container(
      alignment: Alignment.center,
      child: Image.asset('assets/img/car.png', width: 150, height: 150),
    );
  }

  Text _textWelcome({required String text}) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 25,
        color: Colors.white,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _textRegisterRotate({required BuildContext context}) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, 'register');
      },
      child: RotatedBox(
        quarterTurns: 1,
        child: Text(
          'Registro',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
            fontSize: 25,
          ),
        ),
      ),
    );
  }

  RotatedBox _textLoginRotate() {
    return RotatedBox(
      quarterTurns: 1,
      child: Text(
        'Login',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.white,
          fontSize: 25,
        ),
      ),
    );
  }
}
