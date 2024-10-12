import 'package:flutter/material.dart';
import 'package:invenmanager/screens/login.dart';
import 'package:invenmanager/screens/search.dart';
import 'package:invenmanager/screens/productinformation.dart';
import 'package:invenmanager/screens/stockhistory.dart';

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
      home: const Stockhistory(),
    );
  }
}
