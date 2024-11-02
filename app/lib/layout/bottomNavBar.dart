import 'package:flutter/material.dart';
import 'package:invenmanager/global/invenmanager_colors.dart';
import 'package:invenmanager/screens/create_product_page.dart';
import 'package:invenmanager/screens/home_page.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: Color(InvenmanagerColors.gray_800),
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
              label: Text(
                'Novo Produto',
                style: TextStyle(color: Color(InvenmanagerColors.gray_300)),
              ),
              icon: Icon(
                Icons.add_circle_outline,
                color: Color(InvenmanagerColors.gray_300),
              ),
            ),
            TextButton.icon(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Homepage()),
                );
              },
              label: Text(
                'Meu inventário',
                style: TextStyle(color: Color(InvenmanagerColors.yellow)),
              ),
              icon: Icon(
                Icons.inventory,
                color: Color(InvenmanagerColors.yellow),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
