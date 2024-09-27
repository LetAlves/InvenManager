import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class RecoverPassword extends StatefulWidget {
  const RecoverPassword({Key? key}) : super(key: key);

  @override
  _RecoverPasswordState createState() => _RecoverPasswordState();
}

class _RecoverPasswordState extends State<RecoverPassword> {
  bool isVisible = true;
  final _formKey = GlobalKey<FormState>();

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
          key: _formKey,
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
                        hintText: 'john.doe',
                        hintStyle: TextStyle(color: Colors.grey),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8.0)),
                          borderSide: BorderSide.none,
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8.0)),
                          borderSide: BorderSide(color: Colors.grey),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8.0)),
                          borderSide:
                              BorderSide.none, // Sem borda quando não focado
                        ),
                        errorStyle: TextStyle(
                          color: Color(0xFFF87171),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0xFFF87171),
                          ),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0xFFF87171),
                            width: 2.0,
                          ),
                        ),
                      ),
                      style: const TextStyle(
                        color: Colors.white,
                      ),
                      cursorColor: Colors.yellow,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Por favor informe o seu usuário';
                        } else if (value.length < 3 || value.length > 30) {
                          return 'Usuário inválido';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 24),
                    ElevatedButton.icon(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            setState(() {
                              isVisible = !isVisible;
                            });
                          }
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
                        style:
                            TextStyle(fontSize: 16, color: Color(0xFFC4C4CC))),
                    const SizedBox(
                      height: 24.0,
                    ),
                    ElevatedButton.icon(
                        onPressed: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: const Text(
                                'Caso esse usuário exista na plataforma um email será enviado com a nova senha :)',
                                style: TextStyle(color: Color(0xFFC4C4CC)),
                              ),
                              backgroundColor: const Color(0xFF202024),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(4),
                                side: const BorderSide(
                                  color: Color(0xFFF7DD43),
                                ),
                              ),
                              duration: const Duration(seconds: 3),
                            ),
                          );

                          //TODO : Navegar para a tela de login
                        },
                        label: const Text(
                          'E-mail',
                          style: TextStyle(color: Color(0xFFC4C4CC)),
                        ),
                        icon: const Icon(
                          Icons.email_outlined,
                          color: Color(0xFF8D8D99),
                        ),
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
                            side: const BorderSide(color: Color(0xFF8D8D99)))),
                    const SizedBox(
                      height: 24,
                    ),
                    ElevatedButton.icon(
                        onPressed: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: const Text(
                                'Caso esse usuário exista na plataforma um SMS será enviado com a nova senha :)',
                                style: TextStyle(color: Color(0xFFC4C4CC)),
                              ),
                              backgroundColor: const Color(0xFF202024),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(4),
                                side: const BorderSide(
                                  color: Color(0xFFF7DD43),
                                ),
                              ),
                              duration: const Duration(seconds: 3),
                            ),
                          );

                          //TODO : Navegar para a tela de login
                        },
                        label: const Text(
                          'SMS',
                          style: TextStyle(color: Color(0xFFC4C4CC)),
                        ),
                        icon: const Icon(
                          Icons.phone,
                          color: Color(0xFF8D8D99),
                        ),
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
                            side: const BorderSide(color: Color(0xFF8D8D99)))),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
