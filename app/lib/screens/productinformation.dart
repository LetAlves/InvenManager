import 'package:flutter/material.dart';
import 'package:invenmanager/screens/profilepage.dart';

class ProductInformation extends StatelessWidget {
  const ProductInformation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Informações do Produto'),
        centerTitle: true,
        backgroundColor: const Color(0xFF1E1E1E),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.file_upload_outlined),
            tooltip: 'Upload',
            onPressed: () {},
          ),
        ],
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.arrow_back_ios),
          tooltip: 'voltar',
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 24.0, horizontal: 20.0),
        child: Center(
          // Centraliza todos os elementos
          child: Column(
            mainAxisAlignment:
                MainAxisAlignment.start, // Centraliza verticalmente
            children: <Widget>[
              const Text(
                'Produto 1',
                style: TextStyle(
                  color: Color(0xFFFFFFFF),
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: const [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Quantidade em estoque: 50',
                        style: TextStyle(color: Color(0xFFC4C4CC)),
                      ),
                      Text(
                        'Estoque mínimo: 10',
                        style: TextStyle(color: Color(0xFFC4C4CC)),
                      ),
                    ],
                  ),
                  Text(
                    'Código: 0000010',
                    style: TextStyle(color: Color(0xFFC4C4CC)),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment
                    .spaceAround, // Distribui espaço entre os botões
                children: [
                  ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      textStyle: const TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                      ),
                      backgroundColor: const Color(0xFF202024),
                      minimumSize: const Size(100, 48),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 10),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onPressed: () {},
                    icon: Icon(
                      Icons.history,
                      color: Color(0xFFFFFFFF),
                    ), // Ícone opcional
                    label: const Text(
                      'Histórico de Ações',
                      style: TextStyle(color: Color(0xFFFFFFFF)),
                    ),
                  ),
                  ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      textStyle: const TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                      ),
                      backgroundColor: const Color(0xFF202024),
                      minimumSize: const Size(50, 48),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 50, vertical: 10),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onPressed: () {},
                    icon: Icon(
                      Icons.pending_actions,
                      color: Color(0xFFFFFFFF),
                    ), // Ícone opcional
                    label: Text(
                      'Ações',
                      style: TextStyle(color: Color(0xFFFFFFFF)),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30),
              Center(
                child: Container(
                  padding: const EdgeInsets.all(20.0), // Espaçamento interno
                  decoration: BoxDecoration(
                    color: Color(0xFF202024), // Fundo rosa
                    borderRadius: BorderRadius.circular(10),
                    border: Border(
                      bottom: BorderSide(
                        color: Color(0xFFF7DD43),
                        width: 2.0,
                      ),
                    ), // Bordas arredondadas (opcional)
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'Atualizar Estoque',
                            style: TextStyle(
                              color: Color(0xFFFFFFFF),
                              fontSize: 15,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                          const SizedBox(height: 16),
                          Text(
                            'Nova Quantidade: 10',
                            style: TextStyle(color: Color(0xFFC4C4CC)),
                          ),
                          const SizedBox(height: 30),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 30),
              ElevatedButton.icon(
                onPressed: () {},
                label: const Text(
                  'CONFIRMAR ESTOQUE',
                  style: TextStyle(color: Color(0xFFFFFFFF)),
                ),
                icon: const Icon(
                  Icons.check,
                  color: Color(0xFFFFFFFF),
                ),
                style: ElevatedButton.styleFrom(
                  textStyle: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                  backgroundColor: const Color(0xFF047C3F),
                  minimumSize: const Size(335, 52),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
              ),
            ],
          ),
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
                    backgroundImage: AssetImage('lib/assets/profile_image.jpg'),
                  ),
                  const Text(
                    'John Due',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Profilepage()),
                      );
                    },
                    child: const Text(
                      'Ver perfil',
                      style: TextStyle(color: Color(0xFFF7DD43)),
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
      ),
      bottomNavigationBar: BottomAppBar(
        color: const Color(0xFF1E1E1E),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
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
      ),
    );
  }
}
