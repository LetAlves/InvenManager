import 'package:flutter/material.dart';
import 'package:invenmanager/global/invenmanager_colors.dart';
import 'package:invenmanager/screens/login_page.dart';

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
        backgroundColor: Color(InvenmanagerColors.gray_800),
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
                      Text('Por favor, informe o seu usuário para continuar:',
                          style: TextStyle(
                              fontSize: 16,
                              color: Color(InvenmanagerColors.gray_200))),
                      const SizedBox(height: 24),
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Usuário',
                          labelStyle: TextStyle(
                              color: Color(InvenmanagerColors.gray_200)),
                          filled: true,
                          fillColor: Color(InvenmanagerColors.gray_700),
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
                            borderSide:
                                BorderSide.none, // Sem borda quando não focado
                          ),
                          errorStyle: TextStyle(
                            color: Color(InvenmanagerColors.red),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(InvenmanagerColors.red),
                            ),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(InvenmanagerColors.red),
                              width: 2.0,
                            ),
                          ),
                        ),
                        style: const TextStyle(
                          color: Colors.white,
                        ),
                        cursorColor: Color(InvenmanagerColors.yellow),
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
                          label: Text(
                            'Continuar',
                            style: TextStyle(
                                color: Color(InvenmanagerColors.gray_800)),
                          ),
                          style: ElevatedButton.styleFrom(
                            textStyle: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                            backgroundColor: Color(InvenmanagerColors.yellow),
                            minimumSize: const Size(300, 52),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 10),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                          )),
                    ],
                  ),
                ),
                Visibility(
                  visible: !isVisible,
                  child: Column(
                    children: [
                      const SizedBox(height: 24),
                      Text(
                          'Qual meio devemos utilizar para resetar a sua senha?',
                          style: TextStyle(
                              fontSize: 16,
                              color: Color(InvenmanagerColors.gray_200))),
                      const SizedBox(
                        height: 24.0,
                      ),
                      ElevatedButton.icon(
                          onPressed: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  'Caso esse usuário exista na plataforma um email será enviado com a nova senha :)',
                                  style: TextStyle(
                                      color:
                                          Color(InvenmanagerColors.gray_200)),
                                ),
                                backgroundColor:
                                    Color(InvenmanagerColors.gray_750),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(4),
                                  side: BorderSide(
                                    color: Color(InvenmanagerColors.yellow),
                                  ),
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
                          label: Text(
                            'E-mail',
                            style: TextStyle(
                                color: Color(InvenmanagerColors.gray_200)),
                          ),
                          icon: Icon(
                            Icons.email_outlined,
                            color: Color(InvenmanagerColors.gray_300),
                          ),
                          style: ElevatedButton.styleFrom(
                              textStyle: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                              minimumSize: const Size(300, 52),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 10),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5),
                              ),
                              side: BorderSide(
                                  color: Color(InvenmanagerColors.gray_300)))),
                      const SizedBox(
                        height: 24,
                      ),
                      ElevatedButton.icon(
                          onPressed: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  'Caso esse usuário exista na plataforma um SMS será enviado com a nova senha :)',
                                  style: TextStyle(
                                      color:
                                          Color(InvenmanagerColors.gray_200)),
                                ),
                                backgroundColor:
                                    Color(InvenmanagerColors.gray_750),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(4),
                                  side: BorderSide(
                                    color: Color(InvenmanagerColors.yellow),
                                  ),
                                ),
                                duration: const Duration(seconds: 3),
                              ),
                            );
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const LoginPage(),
                              ),
                            );
                          },
                          label: Text(
                            'SMS',
                            style: TextStyle(
                                color: Color(InvenmanagerColors.gray_200)),
                          ),
                          icon: Icon(
                            Icons.phone,
                            color: Color(InvenmanagerColors.gray_300),
                          ),
                          style: ElevatedButton.styleFrom(
                              textStyle: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                              minimumSize: const Size(300, 52),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 10),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5),
                              ),
                              side: BorderSide(
                                  color: Color(InvenmanagerColors.gray_300)))),
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
