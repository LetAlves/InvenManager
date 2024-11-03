import 'package:flutter/material.dart';
import 'package:invenmanager/global/app_color.dart';
import 'package:invenmanager/pages/product/create_product_page.dart';
import 'package:invenmanager/pages/home/home_page.dart';
import 'package:invenmanager/widget/text_button_navbar.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: AppColor.gray_800,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextButtonNavBar(
              label: 'Novo Produto',
              icon: Icons.add_circle_outline,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const CreateProductPage()),
                );
              },
            ),
            TextButtonNavBar(
              label: 'Meu inventário',
              icon: Icons.inventory,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Homepage()),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
