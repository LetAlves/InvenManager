import 'package:flutter/material.dart';
import 'package:invenmanager/global/app_color.dart';
import 'package:invenmanager/pages/inventory_history_page.dart';
import 'package:invenmanager/pages/profile_page.dart';

class LateralMenu extends StatelessWidget {
  const LateralMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppColor.black,
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
                const Text(
                  'John Doe',
                  style: TextStyle(
                      color: AppColor.white,
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
                  child: const Text(
                    'Ver perfil',
                    style: TextStyle(color: AppColor.yellow),
                  ),
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ListTile(
                title: const Text(
                  '85 Produtos cadastrados',
                  style: TextStyle(color: AppColor.gray_200),
                ),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const InventoryHistoryPage()));
                },
              ),
              ListTile(
                title: const Text(
                  '9 produtos em falta',
                  style: TextStyle(color: AppColor.gray_200),
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
          const Divider(
            color: AppColor.yellow,
            thickness: 1,
          ),
          ListTile(
            leading: const Icon(Icons.exit_to_app, color: AppColor.yellow),
            title: const Text(
              'Sair',
              style: TextStyle(color: AppColor.yellow),
            ),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
