import 'package:flutter/material.dart';
import 'package:invenmanager/global/app_color.dart';
import 'package:invenmanager/global/app_text_style.dart';
import 'package:invenmanager/global/routes.dart';
import 'package:invenmanager/locator.dart';
import 'package:invenmanager/pages/user/create_account/create_account_controller.dart';
import 'package:invenmanager/pages/user/create_account/create_account_state.dart';
import 'package:invenmanager/utils/user_validator.dart';
import 'package:invenmanager/widget/custom_bottom_sheet.dart';
import 'package:invenmanager/widget/custom_button.dart';
import 'package:invenmanager/widget/custom_circular_progress_indicator.dart';
import 'package:invenmanager/widget/custom_text_form_field.dart';
import 'package:invenmanager/widget/password_form_field.dart';

class CreateAccountPage extends StatefulWidget {
  const CreateAccountPage({super.key});

  @override
  State<CreateAccountPage> createState() => _CreateAccountPageState();
}

class _CreateAccountPageState extends State<CreateAccountPage> {
  bool isVisible = true;
  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _controller = locator.get<CreateAccountController>();

  @override
  void dispose() {
    _usernameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _controller.addListener(
      () {
        if (_controller.state is CreateAccountLoadingState) {
          showDialog(
              context: context,
              builder: (context) => const CustomCircularProgressIndicator());
        }
        if (_controller.state is CreateAccountSuccessState) {
          Navigator.pop(context);
          Navigator.pushReplacementNamed(context, NamedRoutes.initial);
        }
        if (_controller.state is CreateAccountErrorState) {
          //final error = _controller.state as CreateAccountErrorState;
          Navigator.pop(context);
          CustomBottomSheet(context);
        }
      },
    );
  }

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
                      Text('Informações do usuário',
                          style: AppTextStyle.headerText
                              .copyWith(color: AppColor.white)),
                      const SizedBox(height: 24),
                      CustomTextFormField(
                        controller: _usernameController,
                        label: 'Usuário',
                        hintText: 'john.doe',
                        keyboardType: TextInputType.text,
                        validator: UserValidator.validateUserName,
                      ),
                      CustomTextFormField(
                        controller: _emailController,
                        label: 'E-mail',
                        hintText: 'john.doe@email.com',
                        keyboardType: TextInputType.emailAddress,
                        validator: UserValidator.validateEmail,
                      ),
                      const SizedBox(height: 24),
                      CustomButton(
                        label: 'Continuar',
                        labelColor: AppColor.white,
                        backgroundColor: AppColor.green,
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            setState(() {
                              isVisible = !isVisible;
                            });
                          }
                        },
                      )
                    ],
                  ),
                ),
                Visibility(
                  visible: !isVisible,
                  child: Column(
                    children: [
                      PasswordFormField(
                        controller: _passwordController,
                        label: 'Senha',
                        hintText: '********',
                        helperText:
                            'A senha deve conter no mínimo 8 caracteres, 1 letra maiúscula e 1 número',
                        validator: UserValidator.validatePassword,
                      ),
                      PasswordFormField(
                        label: 'Confirmar senha',
                        hintText: 'P@ssw0rd123',
                        validator: (value) =>
                            UserValidator.validateConfirmPassword(
                          value,
                          _passwordController.text,
                        ),
                      ),
                      const SizedBox(height: 24),
                      CustomButton(
                        label: 'Registrar',
                        labelColor: AppColor.white,
                        backgroundColor: AppColor.green,
                        onPressed: () {
                          final valid = _formKey.currentState!.validate();
                          if (valid) {
                            _controller.createAccount(
                                username: _usernameController.text,
                                email: _emailController.text,
                                password: _passwordController.text);
                          }
                        },
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
