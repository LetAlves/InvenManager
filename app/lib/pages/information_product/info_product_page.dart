import 'package:flutter/material.dart';
import 'package:invenmanager/classes/product.dart';
import 'package:invenmanager/global/app_color.dart';
import 'package:invenmanager/global/app_text_style.dart';
import 'package:invenmanager/layout/bottom_navbar.dart';
import 'package:invenmanager/layout/content_info_product.dart';
import 'package:invenmanager/layout/content_info_updated_product.dart';
import 'package:invenmanager/layout/lateral_menu.dart';
import 'package:invenmanager/pages/home/home_page.dart';
import 'package:invenmanager/widget/custom_button.dart';
import 'package:invenmanager/widget/custom_card.dart';
import 'package:invenmanager/widget/custom_filled_button_bar.dart';
import 'package:invenmanager/widget/custom_sized_box.dart';

class InfoProductPage extends StatefulWidget {
  final Product product;

  const InfoProductPage({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  State<InfoProductPage> createState() => _InfoProductPageState();
}

class _InfoProductPageState extends State<InfoProductPage> {
  bool isVisibleHistory = false;
  bool isVisibleAction = true;

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
            tooltip: 'Exportar histórico',
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
              ContentInfoProduct(product: product),
              const SizedBox(height: 16),
              Container(
                width: 380,
                height: 1,
                color: AppColor.gray_600,
              ),
              const SizedBox(height: 16),
              Container(
                color: AppColor.gray_750,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    CustomFilledButtonBar(
                      label: 'Histórico de Ações',
                      icon: Icons.history,
                      onPressed: () {
                        setState(() {
                          isVisibleHistory = true;
                          isVisibleAction = false;
                        });
                      },
                    ),
                    CustomFilledButtonBar(
                      label: 'Ações',
                      icon: Icons.pending_actions,
                      onPressed: () {
                        setState(() {
                          isVisibleHistory = false;
                          isVisibleAction = true;
                        });
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),
              Visibility(
                  visible: isVisibleHistory,
                  child: const ContentInfoUpdatedProduct()),
              Visibility(
                  visible: isVisibleAction,
                  child: CustomCard(
                      content: Column(
                    children: [
                      Text(
                        'Atualizar estoque',
                        style: AppTextStyle.cardHeaderText
                            .copyWith(color: AppColor.white),
                      ),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Nova quantidade:',
                            style: AppTextStyle.smallText
                                .copyWith(color: AppColor.gray_200),
                          ),
                          const SizedBox(width: 10),
                          //TODO: Substituir pra um input
                          const CustomSizedBox(value: '10'),
                        ],
                      ),
                      const SizedBox(height: 10),
                      CustomButton(
                        label: 'Confirmar estoque',
                        labelColor: AppColor.white,
                        backgroundColor: AppColor.green,
                        onPressed: () {},
                      )
                    ],
                    //TODO: Fazer uns inputs para atualizar as informações do Produto: Nome, estoque mínimo, valor unitário e código
                  )))
            ],
          ),
        ),
      ),
      endDrawer: const LateralMenu(),
      bottomNavigationBar: const BottomNavBar(),
    );
  }
}
