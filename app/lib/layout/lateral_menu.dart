import 'package:flutter/material.dart';
import 'package:invenmanager/global/app_color.dart';
import 'package:invenmanager/global/app_text_style.dart';
import 'package:invenmanager/global/routes.dart';
import 'package:invenmanager/services/secure_storage.dart';

class LateralMenu extends StatefulWidget {
  const LateralMenu({Key? key}) : super(key: key);

  @override
  State<LateralMenu> createState() => _LateralMenuState();
}

class _LateralMenuState extends State<LateralMenu> {
  final _secureStorage = const SecureStorage();

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppColor.gray_900,
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
                  style: AppTextStyle.mediumTextBold
                      .copyWith(color: AppColor.white),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, NamedRoutes.editAccount);
                  },
                  child: Text(
                    'Ver perfil',
                    style:
                        AppTextStyle.smallText.copyWith(color: AppColor.yellow),
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
                  style: AppTextStyle.mediumTextBold
                      .copyWith(color: AppColor.gray_200),
                ),
                onTap: () {
                  Navigator.pushReplacementNamed(context, NamedRoutes.initial);
                },
              ),
              ListTile(
                title: Text(
                  '9 produtos em falta',
                  style: AppTextStyle.mediumTextBold
                      .copyWith(color: AppColor.gray_200),
                ),
                onTap: () {
                  Navigator.pushReplacementNamed(context, NamedRoutes.initial);
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
            title: Text(
              'Sair',
              style:
                  AppTextStyle.mediumTextBold.copyWith(color: AppColor.yellow),
            ),
            onTap: () {
              _secureStorage
                  .delete(key: "CURRENT_USER")
                  .then((_) => Navigator.popAndPushNamed(
                        context,
                        NamedRoutes.login,
                      ));
            },
          ),
        ],
      ),
    );
  }
}
