import 'package:flutter/material.dart';
import 'package:invenmanager/layout/bottom_navbar.dart';
import 'package:invenmanager/layout/lateral_menu.dart';
import 'package:invenmanager/global/app_color.dart';
import 'package:invenmanager/pages/create_product_page.dart';
import 'package:invenmanager/pages/search_page.dart';
import 'package:invenmanager/widget/custom_button.dart';

class Homepage extends StatelessWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Meu inventário'),
          centerTitle: true,
          backgroundColor: AppColor.gray_800,
          actions: <Widget>[
            Builder(
              builder: (context) => IconButton(
                icon: const Icon(Icons.more_vert),
                tooltip: 'Configurações',
                onPressed: () {
                  Scaffold.of(context).openEndDrawer();
                },
              ),
            )
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 24.0, horizontal: 20.0),
          child: Column(
            children: <Widget>[
              CustomButton(
                label: 'Buscar',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SearchPage(),
                    ),
                  );
                },
              ),
              const SizedBox(height: 16),
              Container(
                width: 335,
                height: 1,
                color: AppColor.gray_600,
              ),
              const SizedBox(height: 16),
              Wrap(
                children: [
                  const Text(
                      'Você ainda não tem nenhum produto cadastrado, que tal '),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const CreateProductPage()));
                    },
                    child: const Text(
                      'adicionar algum ao estoque?',
                      style: TextStyle(color: AppColor.yellow),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
        endDrawer: const LateralMenu(),
        bottomNavigationBar: const BottomNavBar());
  }
}
