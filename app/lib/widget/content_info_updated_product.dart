import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:invenmanager/global/app_color.dart';
import 'package:invenmanager/global/app_text_style.dart';
import 'package:invenmanager/models/history_product_model.dart';
import 'package:invenmanager/widget/custom_card.dart';
import 'package:invenmanager/widget/custom_sized_box.dart';

class ContentInfoUpdatedProduct extends StatelessWidget {
  final HistoryProductItemModel historyItem;

  const ContentInfoUpdatedProduct({
    Key? key,
    required this.historyItem,
  });

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      content: Center(
        child: Column(
          children: [
            Text(
              'Estoque Atualizado',
              style:
                  AppTextStyle.cardHeaderText.copyWith(color: AppColor.white),
            ),
            Text(
              DateFormat('dd-MM-yyyy hh:mm:ss').format(historyItem.createdAt!),
              style: AppTextStyle.smallText.copyWith(color: AppColor.gray_200),
            ),
            const SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'De:',
                  style:
                      AppTextStyle.smallText.copyWith(color: AppColor.gray_200),
                ),
                const SizedBox(width: 10),
                CustomSizedBox(
                  value: '${historyItem.from}',
                  enabled: false,
                ),
                const SizedBox(width: 30),
                Text(
                  'Para:',
                  style:
                      AppTextStyle.smallText.copyWith(color: AppColor.gray_200),
                ),
                const SizedBox(width: 10),
                CustomSizedBox(
                  value: '${historyItem.to}',
                  enabled: false,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
