import 'package:flutter/material.dart';
import 'package:invenmanager/global/app_color.dart';
import 'package:invenmanager/widget/custom_button.dart';
import 'package:invenmanager/widget/custom_text_form_field.dart';
import 'package:invenmanager/widget/password_form_field.dart';

class EditAccountPage extends StatefulWidget {
  const EditAccountPage({super.key});

  @override
  State<EditAccountPage> createState() => _EditAccountPageState();
}

class _EditAccountPageState extends State<EditAccountPage> {
  final _formKey = GlobalKey<FormState>();

  final RegExp _regexNum = RegExp(r'[0-9]');
  final RegExp _regexSpecial = RegExp(r'[!@#$%^&*(),.?":{}|<>]');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Perfil'),
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
                ClipOval(
                  child: Image.asset(
                    'lib/assets/profile_image.jpg',
                    height: 164,
                    width: 164,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(height: 32),
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
                const PasswordFormField(
                    label: 'Nova senha', hintText: '********'),
                const PasswordFormField(
                    label: 'Confirmar senha', hintText: 'P@ssw0rd'),
                CustomButton(
                  label: 'Editar',
                  labelColor: AppColor.white,
                  backgroundColor: AppColor.green,
                  onPressed: () {},
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
