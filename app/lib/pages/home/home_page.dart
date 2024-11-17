import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:invenmanager/classes/product.dart';
import 'package:invenmanager/global/app_text_style.dart';
import 'package:invenmanager/global/routes.dart';
import 'package:invenmanager/layout/bottom_navbar.dart';
import 'package:invenmanager/layout/lateral_menu.dart';
import 'package:invenmanager/global/app_color.dart';
import 'package:invenmanager/layout/content_info_product.dart';
import 'package:invenmanager/widget/custom_button.dart';
import 'package:invenmanager/widget/custom_card.dart';
import 'package:invenmanager/widget/custom_text_form_field.dart';

final Product product = Product(
    id: 1,
    name: 'Chocolate',
    currentQuantity: 200,
    minimumQuantity: 30,
    unitValue: 10.0,
    barCode: 1234567890);

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  bool isVisibleSearch = false;

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
        body: SingleChildScrollView(
          child: Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 24.0, horizontal: 20.0),
            child: Column(
              children: <Widget>[
                Visibility(
                    visible: isVisibleSearch,
                    child: Column(
                      children: [
                        Text(
                          'Informações do Produto',
                          style: AppTextStyle.headerText
                              .copyWith(color: AppColor.white),
                        ),
                        const CustomTextFormField(
                          label: '',
                          hintText: 'Digite o nome ou o código do produto',
                        )
                      ],
                    )),
                CustomButton(
                  label: 'Buscar',
                  onPressed: () {
                    setState(() {
                      isVisibleSearch = !isVisibleSearch;
                    });
                  },
                ),
                Visibility(
                    visible: !isVisibleSearch,
                    child: Column(
                      children: [
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
                            Navigator.pushNamed(
                                context, NamedRoutes.createProduct);
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
                              Navigator.pushNamed(
                                  context, NamedRoutes.informationProduct);
                            },
                            child: CustomCard(
                                content: ContentInfoProduct(product: product)))
                      ],
                    ))
              ],
            ),
          ),
        ),
        endDrawer: const LateralMenu(),
        bottomNavigationBar: const BottomNavBar());
  }
}
