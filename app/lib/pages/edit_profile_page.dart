import 'package:flutter/material.dart';
import 'package:invenmanager/global/app_color.dart';
import 'package:invenmanager/widget/custom_button.dart';
import 'package:invenmanager/widget/custom_text_form_field.dart';
import 'package:invenmanager/widget/password_form_field.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({super.key});

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
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
                const CustomTextFormField(
                  label: 'Nome',
                  hintText: 'John Doe',
                  textCapitalization: TextCapitalization.words,
                  keyboardType: TextInputType.name,
                ),
                const CustomTextFormField(
                    label: 'E-mail',
                    hintText: 'john.doe@email.com',
                    keyboardType: TextInputType.emailAddress),
                const CustomTextFormField(
                    label: 'Contato',
                    hintText: '4002-8922',
                    keyboardType: TextInputType.phone),
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
