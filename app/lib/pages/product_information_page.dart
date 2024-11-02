import 'package:flutter/material.dart';
import 'package:invenmanager/layout/bottomNavBar.dart';
import 'package:invenmanager/layout/lateralMenu.dart';
import 'package:invenmanager/global/app_color.dart';
import 'package:invenmanager/widget/custom_button.dart';

class ProductInformationPage extends StatefulWidget {
  const ProductInformationPage({Key? key}) : super(key: key);

  @override
  State<ProductInformationPage> createState() => _ProductInformationPageState();
}

class _ProductInformationPageState extends State<ProductInformationPage> {
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
                color: AppColor.gray_600,
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
                    onPressed: () {},
                    icon: const Icon(
                      Icons.history,
                      color: AppColor.white,
                    ),
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
                    icon: const Icon(
                      Icons.pending_actions,
                      color: AppColor.white,
                    ),
                    label: const Text(
                      'Ações',
                      style: TextStyle(color: AppColor.white),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30),
              Center(
                child: Container(
                  padding: const EdgeInsets.all(20.0),
                  decoration: BoxDecoration(
                    color: AppColor.gray_750,
                    borderRadius: BorderRadius.circular(10),
                    border: const Border(
                      bottom: BorderSide(
                        color: AppColor.yellow,
                        width: 2.0,
                      ),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text(
                        'Atualizar Estoque',
                        style: TextStyle(
                          color: AppColor.white,
                          fontSize: 15,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      const SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Nova Quantidade:',
                            style: TextStyle(color: AppColor.gray_200),
                          ),
                          const SizedBox(width: 8),
                          SizedBox(
                            width: 70,
                            child: TextFormField(
                              decoration: const InputDecoration(
                                filled: true,
                                fillColor: AppColor.gray_700,
                                hintText: '50',
                                hintStyle: TextStyle(color: AppColor.gray_250),
                                border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(8.0)),
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
                      const SizedBox(height: 20),
                      CustomButton(
                        label: 'Confirmar Estoque',
                        labelColor: AppColor.white,
                        backgroundColor: AppColor.green,
                        onPressed: () {},
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
      endDrawer: const LateralMenu(),
      bottomNavigationBar: const BottomNavBar(),
    );
  }
}
