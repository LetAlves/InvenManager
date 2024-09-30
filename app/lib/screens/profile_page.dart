import 'package:flutter/material.dart';

class Profilepage extends StatefulWidget {
  const Profilepage({Key? key}) : super(key: key);

  @override
  State<Profilepage> createState() => _ProfilepageState();
}

class _ProfilepageState extends State<Profilepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Perfil'),
        centerTitle: true,
        backgroundColor: const Color(0xFF1E1E1E),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          child: Column(
            children: [
              ClipOval(
                child: Image.asset(
                  'lib/assets/profile_image.jpg',
                  height: 164,
                  width: 164,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 32),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Nome',
                  labelStyle: TextStyle(color: Color(0xFFC4C4CC)),
                  filled: true,
                  fillColor: Color(0xFF2C2C2C),
                  hintText: 'John Doe',
                  hintStyle: TextStyle(color: Colors.grey),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8.0)),
                    borderSide: BorderSide.none,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                        Radius.circular(8.0)), // Borda arredondada ao focar
                    borderSide:
                        BorderSide(color: Colors.grey), // Cor da borda ao focar
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                        Radius.circular(8.0)), // Borda arredondada quando ativo
                    borderSide: BorderSide.none, // Sem borda quando não focado
                  ),
                ),
                style: const TextStyle(
                    color: Colors.white), // Cor do texto digitado
                cursorColor: Colors.yellow, // Cor do cursor
              ),
              const SizedBox(height: 24),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'E-mail',
                  labelStyle: TextStyle(color: Color(0xFFC4C4CC)),
                  filled: true,
                  fillColor: Color(0xFF2C2C2C),
                  hintText: 'john.doe@email.com',
                  hintStyle: TextStyle(color: Colors.grey),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8.0)),
                    borderSide: BorderSide.none,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                        Radius.circular(8.0)), // Borda arredondada ao focar
                    borderSide:
                        BorderSide(color: Colors.grey), // Cor da borda ao focar
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                        Radius.circular(8.0)), // Borda arredondada quando ativo
                    borderSide: BorderSide.none, // Sem borda quando não focado
                  ),
                ),
                style: const TextStyle(
                    color: Colors.white), // Cor do texto digitado
                cursorColor: Colors.yellow, // Cor do cursor
              ),
              const SizedBox(height: 24),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Contato',
                  labelStyle: TextStyle(color: Color(0xFFC4C4CC)),
                  filled: true,
                  fillColor: Color(0xFF2C2C2C),
                  hintText: '(11) 4002-8922',
                  hintStyle: TextStyle(color: Colors.grey),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8.0)),
                    borderSide: BorderSide.none,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                        Radius.circular(8.0)), // Borda arredondada ao focar
                    borderSide:
                        BorderSide(color: Colors.grey), // Cor da borda ao focar
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                        Radius.circular(8.0)), // Borda arredondada quando ativo
                    borderSide: BorderSide.none, // Sem borda quando não focado
                  ),
                ),
                style: const TextStyle(
                    color: Colors.white), // Cor do texto digitado
                cursorColor: Colors.yellow, // Cor do cursor
              ),
              const SizedBox(height: 64),
              ElevatedButton.icon(
                  onPressed: () {},
                  label: const Text(
                    'Editar',
                    style: TextStyle(color: Color(0xFF1E1E1E)),
                  ),
                  style: ElevatedButton.styleFrom(
                    textStyle: const TextStyle(
                      fontSize: 16,
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
            ],
          ),
        ),
      ),
    );
  }
}
