import 'package:flutter/material.dart';
import 'package:invenmanager/global/app_color.dart';
import 'package:invenmanager/pages/create_product_page.dart';
import 'package:invenmanager/pages/home_page.dart';

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
            TextButton.icon(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const CreateProductPage()),
                );
              },
              label: const Text(
                'Novo Produto',
                style: TextStyle(color: AppColor.gray_300),
              ),
              icon: const Icon(
                Icons.add_circle_outline,
                color: AppColor.gray_300,
              ),
            ),
            TextButton.icon(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Homepage()),
                );
              },
              label: const Text(
                'Meu inventário',
                style: TextStyle(color: AppColor.yellow),
              ),
              icon: const Icon(
                Icons.inventory,
                color: AppColor.yellow,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
