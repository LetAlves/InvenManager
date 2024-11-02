import 'package:flutter/material.dart';
import 'package:invenmanager/layout/bottomNavBar.dart';
import 'package:invenmanager/global/app_color.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Busca'),
        centerTitle: true,
        backgroundColor: AppColor.gray_800,
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.more_vert),
            tooltip: 'Configurações',
            onPressed: () {
              Scaffold.of(context).openEndDrawer();
            },
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const Padding(
              padding: EdgeInsets.only(top: 20.0),
              child: Text(
                'Informações do produto',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 20),
            TextFormField(
              decoration: const InputDecoration(
                labelStyle: TextStyle(color: AppColor.gray_200),
                filled: true,
                fillColor: AppColor.gray_700,
                hintText: 'Digite o nome ou o código do produto',
                hintStyle: TextStyle(color: AppColor.gray_250),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8.0)),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton.icon(
                onPressed: () {},
                label: const Text(
                  'BUSCAR PRODUTO',
                  style: TextStyle(color: AppColor.gray_800),
                ),
                icon: const Icon(
                  Icons.search,
                  color: AppColor.gray_800,
                ),
                style: ElevatedButton.styleFrom(
                  textStyle: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                  backgroundColor: AppColor.yellow,
                  minimumSize: const Size(335, 52),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                ))
          ],
        ),
      ),
      bottomNavigationBar: const BottomNavBar(),
    );
  }
}
