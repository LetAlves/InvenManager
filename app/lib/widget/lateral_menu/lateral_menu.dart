import 'package:flutter/material.dart';
import 'package:invenmanager/global/app_color.dart';
import 'package:invenmanager/global/app_text_style.dart';
import 'package:invenmanager/global/routes.dart';
import 'package:invenmanager/locator.dart';
import 'package:invenmanager/services/user_service.dart';
import 'package:invenmanager/services/secure_storage.dart';
import 'package:invenmanager/widget/custom_circular_progress_indicator.dart';
import 'package:invenmanager/widget/lateral_menu/lateral_menu_controller.dart';

class LateralMenu extends StatefulWidget {
  const LateralMenu({Key? key}) : super(key: key);

  @override
  State<LateralMenu> createState() => _LateralMenuState();
}

class _LateralMenuState extends State<LateralMenu> {
  final _secureStorage = const SecureStorage();
  final _currentUser = UserRepository().getUser();
  final _controller = locator.get<LateralMenuController>();

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  void initState() {
    super.initState();
  }

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
                  _currentUser!.displayName!,
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
              FutureBuilder<int>(
                future: _controller.getTotalProducts(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const CustomCircularProgressIndicator();
                  } else if (snapshot.hasError) {
                    return Text(
                      'Erro ao carregar a quantidade de produtos',
                      style: AppTextStyle.mediumTextBold
                          .copyWith(color: AppColor.red),
                    );
                  } else if (snapshot.hasData) {
                    return ListTile(
                      title: Text(
                        snapshot.data == 0
                            ? 'nenhum produto cadastrado'
                            : '${snapshot.data} produtos cadastrados',
                        style: AppTextStyle.mediumTextBold
                            .copyWith(color: AppColor.gray_200),
                      ),
                      onTap: () {
                        Navigator.pushReplacementNamed(
                            context, NamedRoutes.initial);
                      },
                    );
                  } else {
                    return Text(
                      'Nenhum produto encontrado',
                      style: AppTextStyle.mediumTextBold
                          .copyWith(color: AppColor.gray_200),
                    );
                  }
                },
              ),
              FutureBuilder<int>(
                future: _controller.getMissingTotalProducts(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const CustomCircularProgressIndicator();
                  } else if (snapshot.hasError) {
                    return Text(
                      'Erro ao carregar a quantidade de produtos',
                      style: AppTextStyle.mediumTextBold
                          .copyWith(color: AppColor.red),
                    );
                  } else if (snapshot.hasData) {
                    return ListTile(
                      title: Text(
                        snapshot.data == 0
                            ? 'nenhum produto em falta'
                            : '${snapshot.data} produtos em falta',
                        style: AppTextStyle.mediumTextBold
                            .copyWith(color: AppColor.gray_200),
                      ),
                      onTap: () {
                        Navigator.pushReplacementNamed(
                            context, NamedRoutes.initial);
                      },
                    );
                  } else {
                    return Text(
                      '',
                      style: AppTextStyle.mediumTextBold
                          .copyWith(color: AppColor.gray_200),
                    );
                  }
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
