import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:invenmanager/classes/product.dart';
import 'package:invenmanager/global/app_text_style.dart';
import 'package:invenmanager/layout/bottom_navbar.dart';
import 'package:invenmanager/layout/lateral_menu.dart';
import 'package:invenmanager/global/app_color.dart';
import 'package:invenmanager/pages/create_product_page.dart';
import 'package:invenmanager/pages/inventory_history_page.dart';
import 'package:invenmanager/pages/search_page.dart';
import 'package:invenmanager/layout/content_info_product.dart';
import 'package:invenmanager/widget/custom_button.dart';
import 'package:invenmanager/widget/custom_card.dart';

final Product product = Product(
    id: 1,
    name: 'Chocolate',
    currentQuantity: 200,
    minimumQuantity: 30,
    unitValue: 10.0,
    barCode: 1234567890);

class Homepage extends StatelessWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Meu inventário'),
          centerTitle: true,
          backgroundColor: AppColor.gray_800,
          actions: <Widget>[
            Builder(
              builder: (context) => IconButton(
                icon: const Icon(Icons.more_vert),
                tooltip: 'Configurações',
                onPressed: () {
                  Scaffold.of(context).openEndDrawer();
                },
              ),
            )
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 24.0, horizontal: 20.0),
          child: Column(
            children: <Widget>[
              CustomButton(
                label: 'Buscar',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SearchPage(),
                    ),
                  );
                },
              ),
              const SizedBox(height: 16),
              Container(
                width: 335,
                height: 1,
                color: AppColor.gray_600,
              ),
              const SizedBox(height: 16),
              GestureDetector(
                onTap: () {
                  log('message');
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const CreateProductPage()),
                  );
                },
                child: Wrap(
                  children: [
                    Text(
                      'Você ainda não tem nenhum produto cadastrado! ',
                      style: AppTextStyle.mediumText
                          .copyWith(color: AppColor.white),
                    ),
                    Text(
                      'adicione algum ao estoque.',
                      style: AppTextStyle.mediumText
                          .copyWith(color: AppColor.yellow),
                    ),
                  ],
                ),
              ),
              GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                InventoryHistoryPage(product: product)));
                  },
                  child:
                      CustomCard(content: ContentInfoProduct(product: product)))
            ],
          ),
        ),
        endDrawer: const LateralMenu(),
        bottomNavigationBar: const BottomNavBar());
  }
}
