import 'package:flutter/material.dart';

class RecoverPassword extends StatefulWidget {
  const RecoverPassword({Key? key}) : super(key: key);

  @override
  _RecoverPasswordState createState() => _RecoverPasswordState();
}

class _RecoverPasswordState extends State<RecoverPassword> {
  bool isVisible = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Recuperação de senha'),
        centerTitle: true,
        backgroundColor: const Color(0xFF1E1E1E),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          child: Column(
            children: [
              Visibility(
                visible: isVisible,
                child: Column(
                  children: [
                    const SizedBox(height: 24),
                    const Text(
                        'Por favor, informe o seu usuário para continuar:',
                        style:
                            TextStyle(fontSize: 16, color: Color(0xFFC4C4CC))),
                    const SizedBox(height: 24),
                    TextFormField(
                      decoration: const InputDecoration(
                        labelText: 'Usuário',
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
                          borderRadius: BorderRadius.all(Radius.circular(
                              8.0)), // Borda arredondada ao focar
                          borderSide: BorderSide(
                              color: Colors.grey), // Cor da borda ao focar
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(
                              8.0)), // Borda arredondada quando ativo
                          borderSide:
                              BorderSide.none, // Sem borda quando não focado
                        ),
                      ),
                      style: const TextStyle(
                          color: Colors.white), // Cor do texto digitado
                      cursorColor: Colors.yellow, // Cor do cursor
                    ),
                    const SizedBox(height: 24),
                    ElevatedButton.icon(
                        onPressed: () {
                          setState(() {
                            isVisible = !isVisible;
                          });
                        },
                        label: const Text(
                          'Continuar',
                          style: TextStyle(color: Color(0xFF1E1E1E)),
                        ),
                        style: ElevatedButton.styleFrom(
                          textStyle: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                          backgroundColor: const Color(0xFFF7DD43),
                          minimumSize: const Size(300, 52),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                        )),
                  ],
                ),
              ),
              Visibility(
                  visible: !isVisible,
                  child: Column(
                    children: [
                      const SizedBox(height: 24),
                      const Text(
                          'Qual meio devemos utilizar para resetar a sua senha?',
                          style: TextStyle(
                              fontSize: 16, color: Color(0xFFC4C4CC))),
                      const SizedBox(
                        height: 24.0,
                      ),
                      ElevatedButton.icon(
                          onPressed: () {},
                          label: const Text(
                            'E-mail',
                            style: TextStyle(color: Color(0xFFC4C4CC)),
                          ),
                          icon: const Icon(Icons.email_outlined),
                          style: ElevatedButton.styleFrom(
                              textStyle: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                              minimumSize: const Size(300, 52),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 10),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5),
                              ),
                              side: BorderSide(color: Color(0xFF8D8D99)))),
                      const SizedBox(
                        height: 24,
                      ),
                      ElevatedButton.icon(
                          onPressed: () {},
                          label: const Text(
                            'SMS',
                            style: TextStyle(color: Color(0xFFC4C4CC)),
                          ),
                          icon: const Icon(Icons.phone),
                          style: ElevatedButton.styleFrom(
                              textStyle: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                              minimumSize: const Size(300, 52),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 10),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5),
                              ),
                              side: BorderSide(color: Color(0xFF8D8D99)))),
                    ],
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
