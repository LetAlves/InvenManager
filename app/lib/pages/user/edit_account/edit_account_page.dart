import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:invenmanager/global/app_color.dart';
import 'package:invenmanager/global/routes.dart';
import 'package:invenmanager/locator.dart';
import 'package:invenmanager/pages/user/edit_account/edit_account_controller.dart';
import 'package:invenmanager/pages/user/edit_account/edit_account_state.dart';
import 'package:invenmanager/utils/user_validator.dart';
import 'package:invenmanager/widget/custom_bottom_sheet.dart';
import 'package:invenmanager/widget/custom_button.dart';
import 'package:invenmanager/widget/custom_circular_progress_indicator.dart';
import 'package:invenmanager/widget/custom_text_form_field.dart';
import 'package:invenmanager/widget/password_form_field.dart';

class EditAccountPage extends StatefulWidget {
  const EditAccountPage({super.key});

  @override
  State<EditAccountPage> createState() => _EditAccountPageState();
}

class _EditAccountPageState extends State<EditAccountPage> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _passwordController = TextEditingController();
  final _controller = locator.get<EditAccountController>();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _controller.addListener(
      () {
        if (_controller.state is EditAccountLoadingState) {
          showDialog(
              context: context,
              builder: (context) => const CustomCircularProgressIndicator());
        }
        if (_controller.state is EditAccountSuccessState) {
          Navigator.pop(context);
          Navigator.pushReplacementNamed(context, NamedRoutes.initial);
        }
        if (_controller.state is EditAccountErrorState) {
          //final error = _controller.state as EditAccountErrorState;
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
                Stack(),
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
                  controller: _nameController,
                  label: 'Nome',
                  hintText: 'John Doe',
                  textCapitalization: TextCapitalization.words,
                  keyboardType: TextInputType.name,
                  validator: UserValidator.validateName,
                ),
                CustomTextFormField(
                  controller: _emailController,
                  label: 'E-mail',
                  hintText: 'john.doe@email.com',
                  keyboardType: TextInputType.emailAddress,
                  validator: UserValidator.validateEmail,
                ),
                CustomTextFormField(
                  controller: _phoneController,
                  label: 'Contato',
                  hintText: '4002-8922',
                  keyboardType: TextInputType.phone,
                  validator: UserValidator.validateContact,
                ),
                PasswordFormField(
                  controller: _passwordController,
                  label: 'Nova senha',
                  hintText: '********',
                  validator: UserValidator.validatePassword,
                ),
                PasswordFormField(
                  label: 'Confirmar senha',
                  hintText: 'P@ssw0rd',
                  validator: (value) => UserValidator.validateConfirmPassword(
                    value,
                    _passwordController.text,
                  ),
                ),
                CustomButton(
                  label: 'Editar',
                  labelColor: AppColor.white,
                  backgroundColor: AppColor.green,
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      log("Usuário Editado");
                    }
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
