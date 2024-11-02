import 'package:flutter/material.dart';
import 'package:invenmanager/layout/bottomNavBar.dart';
import 'package:invenmanager/layout/lateralMenu.dart';
import 'package:invenmanager/global/app_color.dart';
import 'package:invenmanager/pages/product_information_page.dart';

class InventoryHistoryPage extends StatefulWidget {
  const InventoryHistoryPage({Key? key}) : super(key: key);

  @override
  State<InventoryHistoryPage> createState() => _InventoryHistoryPageState();
}

class _InventoryHistoryPageState extends State<InventoryHistoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Informações do Produto'),
        centerTitle: true,
        backgroundColor: AppColor.gray_800,
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.file_upload_outlined),
            tooltip: 'Upload',
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 24.0, horizontal: 20.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              const Text(
                'Produto 1',
                style: TextStyle(
                  color: AppColor.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Quantidade em estoque: 50',
                        style: TextStyle(color: AppColor.gray_200),
                      ),
                      Text(
                        'Estoque mínimo: 10',
                        style: TextStyle(color: AppColor.gray_200),
                      ),
                    ],
                  ),
                  Text(
                    'Código: 0000010',
                    style: TextStyle(color: AppColor.gray_200),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Container(
                width: 380,
                height: 1,
                color: const Color(0xFF323238),
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      textStyle: const TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                      ),
                      backgroundColor: AppColor.gray_750,
                      minimumSize: const Size(100, 48),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 10),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ProductInformationPage(),
                        ),
                      );
                    },
                    icon: const Icon(Icons.history, color: AppColor.white),
                    label: const Text(
                      'Histórico de Ações',
                      style: TextStyle(color: AppColor.white),
                    ),
                  ),
                  ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      textStyle: const TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                      ),
                      backgroundColor: AppColor.gray_750,
                      minimumSize: const Size(50, 48),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 50, vertical: 10),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onPressed: () {},
                    icon: const Icon(Icons.pending_actions,
                        color: AppColor.white),
                    label: const Text(
                      'Ações',
                      style: TextStyle(color: AppColor.white),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30),
              _buildStockUpdateContainer(
                  '20 de Novembro de 2023 às 12:00', '50', '80'),
              const SizedBox(height: 30),
              _buildStockUpdateContainer(
                  '20 de Novembro de 2023 às 12:00', '50', '80'),
            ],
          ),
        ),
      ),
      endDrawer: const LateralMenu(),
      bottomNavigationBar: const BottomNavBar(),
    );
  }

  Widget _buildStockUpdateContainer(
      String date, String fromQuantity, String toQuantity) {
    return Center(
      child: Container(
        padding: const EdgeInsets.all(20.0),
        decoration: BoxDecoration(
          color: AppColor.gray_750,
          borderRadius: BorderRadius.circular(10),
          border: const Border(
            bottom: BorderSide(color: AppColor.yellow, width: 2.0),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              'Estoque Atualizado',
              style: TextStyle(
                color: AppColor.white,
                fontSize: 15,
                fontWeight: FontWeight.w800,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              date,
              style: const TextStyle(color: AppColor.gray_200),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'De:',
                  style: TextStyle(color: AppColor.gray_200),
                ),
                const SizedBox(width: 20),
                SizedBox(
                  width: 70,
                  child: TextFormField(
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: AppColor.gray_700,
                      hintText: fromQuantity,
                      hintStyle: const TextStyle(color: AppColor.gray_250),
                      border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8.0)),
                        borderSide: BorderSide.none,
                      ),
                    ),
                    style: const TextStyle(color: AppColor.white),
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(width: 20),
                const Text(
                  'Para:',
                  style: TextStyle(color: AppColor.gray_200),
                ),
                const SizedBox(width: 20),
                SizedBox(
                  width: 70,
                  child: TextFormField(
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: AppColor.gray_700,
                      hintText: toQuantity,
                      hintStyle: const TextStyle(color: AppColor.gray_250),
                      border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8.0)),
                        borderSide: BorderSide.none,
                      ),
                    ),
                    style: const TextStyle(color: AppColor.white),
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
