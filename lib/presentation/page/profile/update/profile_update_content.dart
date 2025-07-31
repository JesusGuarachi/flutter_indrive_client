import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:indrive_client/domain/models/user.dart';
import 'package:indrive_client/presentation/page/auth/utils/bloc_form_item.dart';
import 'package:indrive_client/presentation/page/profile/update/bloc/profile_update_bloc.dart';
import 'package:indrive_client/presentation/page/profile/update/bloc/profile_update_event.dart';
import 'package:indrive_client/presentation/page/profile/update/bloc/profile_update_state.dart';
import 'package:indrive_client/presentation/widgets/default_icon_back.dart';
import 'package:indrive_client/presentation/widgets/default_text_field.dart';

class ProfileUpdateContent extends StatelessWidget {
  ProfileUpdateState? state;
  User? user;
  ProfileUpdateContent({this.state, this.user});
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [
            _headerProfile(context),
            Spacer(),
            _actionProfile(context, 'Actulizar usuario', Icons.check),

            SizedBox(height: 50),
          ],
        ),
        _cardUserInfo(context),
        DefaultIconBack(margin: EdgeInsets.only(top: 60, left: 20)),
      ],
    );
  }

  _headerProfile(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.4,
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.only(top: 70),
      alignment: Alignment.topCenter,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [
            const Color.fromARGB(255, 12, 38, 145),
            const Color.fromARGB(255, 34, 156, 249),
          ],
        ),
      ),
      child: Text(
        'ACTULIZAR PERFIL',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.white,
          fontSize: 20,
        ),
      ),
    );
  }

  _actionProfile(BuildContext context, String option, IconData icon) {
    return GestureDetector(
      onTap: () {
        print('object');
        if (state!.formKey != null) {
          if (state!.formKey!.currentState!.validate()) {
            context.read<ProfileUpdateBloc>().add(FormSubmitEvent());
          }
        } else {
          context.read<ProfileUpdateBloc>().add(FormSubmitEvent());
        }
      },
      child: Container(
        margin: EdgeInsets.only(left: 20, right: 35, top: 15),
        child: ListTile(
          title: Text(option, style: TextStyle(fontWeight: FontWeight.bold)),
          leading: Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [
                  const Color.fromARGB(255, 12, 38, 145),
                  const Color.fromARGB(255, 34, 156, 249),
                ],
              ),
              borderRadius: BorderRadius.all(Radius.circular(50)),
            ),
            child: Icon(icon, color: Colors.white),
          ),
        ),
      ),
    );
  }

  _cardUserInfo(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 35, right: 35, top: 150),
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.5,
      child: Card(
        color: Colors.white,
        surfaceTintColor: Colors.white,
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 15),
              width: 120,
              child: AspectRatio(
                aspectRatio: 1,
                child: ClipOval(
                  child: FadeInImage.assetNetwork(
                    placeholder: 'assets/img/user_image.png',
                    image:
                        'https://www.orbitmedia.com/wp-content/uploads/2023/06/Andy-Profile-600.png',
                    fit: BoxFit.cover,
                    fadeInDuration: Duration(seconds: 1),
                  ),
                ),
              ),
            ),
            DefaultTextField(
              onChanged: (texto) {
                context.read<ProfileUpdateBloc>().add(
                  NameChangedEvent(name: BlocFormItem(value: texto)),
                );
              },
              text: 'Nombre',
              margin: EdgeInsets.only(left: 30, right: 30, top: 15),
              backgroundColor: Colors.grey.shade200,
              icon: Icons.person_2_outlined,
              intialValue: user?.name,
              validator: (value) {
                return state?.name.error;
              },
            ),
            DefaultTextField(
              onChanged: (texto) {
                context.read<ProfileUpdateBloc>().add(
                  LastNameChangedEvent(lastName: BlocFormItem(value: texto)),
                );
              },
              text: 'Apellido',
              icon: Icons.person_2_outlined,
              margin: EdgeInsets.only(left: 30, right: 30, top: 15),
              backgroundColor: Colors.grey.shade200,
              intialValue: user?.lastname,
              validator: (value) {
                return state?.lastName.error;
              },
            ),
            DefaultTextField(
              onChanged: (texto) {
                context.read<ProfileUpdateBloc>().add(
                  PhoneChangedEvent(phone: BlocFormItem(value: texto)),
                );
              },
              text: 'Telefono',
              icon: Icons.person_2_outlined,
              margin: EdgeInsets.only(left: 30, right: 30, top: 15),
              backgroundColor: Colors.grey.shade200,
              intialValue: user?.phone,
              validator: (value) {
                return state?.phone.error;
              },
            ),
          ],
        ),
      ),
    );
  }
}
