import 'package:flutter/material.dart';

<<<<<<< HEAD
class Addnewproduct extends StatelessWidget {
  const Addnewproduct({super.key});
=======
class Addnewproduct extends StatefulWidget {
  const Addnewproduct({Key? key}) : super(key: key);
>>>>>>> 35bbb51a34d8fb0d1dc3617539d44fd8721126b5

  @override 
  _AddnewproductState createState() => _AddnewproductState();
}

class _AddnewproductState extends State<Addnewproduct> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Adicionar novo produto'),
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
<<<<<<< HEAD
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
=======
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Form(
          key: _formKey, 
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
>>>>>>> 35bbb51a34d8fb0d1dc3617539d44fd8721126b5
                ),
              ),
              const SizedBox(height: 20),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Nome:',
                  labelStyle: TextStyle(color: Color(0xFFC4C4CC)),
                  filled: true,
                  fillColor: Color(0xFF2C2C2C),
                  hintText: 'Produto',
                  hintStyle: TextStyle(color: Colors.grey),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8.0)),
                    borderSide: BorderSide.none,
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira o nome do produto';
                  }
                  return null;
                },
              ),
<<<<<<< HEAD
            ),
            const SizedBox(height: 20),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Valor unitário:',
                labelStyle: TextStyle(color: Color(0xFFC4C4CC)),
                filled: true,
                fillColor: Color(0xFF2C2C2C),
                hintText: 'R\$ 100,00',
                hintStyle: TextStyle(color: Colors.grey),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8.0)),
                  borderSide: BorderSide.none,
=======
              const SizedBox(height: 20),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Valor unitário:',
                  labelStyle: TextStyle(color: Color(0xFFC4C4CC)),
                  filled: true,
                  fillColor: Color(0xFF2C2C2C),
                  hintText: 'R\$ 100,00',
                  hintStyle: TextStyle(color: Colors.grey),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8.0)),
                    borderSide: BorderSide.none,
                  ),
>>>>>>> 35bbb51a34d8fb0d1dc3617539d44fd8721126b5
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira o valor unitário';
                  }
                  final parsedValue = double.tryParse(value);
                    if (parsedValue == null) {
                  return 'Por favor, insira um número válido';
                }
                  return null;
                },
              ),
<<<<<<< HEAD
            ),
            const SizedBox(height: 20),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Codigo:',
                labelStyle: TextStyle(color: Color(0xFFC4C4CC)),
                filled: true,
                fillColor: Color(0xFF2C2C2C),
                hintText: '0000001',
                hintStyle: TextStyle(color: Colors.grey),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8.0)),
                  borderSide: BorderSide.none,
=======
              const SizedBox(height: 20),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Codigo:',
                  labelStyle: TextStyle(color: Color(0xFFC4C4CC)),
                  filled: true,
                  fillColor: Color(0xFF2C2C2C),
                  hintText: '0000001',
                  hintStyle: TextStyle(color: Colors.grey),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8.0)),
                    borderSide: BorderSide.none,
                  ),
>>>>>>> 35bbb51a34d8fb0d1dc3617539d44fd8721126b5
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira o código do produto';
                  }
                  return null;
                },
              ),
<<<<<<< HEAD
            ),
            const SizedBox(height: 20),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Quantidade:',
                labelStyle: TextStyle(color: Color(0xFFC4C4CC)),
                filled: true,
                fillColor: Color(0xFF2C2C2C),
                hintText: 'Ex. 10',
                hintStyle: TextStyle(color: Colors.grey),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8.0)),
                  borderSide: BorderSide.none,
=======
              const SizedBox(height: 20),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Quantidade:',
                  labelStyle: TextStyle(color: Color(0xFFC4C4CC)),
                  filled: true,
                  fillColor: Color(0xFF2C2C2C),
                  hintText: 'Ex. 10',
                  hintStyle: TextStyle(color: Colors.grey),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8.0)),
                    borderSide: BorderSide.none,
                  ),
>>>>>>> 35bbb51a34d8fb0d1dc3617539d44fd8721126b5
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira a quantidade do produto';
                  }
                  return null;
                },
              ),
<<<<<<< HEAD
            ),
            const SizedBox(height: 20),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Quantidade minima:',
                labelStyle: TextStyle(color: Color(0xFFC4C4CC)),
                filled: true,
                fillColor: Color(0xFF2C2C2C),
                hintText: 'Ex. 10',
                hintStyle: TextStyle(color: Colors.grey),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8.0)),
                  borderSide: BorderSide.none,
=======
              const SizedBox(height: 20),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Quantidade minima:',
                  labelStyle: TextStyle(color: Color(0xFFC4C4CC)),
                  filled: true,
                  fillColor: Color(0xFF2C2C2C),
                  hintText: 'Ex. 10',
                  hintStyle: TextStyle(color: Colors.grey),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8.0)),
                    borderSide: BorderSide.none,
                  ),
>>>>>>> 35bbb51a34d8fb0d1dc3617539d44fd8721126b5
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira a quantidade mínima';
                  }
                  return null;
                },
              ),
<<<<<<< HEAD
            ),
            const SizedBox(height: 20),
            ElevatedButton.icon(
                onPressed: () {},
=======
              const SizedBox(height: 20),
              ElevatedButton.icon(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Produto adicionado ao estoque')),
                    );
                  }
                },
>>>>>>> 35bbb51a34d8fb0d1dc3617539d44fd8721126b5
                label: const Text(
                  'Adicionar ao estoque',
                  style: TextStyle(color: Color(0xFF1E1E1E)),
                ),
                style: ElevatedButton.styleFrom(
                  textStyle: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                  backgroundColor: const Color(0xFFF7DD43),
                  minimumSize: const Size(335, 52),
<<<<<<< HEAD
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                ))
          ],
=======
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
              )
            ],
          ),
>>>>>>> 35bbb51a34d8fb0d1dc3617539d44fd8721126b5
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
