import 'package:flutter/material.dart';
import 'package:invenmanager/global/invenmanager_colors.dart';
import 'package:invenmanager/screens/home_page.dart';
import 'package:invenmanager/screens/create_account_page.dart';
import 'package:invenmanager/screens/recover_password_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(InvenmanagerColors.gray_900),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              const SizedBox(height: 20),
              Image.asset(
                'lib/assets/logo-light.png',
                fit: BoxFit.cover,
              ),
              const SizedBox(height: 52),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Usuário',
                  labelStyle:
                      TextStyle(color: Color(InvenmanagerColors.gray_200)),
                  filled: true,
                  fillColor: Color(InvenmanagerColors.gray_700),
                  hintText: 'john.doe',
                  hintStyle:
                      TextStyle(color: Color(InvenmanagerColors.gray_250)),
                  border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8.0)),
                    borderSide: BorderSide.none,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: const BorderRadius.all(Radius.circular(8.0)),
                    borderSide:
                        BorderSide(color: Color(InvenmanagerColors.gray_250)),
                  ),
                  enabledBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8.0)),
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
                    return 'Por favor informe o seu usuário';
                  } else if (value.length < 3 || value.length > 30) {
                    return 'Usuário inválido';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Senha',
                  labelStyle:
                      TextStyle(color: Color(InvenmanagerColors.gray_200)),
                  filled: true,
                  fillColor: Color(InvenmanagerColors.gray_700),
                  hintText: '********',
                  hintStyle:
                      TextStyle(color: Color(InvenmanagerColors.gray_250)),
                  border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8.0)),
                    borderSide: BorderSide.none,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: const BorderRadius.all(Radius.circular(8.0)),
                    borderSide:
                        BorderSide(color: Color(InvenmanagerColors.gray_250)),
                  ),
                  enabledBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8.0)),
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
              const SizedBox(height: 12),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const RecoverPassword()),
                  );
                },
                child: Text(
                  'Esqueci a minha senha',
                  style: TextStyle(color: Color(InvenmanagerColors.gray_200)),
                ),
              ),
              const SizedBox(height: 52),
              ElevatedButton.icon(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const Homepage()),
                    );
                  }
                },
                label: Text(
                  'Entrar',
                  style: TextStyle(color: Color(InvenmanagerColors.gray_800)),
                ),
                style: ElevatedButton.styleFrom(
                  textStyle: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                  backgroundColor: Color(InvenmanagerColors.yellow),
                  minimumSize: const Size(350, 52),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
              ),
              const SizedBox(height: 18),
              ElevatedButton.icon(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const Homepage()),
                    );
                  }
                },
                label: Text(
                  'Entrar com o Google',
                  style: TextStyle(color: Color(InvenmanagerColors.white)),
                ),
                style: ElevatedButton.styleFrom(
                  textStyle: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                  backgroundColor: Color(InvenmanagerColors.red_500),
                  minimumSize: const Size(350, 52),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
              ),
              const SizedBox(height: 24),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const CreateAccountPage()),
                  );
                },
                child: Text(
                  'Criar uma nova conta',
                  style: TextStyle(color: Color(InvenmanagerColors.gray_200)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
