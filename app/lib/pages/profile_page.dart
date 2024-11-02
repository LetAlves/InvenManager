import 'package:flutter/material.dart';
import 'package:invenmanager/global/app_color.dart';
import 'package:invenmanager/widget/custom_button.dart';

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
        backgroundColor: AppColor.gray_800,
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
                  decoration: const InputDecoration(
                    labelText: 'Nome',
                    labelStyle: TextStyle(color: AppColor.gray_200),
                    filled: true,
                    fillColor: AppColor.gray_700,
                    hintText: 'John Doe',
                    hintStyle: TextStyle(color: AppColor.gray_250),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8.0)),
                      borderSide: BorderSide.none,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8.0)),
                      borderSide: BorderSide(color: AppColor.gray_250),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8.0)),
                      borderSide: BorderSide.none,
                    ),
                  ),
                  style: const TextStyle(color: AppColor.white),
                  cursorColor: AppColor.yellow,
                ),
                const SizedBox(height: 24),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'E-mail',
                    labelStyle: TextStyle(color: AppColor.gray_200),
                    filled: true,
                    fillColor: AppColor.gray_700,
                    hintText: 'john.doe@email.com',
                    hintStyle: TextStyle(color: AppColor.gray_250),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8.0)),
                      borderSide: BorderSide.none,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8.0)),
                      borderSide: BorderSide(color: AppColor.gray_250),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8.0)),
                      borderSide: BorderSide.none,
                    ),
                  ),
                  style: const TextStyle(color: AppColor.white),
                  cursorColor: AppColor.yellow,
                ),
                const SizedBox(height: 24),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Contato',
                    labelStyle: TextStyle(color: AppColor.gray_200),
                    filled: true,
                    fillColor: AppColor.gray_700,
                    hintText: '(11) 4002-8922',
                    hintStyle: TextStyle(color: AppColor.gray_250),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8.0)),
                      borderSide: BorderSide.none,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8.0)),
                      borderSide: BorderSide(color: AppColor.gray_250),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8.0)),
                      borderSide: BorderSide.none,
                    ),
                  ),
                  style: const TextStyle(color: AppColor.white),
                  cursorColor: AppColor.yellow,
                ),
                const SizedBox(height: 64),
                CustomButton(
                  label: 'Editar',
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
