import 'package:flutter/material.dart';
import 'package:tokio_marine/screens/login/login_screen.dart';
import 'package:tokio_marine/shared/utils/colors/colors.dart';
import 'package:tokio_marine/shared/utils/textstyles.model.dart';

class CustomDrawer extends StatelessWidget {
  String userName;
  CustomDrawer({Key? key, required this.userName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: ColorsModel.backgroundColor,
      child: ListView(
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(
                gradient: LinearGradient(colors: [
              ColorsModel.primaryColor,
              // ColorsModel.primaryColor,
              ColorsModel.secundaryColor,
            ])),
            child: Column(
              children: [
                const CircleAvatar(
                  child: FlutterLogo(),
                ),
                Text(
                  "Olá, $userName",
                  style: TextStylesModel.title,
                ),
              ],
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.menu_open_sharp,
              color: ColorsModel.primaryColor,
            ),
            title: Text(
              "Home/Cotar Seguro",
              style: TextStylesModel.subtitle,
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.verified_rounded,
              color: ColorsModel.primaryColor,
            ),
            title: Text("Minhas contratações", style: TextStylesModel.subtitle),
          ),
          ListTile(
            leading: Icon(
              Icons.error_rounded,
              color: ColorsModel.primaryColor,
            ),
            title: Text("Meus Sinistros", style: TextStylesModel.subtitle),
          ),
          ListTile(
            leading: Icon(
              Icons.people_alt,
              color: ColorsModel.primaryColor,
            ),
            title: Text("Minha Família", style: TextStylesModel.subtitle),
          ),
          ListTile(
            leading: Icon(
              Icons.drive_eta,
              color: ColorsModel.primaryColor,
            ),
            title: Text("Meus Bens", style: TextStylesModel.subtitle),
          ),
          ListTile(
            onTap: () {
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (_) => LoginScreen()));
            },
            leading: Icon(
              Icons.logout,
              color: ColorsModel.primaryColor,
            ),
            title: Text("Fazer Logout", style: TextStylesModel.subtitle),
          ),
        ],
      ),
    );
  }
}
