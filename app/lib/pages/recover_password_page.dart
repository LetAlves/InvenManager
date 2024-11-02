import 'package:flutter/material.dart';
import 'package:invenmanager/global/app_color.dart';
import 'package:invenmanager/pages/login_page.dart';

class RecoverPassword extends StatefulWidget {
  const RecoverPassword({Key? key}) : super(key: key);

  @override
  _RecoverPasswordState createState() => _RecoverPasswordState();
}

class _RecoverPasswordState extends State<RecoverPassword> {
  bool isVisible = true;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Recuperação de senha'),
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
                      const Text(
                        'Por favor, informe o seu usuário para continuar:',
                        style: TextStyle(
                          fontSize: 16,
                          color: AppColor.gray_200,
                        ),
                      ),
                      const SizedBox(height: 24),
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Usuário',
                          labelStyle: const TextStyle(color: AppColor.gray_200),
                          filled: true,
                          fillColor: AppColor.gray_700,
                          hintText: 'john.doe',
                          hintStyle: const TextStyle(color: Colors.grey),
                          border: const OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(8.0)),
                            borderSide: BorderSide.none,
                          ),
                          focusedBorder: const OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(8.0)),
                            borderSide: BorderSide(color: Colors.grey),
                          ),
                          enabledBorder: const OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(8.0)),
                            borderSide: BorderSide.none,
                          ),
                          errorStyle: const TextStyle(color: AppColor.red),
                          errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                            borderSide: const BorderSide(color: AppColor.red),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                            borderSide: const BorderSide(
                                color: AppColor.red, width: 2.0),
                          ),
                        ),
                        style: const TextStyle(color: Colors.white),
                        cursorColor: AppColor.yellow,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Por favor informe o seu usuário';
                          } else if (value.length < 3 || value.length > 30) {
                            return 'Usuário inválido';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 24),
                      ElevatedButton.icon(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            setState(() {
                              isVisible = !isVisible;
                            });
                          }
                        },
                        icon: const Icon(Icons.arrow_forward,
                            color: AppColor.gray_800),
                        label: const Text(
                          'Continuar',
                          style: TextStyle(color: AppColor.gray_800),
                        ),
                        style: ElevatedButton.styleFrom(
                          textStyle: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                          backgroundColor: AppColor.yellow,
                          minimumSize: const Size(300, 52),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Visibility(
                  visible: !isVisible,
                  child: Column(
                    children: [
                      const SizedBox(height: 24),
                      const Text(
                        'Qual meio devemos utilizar para resetar a sua senha?',
                        style:
                            TextStyle(fontSize: 16, color: AppColor.gray_200),
                      ),
                      const SizedBox(height: 24),
                      ElevatedButton.icon(
                        onPressed: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: const Text(
                                'Caso esse usuário exista na plataforma um email será enviado com a nova senha :)',
                                style: TextStyle(color: AppColor.gray_200),
                              ),
                              backgroundColor: AppColor.gray_750,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(4),
                                side: const BorderSide(color: AppColor.yellow),
                              ),
                              duration: const Duration(seconds: 3),
                            ),
                          );

                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const LoginPage()),
                          );
                        },
                        icon: const Icon(Icons.email_outlined,
                            color: AppColor.gray_300),
                        label: const Text('E-mail',
                            style: TextStyle(color: AppColor.gray_200)),
                        style: ElevatedButton.styleFrom(
                          textStyle: const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                          minimumSize: const Size(300, 52),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                          side: const BorderSide(color: AppColor.gray_300),
                        ),
                      ),
                      const SizedBox(height: 24),
                      ElevatedButton.icon(
                        onPressed: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: const Text(
                                'Caso esse usuário exista na plataforma um SMS será enviado com a nova senha :)',
                                style: TextStyle(color: AppColor.gray_200),
                              ),
                              backgroundColor: AppColor.gray_750,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(4),
                                side: const BorderSide(color: AppColor.yellow),
                              ),
                              duration: const Duration(seconds: 3),
                            ),
                          );
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const LoginPage()),
                          );
                        },
                        icon: const Icon(Icons.phone, color: AppColor.gray_300),
                        label: const Text('SMS',
                            style: TextStyle(color: AppColor.gray_200)),
                        style: ElevatedButton.styleFrom(
                          textStyle: const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                          minimumSize: const Size(300, 52),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                          side: const BorderSide(color: AppColor.gray_300),
                        ),
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
