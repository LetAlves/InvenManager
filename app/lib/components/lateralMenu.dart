import 'package:flutter/material.dart';
import 'package:invenmanager/global/invenmanager_colors.dart';
import 'package:invenmanager/screens/inventory_history_page.dart';
import 'package:invenmanager/screens/profile_page.dart';

class LateralMenu extends StatelessWidget {
  const LateralMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Color(InvenmanagerColors.black),
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: const BoxDecoration(color: Colors.transparent),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                const CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage('lib/assets/profile_image.jpg'),
                ),
                Text(
                  'John Doe',
                  style: TextStyle(
                      color: Color(InvenmanagerColors.white),
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Profilepage()));
                  },
                  child: Text(
                    'Ver perfil',
                    style: TextStyle(color: Color(InvenmanagerColors.yellow)),
                  ),
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ListTile(
                title: Text(
                  '85 Produtos cadastrados',
                  style: TextStyle(color: Color(InvenmanagerColors.gray_200)),
                ),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const InventoryHistoryPage()));
                },
              ),
              ListTile(
                title: Text(
                  '9 produtos em falta',
                  style: TextStyle(color: Color(InvenmanagerColors.gray_200)),
                ),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const InventoryHistoryPage()));
                },
              ),
            ],
          ),
          const SizedBox(height: 20),
          Divider(
            color: Color(InvenmanagerColors.yellow),
            thickness: 1,
          ),
          ListTile(
            leading: Icon(Icons.exit_to_app,
                color: Color(InvenmanagerColors.yellow)),
            title: Text(
              'Sair',
              style: TextStyle(color: Color(InvenmanagerColors.yellow)),
            ),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
