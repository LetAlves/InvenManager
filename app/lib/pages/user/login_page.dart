import 'package:flutter/material.dart';
import 'package:invenmanager/global/app_color.dart';
import 'package:invenmanager/global/app_text_style.dart';
import 'package:invenmanager/pages/home/home_page.dart';
import 'package:invenmanager/pages/user/create_account_page.dart';
import 'package:invenmanager/pages/user/recover_password_page.dart';
import 'package:invenmanager/widget/custom_button.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var children = [
      const SizedBox(height: 20),
      Image.asset(
        'lib/assets/logo-light.png',
        fit: BoxFit.cover,
      ),
      const SizedBox(height: 52),
      TextFormField(
        decoration: const InputDecoration(
          labelText: 'Usuário',
          labelStyle: TextStyle(color: AppColor.gray_200),
          filled: true,
          fillColor: AppColor.gray_700,
          hintText: 'john.doe',
          hintStyle: TextStyle(color: AppColor.gray_250),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(8.0)),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(8.0)),
            borderSide: BorderSide(color: AppColor.gray_250),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(8.0)),
            borderSide: BorderSide.none,
          ),
          errorStyle: TextStyle(color: AppColor.red),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColor.red),
          ),
          focusedErrorBorder: OutlineInputBorder(
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
            return 'Por favor informe o seu usuário';
          } else if (value.length < 3 || value.length > 30) {
            return 'Usuário inválido';
          }
          return null;
        },
      ),
      const SizedBox(height: 16),
      TextFormField(
        decoration: const InputDecoration(
          labelText: 'Senha',
          labelStyle: TextStyle(color: AppColor.gray_200),
          filled: true,
          fillColor: AppColor.gray_700,
          hintText: '********',
          hintStyle: TextStyle(color: AppColor.gray_250),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(8.0)),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(8.0)),
            borderSide: BorderSide(color: AppColor.gray_250),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(8.0)),
            borderSide: BorderSide.none,
          ),
          errorStyle: TextStyle(color: AppColor.red),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColor.red),
          ),
          focusedErrorBorder: OutlineInputBorder(
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
            MaterialPageRoute(builder: (context) => const RecoverPassword()),
          );
        },
        child: Text(
          'Esqueci a minha senha',
          style: AppTextStyle.mediumTextBold.copyWith(color: AppColor.gray_200),
        ),
      ),
      const SizedBox(height: 52),
      CustomButton(
        label: 'Entrar',
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const Homepage()),
          );
          // if (_formKey.currentState!.validate()) {
          //   Navigator.push(
          //     context,
          //     MaterialPageRoute(builder: (context) => const Homepage()),
          //   );
          // }
        },
      ),
      const SizedBox(height: 18),
      CustomButton(
        label: 'Entrar com o Google',
        labelColor: AppColor.white,
        backgroundColor: AppColor.red_500,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const Homepage()),
          );
        },
      ),
      const SizedBox(height: 24),
      TextButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const CreateAccountPage()),
          );
        },
        child: Text(
          'Criar uma nova conta',
          style: AppTextStyle.mediumTextBold.copyWith(color: AppColor.gray_200),
        ),
      ),
    ];
    return Scaffold(
      backgroundColor: AppColor.gray_900,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: children,
            ),
          ),
        ),
      ),
    );
  }
}
