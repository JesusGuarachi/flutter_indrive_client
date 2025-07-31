import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:indrive_client/domain/models/user.dart';
import 'package:indrive_client/presentation/page/profile/update/bloc/profile_update_bloc.dart';
import 'package:indrive_client/presentation/page/profile/update/bloc/profile_update_event.dart';
import 'package:indrive_client/presentation/page/profile/update/bloc/profile_update_state.dart';
import 'package:indrive_client/presentation/page/profile/update/profile_update_content.dart';

class ProfileUpdatePage extends StatefulWidget {
  const ProfileUpdatePage({super.key});

  @override
  State<ProfileUpdatePage> createState() => _ProfileUpdatePageState();
}

class _ProfileUpdatePageState extends State<ProfileUpdatePage> {
  User? user;
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context.read<ProfileUpdateBloc>().add(ProfileUpdateInitEvent(user: user));
    });
  }

  @override
  Widget build(BuildContext context) {
    user = ModalRoute.of(context)?.settings.arguments as User;
    return BlocBuilder<ProfileUpdateBloc, ProfileUpdateState>(
      builder: (context, state) {
        return Scaffold(body: ProfileUpdateContent(state: state, user: user));
      },
    );
  }
}
