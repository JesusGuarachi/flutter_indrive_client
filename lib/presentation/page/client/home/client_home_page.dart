import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:indrive_client/main.dart';
import 'package:indrive_client/presentation/page/client/home/bloc/client_home_bloc.dart';
import 'package:indrive_client/presentation/page/client/home/bloc/client_home_event.dart';
import 'package:indrive_client/presentation/page/client/home/bloc/client_home_state.dart';
import 'package:indrive_client/presentation/page/profile/info/profile_file_info_page.dart';

class ClientHomePage extends StatefulWidget {
  const ClientHomePage({super.key});

  @override
  State<ClientHomePage> createState() => _ClientHomePageState();
}

class _ClientHomePageState extends State<ClientHomePage> {
  List<Widget> pageList = [ProfileFileInfoPage()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Menu de Opciones')),
      body: BlocBuilder<ClientHomeBloc, ClientHomeState>(
        builder: (context, state) {
          return pageList[state.pageIndex];
        },
      ),
      drawer: BlocBuilder<ClientHomeBloc, ClientHomeState>(
        builder: (context, state) {
          return Drawer(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                DrawerHeader(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        const Color.fromARGB(255, 67, 143, 201),
                        const Color.fromARGB(255, 8, 147, 216),
                      ],
                    ),
                  ),
                  child: Text(
                    'Menu del cliente',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                ListTile(
                  title: Text('Perfil del usuario'),
                  selected: state.pageIndex == 0,
                  onTap: () {
                    context.read<ClientHomeBloc>().add(
                      ChangeDrawerPage(pageIndex: 0),
                    );
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  title: Text('Cerrar Session'),
                  selected: state.pageIndex == 0,
                  onTap: () {
                    context.read<ClientHomeBloc>().add(Logout());
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => MyApp()),
                      (route) => false,
                    );
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
