import 'package:flutter/material.dart';
import 'package:invenmanager/global/invenmanager_colors.dart';
import 'package:invenmanager/screens/login_page.dart';

class CreateAccountPage extends StatefulWidget {
  const CreateAccountPage({super.key});

  @override
  State<CreateAccountPage> createState() => _CreateAccountPageState();
}

class _CreateAccountPageState extends State<CreateAccountPage> {
  bool isVisible = true;
  final _formKey = GlobalKey<FormState>();

  final RegExp _regexNum = RegExp(r'[0-9]');
  final RegExp _regexSpecial = RegExp(r'^(?= . [@! #$%^&()/\\])');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Criar conta'),
        centerTitle: true,
        backgroundColor: Color(InvenmanagerColors.gray_800),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Visibility(
                  visible: isVisible,
                  child: Column(
                    children: [
                      const SizedBox(height: 24),
                      Text('Informações do usuário',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Color(InvenmanagerColors.white),
                          )),
                      const SizedBox(height: 24),
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Nome',
                          labelStyle: TextStyle(
                              color: Color(InvenmanagerColors.gray_200)),
                          filled: true,
                          fillColor: Color(InvenmanagerColors.gray_700),
                          hintText: 'John Doe',
                          hintStyle: TextStyle(
                              color: Color(InvenmanagerColors.gray_250)),
                          border: const OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(8.0)),
                            borderSide: BorderSide.none,
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(8.0)),
                            borderSide: BorderSide(
                                color: Color(InvenmanagerColors.gray_250)),
                          ),
                          enabledBorder: const OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(8.0)),
                            borderSide: BorderSide.none,
                          ),
                          errorStyle: TextStyle(
                            color: Color(InvenmanagerColors.red),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(InvenmanagerColors.red),
                            ),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(InvenmanagerColors.red),
                              width: 2.0,
                            ),
                          ),
                        ),
                        style: TextStyle(
                          color: Color(InvenmanagerColors.white),
                        ),
                        cursorColor: Color(InvenmanagerColors.yellow),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Por favor informe o seu nome completo';
                          } else if (value.length < 5 ||
                              value.length > 30 ||
                              _regexNum.hasMatch(value) ||
                              _regexSpecial.hasMatch(value)) {
                            return 'Nome Inválido';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 24),
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: 'E-mail',
                          labelStyle: TextStyle(
                              color: Color(InvenmanagerColors.gray_200)),
                          filled: true,
                          fillColor: Color(InvenmanagerColors.gray_700),
                          hintText: 'john.doe@email.com',
                          hintStyle: TextStyle(
                              color: Color(InvenmanagerColors.gray_250)),
                          border: const OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(8.0)),
                            borderSide: BorderSide.none,
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(8.0)),
                            borderSide: BorderSide(
                                color: Color(InvenmanagerColors.gray_250)),
                          ),
                          enabledBorder: const OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(8.0)),
                            borderSide: BorderSide.none,
                          ),
                          errorStyle: TextStyle(
                            color: Color(InvenmanagerColors.red),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(InvenmanagerColors.red),
                            ),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(InvenmanagerColors.red),
                              width: 2.0,
                            ),
                          ),
                        ),
                        style: TextStyle(
                          color: Color(InvenmanagerColors.white),
                        ),
                        cursorColor: Color(InvenmanagerColors.yellow),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Por favor informe o seu nome de usuário';
                          } else if (value.length < 3) {
                            return 'Nome de usuário inválido ou já cadastrado';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 24),
                      TextFormField(
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          labelText: 'Contato',
                          labelStyle: TextStyle(
                              color: Color(InvenmanagerColors.gray_200)),
                          filled: true,
                          fillColor: Color(InvenmanagerColors.gray_700),
                          hintText: '(11) 94002-8922',
                          hintStyle: TextStyle(
                              color: Color(InvenmanagerColors.gray_250)),
                          border: const OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(8.0)),
                            borderSide: BorderSide.none,
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(8.0)),
                            borderSide: BorderSide(
                                color: Color(InvenmanagerColors.gray_250)),
                          ),
                          enabledBorder: const OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(8.0)),
                            borderSide: BorderSide.none,
                          ),
                          errorStyle: TextStyle(
                            color: Color(InvenmanagerColors.red),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(InvenmanagerColors.red),
                            ),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(InvenmanagerColors.red),
                              width: 2.0,
                            ),
                          ),
                        ),
                        style: TextStyle(
                          color: Color(InvenmanagerColors.white),
                        ),
                        cursorColor: Color(InvenmanagerColors.yellow),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Por favor informe o seu número de contato';
                          } else if (value.length < 5 ||
                              value.length > 30 ||
                              _regexNum.hasMatch(value) == false) {
                            return 'Número inválido';
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
                        label: Text(
                          'Continuar',
                          style:
                              TextStyle(color: Color(InvenmanagerColors.white)),
                        ),
                        style: ElevatedButton.styleFrom(
                          textStyle: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                          backgroundColor: Color(InvenmanagerColors.green),
                          minimumSize: const Size(300, 52),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Visibility(
                  visible: !isVisible,
                  child: Column(
                    children: [
                      const SizedBox(height: 24),
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Usuário',
                          labelStyle: TextStyle(
                              color: Color(InvenmanagerColors.gray_200)),
                          filled: true,
                          fillColor: Color(InvenmanagerColors.gray_700),
                          hintText: 'john.doe',
                          hintStyle: TextStyle(
                              color: Color(InvenmanagerColors.gray_250)),
                          border: const OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(8.0)),
                            borderSide: BorderSide.none,
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(8.0)),
                            borderSide: BorderSide(
                                color: Color(InvenmanagerColors.gray_250)),
                          ),
                          enabledBorder: const OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(8.0)),
                            borderSide: BorderSide.none,
                          ),
                          errorStyle: TextStyle(
                            color: Color(InvenmanagerColors.red),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(InvenmanagerColors.red),
                            ),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(InvenmanagerColors.red),
                              width: 2.0,
                            ),
                          ),
                        ),
                        style: TextStyle(
                          color: Color(InvenmanagerColors.white),
                        ),
                        cursorColor: Color(InvenmanagerColors.yellow),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Por favor informe o seu e-mail';
                          } else if (value.length < 10) {
                            return 'E-mail Inválido';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 24),
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Senha',
                          labelStyle: TextStyle(
                              color: Color(InvenmanagerColors.gray_200)),
                          filled: true,
                          fillColor: Color(InvenmanagerColors.gray_700),
                          hintText: '********',
                          hintStyle: TextStyle(
                              color: Color(InvenmanagerColors.gray_250)),
                          border: const OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(8.0)),
                            borderSide: BorderSide.none,
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(8.0)),
                            borderSide: BorderSide(
                                color: Color(InvenmanagerColors.gray_250)),
                          ),
                          enabledBorder: const OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(8.0)),
                            borderSide: BorderSide.none,
                          ),
                          errorStyle: TextStyle(
                            color: Color(InvenmanagerColors.red),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(InvenmanagerColors.red),
                            ),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(InvenmanagerColors.red),
                              width: 2.0,
                            ),
                          ),
                        ),
                        style: TextStyle(
                          color: Color(InvenmanagerColors.white),
                        ),
                        cursorColor: Color(InvenmanagerColors.yellow),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Por favor informe a sua senha';
                          } else if (value.length < 8) {
                            return 'Senha inválida';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 24),
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Confirmação de Senha',
                          labelStyle: TextStyle(
                              color: Color(InvenmanagerColors.gray_200)),
                          filled: true,
                          fillColor: Color(InvenmanagerColors.gray_700),
                          hintText: '********',
                          hintStyle: TextStyle(
                              color: Color(InvenmanagerColors.gray_250)),
                          border: const OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(8.0)),
                            borderSide: BorderSide.none,
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(8.0)),
                            borderSide: BorderSide(
                                color: Color(InvenmanagerColors.gray_250)),
                          ),
                          enabledBorder: const OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(8.0)),
                            borderSide: BorderSide.none,
                          ),
                          errorStyle: TextStyle(
                            color: Color(InvenmanagerColors.red),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(InvenmanagerColors.red),
                            ),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(InvenmanagerColors.red),
                              width: 2.0,
                            ),
                          ),
                        ),
                        style: TextStyle(
                          color: Color(InvenmanagerColors.white),
                        ),
                        cursorColor: Color(InvenmanagerColors.yellow),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Por favor informe a sua senha';
                          } else if (value.length < 8) {
                            return 'Senha inválida';
                          }
                          //Verificar se senhas são iguais
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                      ElevatedButton.icon(
                        onPressed: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                'Usuário cadastrado com sucesso!',
                                style: TextStyle(
                                    color: Color(InvenmanagerColors.gray_200)),
                              ),
                              backgroundColor:
                                  Color(InvenmanagerColors.gray_750),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(4),
                                side: BorderSide(
                                  color: Color(InvenmanagerColors.green),
                                ),
                              ),
                              duration: const Duration(seconds: 3),
                            ),
                          );

                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const LoginPage()),
                          );
                        },
                        label: Text(
                          'Cadastrar',
                          style:
                              TextStyle(color: Color(InvenmanagerColors.white)),
                        ),
                        style: ElevatedButton.styleFrom(
                          textStyle: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                          backgroundColor: Color(InvenmanagerColors.green),
                          minimumSize: const Size(300, 52),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
