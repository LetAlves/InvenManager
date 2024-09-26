import 'package:flutter/material.dart';
import 'package:invenmanager/components/bottomNavBar.dart';
import 'package:invenmanager/components/lateralMenu.dart';

class Homepage extends StatelessWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Meu inventário'),
          centerTitle: true,
          backgroundColor: const Color(0xFF1E1E1E),
          actions: <Widget>[
            Builder(
                builder: (context) => IconButton(
                      icon: const Icon(Icons.more_vert),
                      tooltip: 'Configurações',
                      onPressed: () {
                        //Abre o menu lateral
                        Scaffold.of(context).openEndDrawer();
                      },
                    ))
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 24.0, horizontal: 20.0),
          child: Column(
            children: <Widget>[
              ElevatedButton.icon(
                  onPressed: () {},
                  label: const Text(
                    'Buscar',
                    style: TextStyle(color: Color(0xFF1E1E1E)),
                  ),
                  icon: const Icon(
                    Icons.search,
                    color: Color(0xFF1E1E1E),
                  ),
                  style: ElevatedButton.styleFrom(
                    textStyle: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                    backgroundColor: const Color(0xFFF7DD43),
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
                color: const Color(0xFF323238),
              ),
              const SizedBox(height: 16),
              Wrap(
                children: [
                  const Text(
                      'Você ainda não tem nenhum produto cadastrado, que tal '),
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      'adicionar algum ao estoque?',
                      style: TextStyle(color: Color(0xFFF7DD43)),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
        endDrawer: LateralMenu(),
        bottomNavigationBar: BottomNavBar());
  }
}
