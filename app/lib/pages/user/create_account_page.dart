import 'package:flutter/material.dart';
import 'package:invenmanager/global/app_color.dart';
import 'package:invenmanager/global/app_text_style.dart';
import 'package:invenmanager/widget/custom_button.dart';
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
                      Text('Informações do usuário',
                          style: AppTextStyle.headerText
                              .copyWith(color: AppColor.white)),
                      const SizedBox(height: 24),
                      CustomTextFormField(
                        label: 'Nome',
                        hintText: 'John Doe',
                        textCapitalization: TextCapitalization.words,
                        keyboardType: TextInputType.name,
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
                      CustomTextFormField(
                        label: 'E-mail',
                        hintText: 'john.doe@email.com',
                        keyboardType: TextInputType.emailAddress,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Por favor informe o seu nome de usuário';
                          } else if (value.length < 3) {
                            return 'Nome de usuário inválido ou já cadastrado';
                          }
                          return null;
                        },
                      ),
                      CustomTextFormField(
                        label: 'Contato',
                        hintText: '4002-8922',
                        keyboardType: TextInputType.phone,
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
                      CustomTextFormField(
                        label: 'Usuário',
                        hintText: 'john.doe',
                        keyboardType: TextInputType.text,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Por favor informe o seu usuário';
                          } else if (value.length < 10) {
                            return 'Usuário Inválido';
                          }
                          return null;
                        },
                      ),
                      PasswordFormField(label: 'Senha', hintText: '********'),
                      PasswordFormField(
                          label: 'Confirmar senha', hintText: 'P@ssw0rd'),
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
