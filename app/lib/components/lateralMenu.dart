import 'package:flutter/material.dart';
import 'package:invenmanager/screens/profile_page.dart';

class LateralMenu extends StatelessWidget {
  const LateralMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: const Color(0xFF121212),
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
                      color: Colors.white,
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
                    style: TextStyle(color: Color(0xFFF7DD43)),
                  ),
                ),
              ],
            ),
          ),
          // const Divider(
          //   color: Color(0xFFF7DD43),
          //   thickness: 1,
          // ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ListTile(
                title: const Text(
                  '85 Produtos cadastrados',
                  style: TextStyle(color: Color(0xFFC4C4CC)),
                ),
                onTap: () {},
              ),
              ListTile(
                title: const Text(
                  '9 produtos em falta',
                  style: TextStyle(color: Color(0xFFC4C4CC)),
                ),
                onTap: () {},
              ),
            ],
          ),

          const SizedBox(height: 20),
          const Divider(
            color: Color(0xFFF7DD43),
            thickness: 1,
          ),
          ListTile(
            leading: const Icon(Icons.exit_to_app, color: Color(0xFFF7DD43)),
            title: const Text(
              'Sair',
              style: TextStyle(color: Color(0xFFF7DD43)),
            ),
            onTap: () {
              // Ação ao clicar em "Sair"
            },
          ),
        ],
      ),
    );
  }
}
