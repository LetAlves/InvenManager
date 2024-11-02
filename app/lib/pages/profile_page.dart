import 'package:flutter/material.dart';
import 'package:invenmanager/global/invenmanager_colors.dart';

class Profilepage extends StatefulWidget {
  const Profilepage({super.key});

  @override
  State<Profilepage> createState() => _ProfilepageState();
}

class _ProfilepageState extends State<Profilepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Perfil'),
        centerTitle: true,
        backgroundColor: const Color(0xFF1E1E1E),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
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
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Nome',
                    labelStyle:
                        TextStyle(color: Color(InvenmanagerColors.gray_200)),
                    filled: true,
                    fillColor: Color(InvenmanagerColors.gray_700),
                    hintText: 'John Doe',
                    hintStyle:
                        TextStyle(color: Color(InvenmanagerColors.gray_250)),
                    border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8.0)),
                      borderSide: BorderSide.none,
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(8.0)),
                        borderSide: BorderSide(
                            color: Color(InvenmanagerColors.gray_250))),
                    enabledBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8.0)),
                      borderSide: BorderSide.none,
                    ),
                  ),
                  style: TextStyle(color: Color(InvenmanagerColors.white)),
                  cursorColor: Color(InvenmanagerColors.yellow),
                ),
                const SizedBox(height: 24),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'E-mail',
                    labelStyle:
                        TextStyle(color: Color(InvenmanagerColors.gray_200)),
                    filled: true,
                    fillColor: Color(InvenmanagerColors.gray_700),
                    hintText: 'john.doe@email.com',
                    hintStyle:
                        TextStyle(color: Color(InvenmanagerColors.gray_250)),
                    border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8.0)),
                      borderSide: BorderSide.none,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius:
                          const BorderRadius.all(Radius.circular(8.0)),
                      borderSide:
                          BorderSide(color: Color(InvenmanagerColors.gray_250)),
                    ),
                    enabledBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8.0)),
                      borderSide: BorderSide.none,
                    ),
                  ),
                  style: TextStyle(color: Color(InvenmanagerColors.white)),
                  cursorColor: Color(InvenmanagerColors.yellow),
                ),
                const SizedBox(height: 24),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Contato',
                    labelStyle:
                        TextStyle(color: Color(InvenmanagerColors.gray_200)),
                    filled: true,
                    fillColor: Color(InvenmanagerColors.gray_700),
                    hintText: '(11) 4002-8922',
                    hintStyle:
                        TextStyle(color: Color(InvenmanagerColors.gray_250)),
                    border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8.0)),
                      borderSide: BorderSide.none,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius:
                          const BorderRadius.all(Radius.circular(8.0)),
                      borderSide:
                          BorderSide(color: Color(InvenmanagerColors.gray_250)),
                    ),
                    enabledBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8.0)),
                      borderSide: BorderSide.none,
                    ),
                  ),
                  style: TextStyle(color: Color(InvenmanagerColors.white)),
                  cursorColor: Color(InvenmanagerColors.yellow),
                ),
                const SizedBox(height: 64),
                ElevatedButton.icon(
                    onPressed: () {},
                    label: Text(
                      'Editar',
                      style:
                          TextStyle(color: Color(InvenmanagerColors.gray_800)),
                    ),
                    style: ElevatedButton.styleFrom(
                      textStyle: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                      backgroundColor: Color(InvenmanagerColors.yellow),
                      minimumSize: const Size(335, 52),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
