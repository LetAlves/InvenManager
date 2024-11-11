import 'package:flutter/material.dart';
import 'package:invenmanager/global/app_color.dart';
import 'package:invenmanager/global/app_text_style.dart';
import 'package:invenmanager/pages/home/home_page.dart';
import 'package:invenmanager/pages/user/create_account_page.dart';
import 'package:invenmanager/pages/user/recover_password_page.dart';
import 'package:invenmanager/utils/user_validator.dart';
import 'package:invenmanager/widget/custom_button.dart';
import 'package:invenmanager/widget/custom_text_form_field.dart';
import 'package:invenmanager/widget/password_form_field.dart';

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
      backgroundColor: AppColor.gray_900,
      body: SingleChildScrollView(
        child: Padding(
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
                CustomTextFormField(
                  label: 'Usuário',
                  hintText: 'john.doe',
                  validator: UserValidator.validateUserName,
                ),
                PasswordFormField(
                  label: 'Senha',
                  hintText: '********',
                  validator: UserValidator.validatePassword,
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
                    style: AppTextStyle.mediumTextBold
                        .copyWith(color: AppColor.gray_200),
                  ),
                ),
                const SizedBox(height: 20),
                CustomButton(
                  label: 'Entrar',
                  onPressed: () {
                    final valid = _formKey.currentState?.validate();
                    if (valid == true) {
                      //TODO: Logar usuário
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Homepage()),
                      );
                    }
                  },
                ),
                const SizedBox(height: 40),
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
                    style: AppTextStyle.mediumTextBold
                        .copyWith(color: AppColor.yellow),
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
