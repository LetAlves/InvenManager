import 'package:flutter/material.dart';
import 'package:invenmanager/pages/home/home_page.dart';
import 'package:invenmanager/pages/inventory_history_page.dart';
import 'package:invenmanager/pages/login/login_page.dart';

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
      home: const SafeArea(child: Homepage()),
    );
  }
}
