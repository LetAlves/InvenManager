import 'package:flutter/material.dart';
import 'package:invenmanager/global/app_color.dart';

class CreateAccountPage extends StatefulWidget {
  const CreateAccountPage({super.key});

  @override
  State<CreateAccountPage> createState() => _CreateAccountPageState();
}

class _CreateAccountPageState extends State<CreateAccountPage> {
  bool isVisible = true;
  final _formKey = GlobalKey<FormState>();

  final RegExp _regexNum = RegExp(r'[0-9]');
  final RegExp _regexSpecial = RegExp(r'[!@#$%^&*(),.?":{}|<>]');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Criar conta'),
        centerTitle: true,
        backgroundColor: AppColor.gray_800,
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
                      const Text(
                        'Informações do usuário',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: AppColor.white,
                        ),
                      ),
                      const SizedBox(height: 24),
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Nome',
                          labelStyle: const TextStyle(color: AppColor.gray_200),
                          filled: true,
                          fillColor: AppColor.gray_700,
                          hintText: 'John Doe',
                          hintStyle: const TextStyle(color: AppColor.gray_250),
                          border: const OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(8.0)),
                            borderSide: BorderSide.none,
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                            borderSide:
                                const BorderSide(color: AppColor.gray_250),
                          ),
                          enabledBorder: const OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(8.0)),
                            borderSide: BorderSide.none,
                          ),
                          errorStyle: const TextStyle(color: AppColor.red),
                          errorBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: AppColor.red),
                          ),
                          focusedErrorBorder: const OutlineInputBorder(
                            borderSide: BorderSide(
                              color: AppColor.red,
                              width: 2.0,
                            ),
                          ),
                        ),
                        style: const TextStyle(color: AppColor.white),
                        cursorColor: AppColor.yellow,
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
                          labelStyle: const TextStyle(color: AppColor.gray_200),
                          filled: true,
                          fillColor: AppColor.gray_700,
                          hintText: 'john.doe@email.com',
                          hintStyle: const TextStyle(color: AppColor.gray_250),
                          border: const OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(8.0)),
                            borderSide: BorderSide.none,
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                            borderSide:
                                const BorderSide(color: AppColor.gray_250),
                          ),
                          enabledBorder: const OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(8.0)),
                            borderSide: BorderSide.none,
                          ),
                          errorStyle: const TextStyle(color: AppColor.red),
                          errorBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: AppColor.red),
                          ),
                          focusedErrorBorder: const OutlineInputBorder(
                            borderSide: BorderSide(
                              color: AppColor.red,
                              width: 2.0,
                            ),
                          ),
                        ),
                        style: const TextStyle(color: AppColor.white),
                        cursorColor: AppColor.yellow,
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
                          labelStyle: const TextStyle(color: AppColor.gray_200),
                          filled: true,
                          fillColor: AppColor.gray_700,
                          hintText: '(11) 94002-8922',
                          hintStyle: const TextStyle(color: AppColor.gray_250),
                          border: const OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(8.0)),
                            borderSide: BorderSide.none,
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                            borderSide:
                                const BorderSide(color: AppColor.gray_250),
                          ),
                          enabledBorder: const OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(8.0)),
                            borderSide: BorderSide.none,
                          ),
                          errorStyle: const TextStyle(color: AppColor.red),
                          errorBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: AppColor.red),
                          ),
                          focusedErrorBorder: const OutlineInputBorder(
                            borderSide: BorderSide(
                              color: AppColor.red,
                              width: 2.0,
                            ),
                          ),
                        ),
                        style: const TextStyle(color: AppColor.white),
                        cursorColor: AppColor.yellow,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Por favor informe o seu número de contato';
                          } else if (value.length < 5 ||
                              value.length > 30 ||
                              !_regexNum.hasMatch(value)) {
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
                        icon: const Icon(Icons.arrow_forward),
                        label: const Text(
                          'Continuar',
                          style: TextStyle(color: AppColor.white),
                        ),
                        style: ElevatedButton.styleFrom(
                          textStyle: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                          backgroundColor: AppColor.green,
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
                          labelStyle: const TextStyle(color: AppColor.gray_200),
                          filled: true,
                          fillColor: AppColor.gray_700,
                          hintText: 'john.doe',
                          hintStyle: const TextStyle(color: AppColor.gray_250),
                          border: const OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(8.0)),
                            borderSide: BorderSide.none,
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                            borderSide:
                                const BorderSide(color: AppColor.gray_250),
                          ),
                          enabledBorder: const OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(8.0)),
                            borderSide: BorderSide.none,
                          ),
                          errorStyle: const TextStyle(color: AppColor.red),
                          errorBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: AppColor.red),
                          ),
                          focusedErrorBorder: const OutlineInputBorder(
                            borderSide: BorderSide(
                              color: AppColor.red,
                              width: 2.0,
                            ),
                          ),
                        ),
                        style: const TextStyle(color: AppColor.white),
                        cursorColor: AppColor.yellow,
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
                        obscureText: true,
                        decoration: InputDecoration(
                          labelText: 'Senha',
                          labelStyle: const TextStyle(color: AppColor.gray_200),
                          filled: true,
                          fillColor: AppColor.gray_700,
                          hintText: '********',
                          hintStyle: const TextStyle(color: AppColor.gray_250),
                          border: const OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(8.0)),
                            borderSide: BorderSide.none,
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                            borderSide:
                                const BorderSide(color: AppColor.gray_250),
                          ),
                          enabledBorder: const OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(8.0)),
                            borderSide: BorderSide.none,
                          ),
                          errorStyle: const TextStyle(color: AppColor.red),
                          errorBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: AppColor.red),
                          ),
                          focusedErrorBorder: const OutlineInputBorder(
                            borderSide: BorderSide(
                              color: AppColor.red,
                              width: 2.0,
                            ),
                          ),
                        ),
                        style: const TextStyle(color: AppColor.white),
                        cursorColor: AppColor.yellow,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Por favor informe a sua senha';
                          } else if (value.length < 8) {
                            return 'Senha muito curta';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 24),
                      ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            // Ação de criar conta
                          }
                        },
                        child: const Text('Criar conta'),
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
