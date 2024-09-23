import 'package:flutter/material.dart';
import 'package:invenmanager/screens/profilepage.dart';

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
                    'BUSCAR',
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
        endDrawer: Drawer(
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
                      backgroundImage:
                          AssetImage('lib/assets/profile_image.jpg'),
                    ),
                    const Text(
                      'John Due',
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
                leading:
                    const Icon(Icons.exit_to_app, color: Color(0xFFF7DD43)),
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
        ),
        bottomNavigationBar: BottomAppBar(
          color: const Color(0xFF1E1E1E),
          child: Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton.icon(
                  onPressed: () {},
                  label: const Text(
                    'Novo Produto',
                    style: TextStyle(color: Color(0xFF8D8D99)),
                  ),
                  icon: const Icon(
                    Icons.add_circle_outline,
                    color: Color(0xFF8D8D99),
                  ),
                ),
                TextButton.icon(
                  onPressed: () {},
                  label: const Text(
                    'Meu inventário',
                    style: TextStyle(color: Color(0xFFF7DD43)),
                  ),
                  icon: const Icon(
                    Icons.inventory,
                    color: Color(0xFFF7DD43),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
