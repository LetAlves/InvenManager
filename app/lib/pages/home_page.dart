import 'package:flutter/material.dart';
import 'package:invenmanager/layout/bottomNavBar.dart';
import 'package:invenmanager/layout/lateralMenu.dart';
import 'package:invenmanager/global/invenmanager_colors.dart';
import 'package:invenmanager/pages/create_product_page.dart';
import 'package:invenmanager/pages/search_page.dart';

class Homepage extends StatelessWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Meu inventário'),
          centerTitle: true,
          backgroundColor: Color(InvenmanagerColors.gray_800),
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
              ElevatedButton.icon(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SearchPage(),
                      ),
                    );
                  },
                  label: Text(
                    'Buscar',
                    style: TextStyle(color: Color(InvenmanagerColors.gray_800)),
                  ),
                  icon: Icon(
                    Icons.search,
                    color: Color(InvenmanagerColors.gray_800),
                  ),
                  style: ElevatedButton.styleFrom(
                    textStyle: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                    backgroundColor: Color(InvenmanagerColors.yellow),
                    minimumSize: const Size(335, 52),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  )),
              const SizedBox(height: 16),
              Container(
                width: 335,
                height: 1,
                color: Color(InvenmanagerColors.gray_600),
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
                    child: Text(
                      'adicionar algum ao estoque?',
                      style: TextStyle(color: Color(InvenmanagerColors.yellow)),
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
