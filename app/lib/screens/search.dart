import 'package:flutter/material.dart';

class Search extends StatelessWidget {
  const Search({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Busca'),
        centerTitle: true,
        backgroundColor: const Color(0xFF1E1E1E),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.more_vert),
            tooltip: 'Configurações',
            onPressed: () {},
          )
        ],
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.arrow_back_ios),
          tooltip: 'voltar',
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const Padding(
              padding: EdgeInsets.only(top: 20.0),
              child: Text(
                'Informações do produto',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 20),
            TextFormField(
              decoration: const InputDecoration(
                labelStyle: TextStyle(color: Color(0xFFC4C4CC)),
                filled: true,
                fillColor: Color(0xFF2C2C2C),
                hintText: 'Digite o nome ou o código do produto',
                hintStyle: TextStyle(color: Colors.grey),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8.0)),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton.icon(
                onPressed: () {},
                label: const Text(
                  'BUSCAR PRODUTO',
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
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                ))
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
