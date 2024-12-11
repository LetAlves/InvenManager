import 'package:flutter/material.dart';
import 'package:invenmanager/global/app_color.dart';
import 'package:invenmanager/global/app_text_style.dart';
import 'package:invenmanager/global/routes.dart';
import 'package:invenmanager/locator.dart';
import 'package:invenmanager/pages/user/login/login_controller.dart';
import 'package:invenmanager/pages/user/login/login_state.dart';
import 'package:invenmanager/utils/user_validator.dart';
import 'package:invenmanager/widget/custom_bottom_sheet.dart';
import 'package:invenmanager/widget/custom_button.dart';
import 'package:invenmanager/widget/custom_circular_progress_indicator.dart';
import 'package:invenmanager/widget/custom_text_form_field.dart';
import 'package:invenmanager/widget/password_form_field.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _controller = locator.get<LoginController>();

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      if (_controller.state is LoginLoadingState) {
        showDialog(
            context: context,
            builder: (context) => const CustomCircularProgressIndicator());
      }
      if (_controller.state is LoginSuccessState) {
        Navigator.pop(context);
        Navigator.pushReplacementNamed(context, NamedRoutes.initial);
      }
      if (_controller.state is LoginErrorState) {
        Navigator.pop(context);
        CustomBottomSheet(context);
      }
    });
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

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
                  controller: _emailController,
                  label: 'E-mail',
                  hintText: 'john.doe@email.com',
                  keyboardType: TextInputType.emailAddress,
                  validator: UserValidator.validateEmail,
                ),
                PasswordFormField(
                  controller: _passwordController,
                  label: 'Senha',
                  hintText: '********',
                  validator: UserValidator.validatePassword,
                ),
                const SizedBox(height: 12),
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, NamedRoutes.recoverPassword);
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
                    final valid = _formKey.currentState!.validate();
                    if (valid) {
                      _controller.login(
                          email: _emailController.text,
                          password: _passwordController.text);
                    }
                  },
                ),
                const SizedBox(height: 40),
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, NamedRoutes.createAccount);
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
