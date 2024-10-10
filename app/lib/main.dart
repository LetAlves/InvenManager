import 'package:flutter/material.dart';
<<<<<<< HEAD
import 'package:invenmanager/screens/login.dart';
=======
import 'package:invenmanager/screens/home_page.dart';
>>>>>>> 35bbb51a34d8fb0d1dc3617539d44fd8721126b5

void main() {
  runApp(const Invenmanager());
}

class Invenmanager extends StatelessWidget {
  const Invenmanager({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'InvenManager',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
<<<<<<< HEAD
      home: const login(),
=======
      home: const Homepage(),
>>>>>>> 35bbb51a34d8fb0d1dc3617539d44fd8721126b5
    );
  }
}