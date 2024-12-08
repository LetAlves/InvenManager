import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:invenmanager/global/app_color.dart';
import 'package:invenmanager/global/routes.dart';
import 'package:invenmanager/locator.dart';
import 'package:invenmanager/pages/user/edit_account/edit_account_controller.dart';
import 'package:invenmanager/pages/user/edit_account/edit_account_state.dart';
import 'package:invenmanager/repositories/user_repository.dart';
import 'package:invenmanager/utils/user_validator.dart';
import 'package:invenmanager/utils/util.dart';
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
  final _formKeyPassword = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _controller = locator.get<EditAccountController>();
  final _currentUser = UserRepository().getUser();
  bool isChangePasswordVisible = false;
  Uint8List? _image;

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
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

    _nameController.text = _currentUser!.displayName!;
    _emailController.text = _currentUser.email!;
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
        child: Column(
          children: [
            Visibility(
              visible: !isChangePasswordVisible,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      Stack(
                        children: [
                          _image != null
                              ? CircleAvatar(
                                  radius: 64,
                                  backgroundImage: MemoryImage(_image!),
                                )
                              : const CircleAvatar(
                                  radius: 64,
                                  backgroundImage: NetworkImage(
                                      'https://i.pinimg.com/originals/50/ef/65/50ef65b8af841eb8638282f9dfc8f008.jpg'),
                                ),
                          Positioned(
                            bottom: -10,
                            left: 80,
                            child: IconButton(
                              onPressed: () async {
                                Uint8List image =
                                    await pickImage(ImageSource.gallery);
                                setState(() {
                                  _image = image;
                                });
                              },
                              icon: const Icon(
                                Icons.edit,
                                color: AppColor.gray_200,
                                size: 30,
                              ),
                            ),
                          ),
                        ],
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
                        enabled: false,
                        controller: _emailController,
                        label: 'E-mail',
                        hintText: 'john.doe@email.com',
                        keyboardType: TextInputType.emailAddress,
                        validator: UserValidator.validateEmail,
                      ),
                      CustomButton(
                        label: 'Editar',
                        labelColor: AppColor.white,
                        backgroundColor: AppColor.green,
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            _controller.editAccount(
                              username: _nameController.text,
                            );
                          }
                        },
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      CustomButton(
                        label: 'Mudar a senha',
                        backgroundColor: AppColor.yellow,
                        onPressed: () {
                          setState(() {
                            isChangePasswordVisible = true;
                          });
                        },
                      )
                    ],
                  ),
                ),
              ),
            ),
            Visibility(
              visible: isChangePasswordVisible,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Form(
                  key: _formKeyPassword,
                  child: Column(
                    children: [
                      PasswordFormField(
                        controller: _passwordController,
                        label: 'Nova senha',
                        hintText: '********',
                        validator: UserValidator.validatePassword,
                      ),
                      PasswordFormField(
                        label: 'Confirmar senha',
                        hintText: 'P@ssw0rd',
                        validator: (value) =>
                            UserValidator.validateConfirmPassword(
                          value,
                          _passwordController.text,
                        ),
                      ),
                      CustomButton(
                        label: 'Salvar nova senha',
                        labelColor: AppColor.white,
                        backgroundColor: AppColor.green,
                        onPressed: () {
                          if (_formKeyPassword.currentState!.validate()) {
                            _controller.editPassword(
                                password: _passwordController.text);
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
