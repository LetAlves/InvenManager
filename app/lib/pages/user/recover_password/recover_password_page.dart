import 'package:flutter/material.dart';
import 'package:invenmanager/global/app_color.dart';
import 'package:invenmanager/global/app_text_style.dart';
import 'package:invenmanager/global/routes.dart';
import 'package:invenmanager/locator.dart';
import 'package:invenmanager/pages/user/recover_password/recover_password_controller.dart';
import 'package:invenmanager/pages/user/recover_password/recover_password_state.dart';
import 'package:invenmanager/utils/user_validator.dart';
import 'package:invenmanager/widget/border_button.dart';
import 'package:invenmanager/widget/custom_bottom_sheet.dart';
import 'package:invenmanager/widget/custom_circular_progress_indicator.dart';
import 'package:invenmanager/widget/custom_text_form_field.dart';

class RecoverPasswordPage extends StatefulWidget {
  const RecoverPasswordPage({Key? key}) : super(key: key);

  @override
  State<RecoverPasswordPage> createState() => _RecoverPasswordPageState();
}

class _RecoverPasswordPageState extends State<RecoverPasswordPage> {
  final TextEditingController _emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final _controller = locator.get<RecoverPasswordController>();

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      if (_controller.state is RecoverPasswordLoadingState) {
        showDialog(
            context: context,
            builder: (context) => const CustomCircularProgressIndicator());
      }
      if (_controller.state is RecoverPasswordSuccessState) {
        Navigator.pop(context);
        Navigator.pushReplacementNamed(context, NamedRoutes.login);
      }
      if (_controller.state is RecoverPasswordErrorState) {
        Navigator.pop(context);
        CustomBottomSheet(context);
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Recuperação de senha'),
        centerTitle: true,
        backgroundColor: AppColor.gray_800,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              const SizedBox(height: 24),
              const Text(
                'Por favor, informe o seu email cadastrado:',
                style: AppTextStyle.mediumText,
              ),
              const SizedBox(height: 24),
              CustomTextFormField(
                controller: _emailController,
                label: 'E-mail',
                hintText: 'john.doe@email.com',
                validator: UserValidator.validateEmail,
              ),
              const SizedBox(height: 24),
              BorderButton(
                label: 'Enviar e-mail de redefinição',
                icon: Icons.email_outlined,
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _controller.recoverPassword(email: _emailController.text);
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
