import 'package:flutter/material.dart';
import 'package:invenmanager/global/app_color.dart';
import 'package:invenmanager/global/app_text_style.dart';
import 'package:invenmanager/pages/home/home_page.dart';
import 'package:invenmanager/pages/user/edit_account_page.dart';

class LateralMenu extends StatelessWidget {
  const LateralMenu({Key? key}) : super(key: key);

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
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const EditAccountPage()));
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
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const Homepage()));
                },
              ),
              ListTile(
                title: Text(
                  '9 produtos em falta',
                  style: AppTextStyle.mediumTextBold
                      .copyWith(color: AppColor.gray_200),
                ),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const Homepage()));
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
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
