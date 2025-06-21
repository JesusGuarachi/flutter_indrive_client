import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:indrive_client/presentation/page/auth/register/bloc/register_bloc.dart';
import 'package:indrive_client/presentation/page/auth/utils/bloc_form_item.dart';
import 'package:indrive_client/presentation/widgets/default_button.dart';
import 'package:indrive_client/presentation/widgets/default_text_field_Outlined.dart';

class RegisterContent extends StatelessWidget {
  RegisterState state;
  RegisterContent(this.state, {super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: state.formKey,
      child: Stack(
        children: [
          Container(
            padding: EdgeInsets.only(left: 10),
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [Colors.black87, Colors.blueAccent],
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _textLoginRotate(context: context),
                SizedBox(height: 50),
                _textRegisterRotate(),
                SizedBox(height: 50),
              ],
            ),
          ),
          Container(),
          Container(
            margin: EdgeInsets.only(left: 60, bottom: 30),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(35),
                bottomLeft: Radius.circular(35),
              ),
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  const Color.fromARGB(255, 199, 212, 222),
                  const Color.fromARGB(255, 8, 147, 216),
                ],
              ),
            ),
            child: Stack(
              children: [
                _imageBackground(context),
                SingleChildScrollView(
                  child: Column(
                    children: [
                      _imageBanner(),
                      DefaultTextFieldOutlined(
                        onChanged: (text) {
                          context.read<RegisterBloc>().add(
                            NombreChangedEvent(
                              nombre: BlocFormItem(value: text),
                            ),
                          );
                        },
                        validator: (value) {
                          return context
                              .read<RegisterBloc>()
                              .state
                              .nombre
                              .error;
                        },
                        text: 'Nombre',
                        icon: Icons.person_2_outlined,
                      ),
                      DefaultTextFieldOutlined(
                        onChanged: (text) {
                          context.read<RegisterBloc>().add(
                            ApellidoChangedEvent(
                              apellido: BlocFormItem(value: text),
                            ),
                          );
                        },
                        validator: (value) {
                          return context
                              .read<RegisterBloc>()
                              .state
                              .apellido
                              .error;
                        },
                        text: 'Apellido',
                        icon: Icons.person_2_outlined,
                        margin: EdgeInsets.only(left: 20, right: 20, top: 15),
                      ),
                      DefaultTextFieldOutlined(
                        onChanged: (text) {
                          context.read<RegisterBloc>().add(
                            EmailChangedEvent(email: BlocFormItem(value: text)),
                          );
                        },
                        validator: (value) {
                          return context.read<RegisterBloc>().state.email.error;
                        },
                        text: 'Email',
                        icon: Icons.person_2_outlined,
                        margin: EdgeInsets.only(left: 20, right: 20, top: 15),
                      ),
                      DefaultTextFieldOutlined(
                        onChanged: (text) {
                          context.read<RegisterBloc>().add(
                            TelefonoChangedEvent(
                              telefono: BlocFormItem(value: text),
                            ),
                          );
                        },
                        validator: (value) {
                          return context
                              .read<RegisterBloc>()
                              .state
                              .telefono
                              .error;
                        },
                        text: 'Telefono',
                        icon: Icons.person_2_outlined,
                        margin: EdgeInsets.only(left: 20, right: 20, top: 15),
                      ),
                      DefaultTextFieldOutlined(
                        onChanged: (text) {
                          context.read<RegisterBloc>().add(
                            PasswordChangedEvent(
                              password: BlocFormItem(value: text),
                            ),
                          );
                        },
                        validator: (value) {
                          return context
                              .read<RegisterBloc>()
                              .state
                              .password
                              .error;
                        },
                        text: 'Passoword',
                        icon: Icons.person_2_outlined,

                        margin: EdgeInsets.only(left: 20, right: 20, top: 15),
                      ),
                      DefaultTextFieldOutlined(
                        onChanged: (text) {
                          context.read<RegisterBloc>().add(
                            ConfirmarPasswordChangedEvent(
                              confirmarPassword: BlocFormItem(value: text),
                            ),
                          );
                        },
                        validator: (value) {
                          return context
                              .read<RegisterBloc>()
                              .state
                              .confirmarPassword
                              .error;
                        },
                        text: 'Confirmar Passoword',
                        icon: Icons.person_2_outlined,
                        margin: EdgeInsets.only(left: 20, right: 20, top: 15),
                      ),
                      DefaultButton(
                        text: 'Crear usuario',
                        onPressed: () {
                          if (state.formKey!.currentState!.validate()) {
                            context.read<RegisterBloc>().add(FormSubmitEvent());
                          } else {
                            print('Formulario no valido');
                          }
                        },
                        margin: EdgeInsets.only(left: 20, right: 20, top: 15),
                      ),
                      _separatorOr(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Row _textDontHaveAccount() {
    return Row(
      children: [
        Text(
          'No tienes cuenta?',
          style: TextStyle(color: Color(0xffBDBDBD), fontSize: 18),
        ),
        SizedBox(width: 20),
        Text(
          'Registrar',
          style: TextStyle(
            color: Color(0xffBDBDBD),
            fontSize: 18,
            fontWeight: FontWeight.bold,
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

  Container _imageBanner() {
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.only(top: 60),

      child: Image.asset('assets/img/delivery.png', width: 150, height: 150),
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

  RotatedBox _textRegisterRotate() {
    return RotatedBox(
      quarterTurns: 1,
      child: Text(
        'Registro',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.white,
          fontSize: 25,
        ),
      ),
    );
  }

  Widget _textLoginRotate({required BuildContext context}) {
    return GestureDetector(
      onTap: () {
        Navigator.pop(context);
      },
      child: RotatedBox(
        quarterTurns: 1,
        child: Text(
          'Login',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
            fontSize: 25,
          ),
        ),
      ),
    );
  }

  Widget _imageBackground(BuildContext context) {
    return Container(
      alignment: Alignment.bottomCenter,
      margin: EdgeInsets.only(bottom: 300),
      child: Image.asset(
        'assets/img/destination.png',
        width: MediaQuery.of(context).size.width * 0.6,
        height: MediaQuery.of(context).size.height * 0.4,
        opacity: AlwaysStoppedAnimation(0.2),
      ),
    );
  }
}
