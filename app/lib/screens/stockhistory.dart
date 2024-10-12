import 'package:flutter/material.dart';
import 'package:invenmanager/screens/profile_page.dart';

class Stockhistory extends StatelessWidget {
  const Stockhistory({Key? key}) : super(key: key);

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
              const SizedBox(height: 16),
              Container(
                width: 380,
                height: 1,
                color: const Color(0xFF323238),
              ),
              const SizedBox(height: 16),
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
                    color: Color(0xFF202024), // Fundo
                    borderRadius: BorderRadius.circular(10),
                    border: Border(
                      bottom: BorderSide(
                        color: Color(0xFFF7DD43),
                        width: 2.0,
                      ),
                    ), // Bordas arredondadas (opcional)
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Estoque Atualizado',
                        style: TextStyle(
                          color: Color(0xFFFFFFFF),
                          fontSize: 15,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        '20 de Novembro de 2023 às 12:00',
                        style: TextStyle(color: Color(0xFFC4C4CC)),
                      ),
                      const SizedBox(height: 16),

                      // Row para texto e formulário lado a lado
                      Row(
                        mainAxisAlignment: MainAxisAlignment
                            .center, // Centraliza na horizontal
                        children: [
                          Text(
                            'De:',
                            style: TextStyle(color: Color(0xFFC4C4CC)),
                          ),
                          const SizedBox(
                              width: 20), // Espaço entre o texto e o formulário

                          // Formulário para nova quantidade
                          SizedBox(
                            width: 70, // Largura do formulário
                            child: TextFormField(
                              decoration: const InputDecoration(
                                filled: true,
                                fillColor:
                                    Color(0xFF2C2C2C), // Cor de fundo do campo
                                hintText: '50',
                                hintStyle: TextStyle(color: Colors.grey),
                                border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(8.0)),
                                  borderSide: BorderSide.none,
                                ),
                              ),
                              style: TextStyle(color: Colors.white),
                              keyboardType: TextInputType
                                  .number, // Define o teclado numérico
                              textAlign: TextAlign
                                  .center, // Centraliza o hintText e o texto digitado
                            ),
                          ),
                          const SizedBox(width: 20),
                          Text(
                            'Para:',
                            style: TextStyle(color: Color(0xFFC4C4CC)),
                          ),
                          const SizedBox(
                              width: 20), // Espaço entre o texto e o formulário

                          // Formulário para nova quantidade
                          SizedBox(
                            width: 70, // Largura do formulário
                            child: TextFormField(
                              decoration: const InputDecoration(
                                filled: true,
                                fillColor:
                                    Color(0xFF2C2C2C), // Cor de fundo do campo
                                hintText: '80',
                                hintStyle: TextStyle(color: Colors.grey),
                                border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(8.0)),
                                  borderSide: BorderSide.none,
                                ),
                              ),
                              style: TextStyle(color: Colors.white),
                              keyboardType: TextInputType
                                  .number, // Define o teclado numérico
                              textAlign: TextAlign
                                  .center, // Centraliza o hintText e o texto digitado
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 30),
              Center(
                child: Container(
                  padding: const EdgeInsets.all(20.0), // Espaçamento interno
                  decoration: BoxDecoration(
                    color: Color(0xFF202024), // Fundo
                    borderRadius: BorderRadius.circular(10),
                    border: Border(
                      bottom: BorderSide(
                        color: Color(0xFFF7DD43),
                        width: 2.0,
                      ),
                    ), // Bordas arredondadas (opcional)
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Estoque Atualizado',
                        style: TextStyle(
                          color: Color(0xFFFFFFFF),
                          fontSize: 15,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        '20 de Novembro de 2023 às 12:00',
                        style: TextStyle(color: Color(0xFFC4C4CC)),
                      ),
                      const SizedBox(height: 16),

                      // Row para texto e formulário lado a lado
                      Row(
                        mainAxisAlignment: MainAxisAlignment
                            .center, // Centraliza na horizontal
                        children: [
                          Text(
                            'De:',
                            style: TextStyle(color: Color(0xFFC4C4CC)),
                          ),
                          const SizedBox(
                              width: 20), // Espaço entre o texto e o formulário

                          // Formulário para nova quantidade
                          SizedBox(
                            width: 70, // Largura do formulário
                            child: TextFormField(
                              decoration: const InputDecoration(
                                filled: true,
                                fillColor:
                                    Color(0xFF2C2C2C), // Cor de fundo do campo
                                hintText: '50',
                                hintStyle: TextStyle(color: Colors.grey),
                                border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(8.0)),
                                  borderSide: BorderSide.none,
                                ),
                              ),
                              style: TextStyle(color: Colors.white),
                              keyboardType: TextInputType
                                  .number, // Define o teclado numérico
                              textAlign: TextAlign
                                  .center, // Centraliza o hintText e o texto digitado
                            ),
                          ),
                          const SizedBox(width: 20),
                          Text(
                            'Para:',
                            style: TextStyle(color: Color(0xFFC4C4CC)),
                          ),
                          const SizedBox(
                              width: 20), // Espaço entre o texto e o formulário

                          // Formulário para nova quantidade
                          SizedBox(
                            width: 70, // Largura do formulário
                            child: TextFormField(
                              decoration: const InputDecoration(
                                filled: true,
                                fillColor:
                                    Color(0xFF2C2C2C), // Cor de fundo do campo
                                hintText: '80',
                                hintStyle: TextStyle(color: Colors.grey),
                                border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(8.0)),
                                  borderSide: BorderSide.none,
                                ),
                              ),
                              style: TextStyle(color: Colors.white),
                              keyboardType: TextInputType
                                  .number, // Define o teclado numérico
                              textAlign: TextAlign
                                  .center, // Centraliza o hintText e o texto digitado
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                    ],
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
