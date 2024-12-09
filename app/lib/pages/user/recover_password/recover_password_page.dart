import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:invenmanager/global/app_color.dart';
import 'package:invenmanager/pages/user/login/login_page.dart';
import 'package:invenmanager/utils/user_validator.dart';
import 'package:invenmanager/widget/border_button.dart';
import 'package:invenmanager/widget/custom_button.dart';
import 'package:invenmanager/widget/custom_text_form_field.dart';

class RecoverPasswordPage extends StatefulWidget {
  const RecoverPasswordPage({Key? key}) : super(key: key);

  @override
  State<RecoverPasswordPage> createState() => _RecoverPasswordPageState();
}

class _RecoverPasswordPageState extends State<RecoverPasswordPage> {
  final TextEditingController emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool isVisible = true;

  void _sendPasswordResetEmail(BuildContext context) async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(
        email: emailController.text,
      );
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
              'E-mail de redefinição enviado! Verifique sua caixa de entrada.'),
        ),
      );
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const LoginPage()),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Erro ao enviar o e-mail: $e'),
        ),
      );
    }
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
              if (isVisible)
                _buildUserInputSection()
              else
                _buildEmailInputSection(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildUserInputSection() {
    return Column(
      children: [
        const SizedBox(height: 24),
        const Text(
          'Por favor, informe o seu usuário para continuar:',
          style: TextStyle(
            fontSize: 16,
            color: AppColor.gray_200,
          ),
        ),
        const SizedBox(height: 24),
        CustomTextFormField(
          label: 'Usuário',
          hintText: 'john.doe',
          validator: UserValidator.validateUserName,
        ),
        const SizedBox(height: 24),
        CustomButton(
          label: 'Continuar',
          onPressed: () {
            if (_formKey.currentState!.validate()) {
              setState(() {
                isVisible = false;
              });
            }
          },
        ),
      ],
    );
  }

  Widget _buildEmailInputSection(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 24),
        const Text(
          'Digite seu e-mail para redefinição de senha:',
          style: TextStyle(
            fontSize: 16,
            color: AppColor.gray_200,
          ),
        ),
        const SizedBox(height: 24),
        CustomTextFormField(
          label: 'E-mail',
          hintText: 'exemplo@dominio.com',
          controller: emailController,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Por favor, insira seu e-mail.';
            }
            if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
              return 'Insira um e-mail válido.';
            }
            return null;
          },
        ),
        const SizedBox(height: 24),
        BorderButton(
          label: 'Enviar e-mail de redefinição',
          icon: Icons.email_outlined,
          onPressed: () {
            if (_formKey.currentState!.validate()) {
              _sendPasswordResetEmail(context);
            }
          },
        ),
        const SizedBox(height: 24),
        BorderButton(
          label: 'Voltar ao login',
          icon: Icons.arrow_back,
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const LoginPage()),
            );
          },
        ),
      ],
    );
  }
}
