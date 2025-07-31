import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:indrive_client/presentation/page/profile/info/bloc/profile_info_bloc.dart';
import 'package:indrive_client/presentation/page/profile/info/bloc/profile_info_state.dart';
import 'package:indrive_client/presentation/page/profile/info/profiile_info_content.dart';

class ProfileInfoPage extends StatefulWidget {
  const ProfileInfoPage({super.key});

  @override
  State<ProfileInfoPage> createState() => _ProfileInfoPageState();
}

class _ProfileInfoPageState extends State<ProfileInfoPage> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileInfoBloc, ProfileInfoState>(
      builder: (context, state) {
        return Scaffold(body: ProfiileInfoContent(state.user));
      },
    );
  }
}
