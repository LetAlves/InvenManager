import 'package:flutter/material.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: const Color(0xFF1E1E1E),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextButton.icon(
              onPressed: () {},
              label: const Text(
                'Novo Produto',
                style: TextStyle(color: Color(0xFF8D8D99)),
              ),
              icon: const Icon(
                Icons.add_circle_outline,
                color: Color(0xFF8D8D99),
              ),
            ),
            TextButton.icon(
              onPressed: () {},
              label: const Text(
                'Meu inventário',
                style: TextStyle(color: Color(0xFFF7DD43)),
              ),
              icon: const Icon(
                Icons.inventory,
                color: Color(0xFFF7DD43),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
