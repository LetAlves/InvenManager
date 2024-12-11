import 'package:flutter/material.dart';
import 'package:invenmanager/global/app_color.dart';
import 'package:invenmanager/global/app_text_style.dart';
import 'package:invenmanager/models/product_model.dart';

class ContentInfoProduct extends StatelessWidget {
  final ProductModel product;

  const ContentInfoProduct({
    Key? key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              product.name ?? "",
              style:
                  AppTextStyle.cardHeaderText.copyWith(color: AppColor.white),
            ),
            const SizedBox(height: 16),
            Text(
              'Quantidade em estoque: ${product.currentQuantity}',
              style: const TextStyle(color: AppColor.gray_200),
            ),
            Text(
              'Estoque mínimo: ${product.minimumQuantity}',
              style: const TextStyle(color: AppColor.gray_200),
            ),
            Text(
              'Valor unitário: R\$ ${product.unitValue}',
              style: const TextStyle(color: AppColor.gray_200),
            ),
          ],
        ),
        Text(
          'Código: ${product.barCode}',
          style: const TextStyle(color: AppColor.gray_200),
        ),
      ],
    );
  }
}
