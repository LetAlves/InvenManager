import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:invenmanager/global/app_text_style.dart';
import 'package:invenmanager/global/routes.dart';
import 'package:invenmanager/locator.dart';
import 'package:invenmanager/models/product_model.dart';
import 'package:invenmanager/pages/search_product/search_product_controller.dart';
import 'package:invenmanager/widget/content_info_product.dart';
import 'package:invenmanager/widget/custom_button.dart';
import 'package:invenmanager/widget/custom_card.dart';
import 'package:invenmanager/widget/custom_circular_progress_indicator.dart';
import 'package:invenmanager/widget/lateral_menu/lateral_menu.dart';
import 'package:invenmanager/global/app_color.dart';
import 'package:invenmanager/widget/custom_text_form_field.dart';

class SearchProductPage extends StatefulWidget {
  const SearchProductPage({Key? key}) : super(key: key);

  @override
  State<SearchProductPage> createState() => _SearchProductPageState();
}

class _SearchProductPageState extends State<SearchProductPage>
    with AutomaticKeepAliveClientMixin<SearchProductPage> {
  final _searchController = TextEditingController();
  final _controller = locator.get<SearchProductController>();
  Stream<QuerySnapshot<Map<String, dynamic>>>? products;

  @override
  bool get wantKeepAlive => true;

  @override
  void dispose() {
    super.dispose();
    _searchController.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
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
          padding: const EdgeInsets.symmetric(vertical: 24.0, horizontal: 20.0),
          child: Column(
            children: <Widget>[
              Column(
                children: [
                  Text(
                    'Informações do Produto',
                    style:
                        AppTextStyle.headerText.copyWith(color: AppColor.white),
                  ),
                  CustomTextFormField(
                    controller: _searchController,
                    label: '',
                    hintText: 'Digite o nome ou o código do produto',
                  ),
                  CustomButton(
                    label: 'Buscar',
                    onPressed: () {
                      setState(() {
                        products = _controller.getProduct(
                            value: _searchController.text);
                      });
                    },
                  ),
                  Column(
                    children: [
                      const SizedBox(height: 16),
                      Container(
                        width: 335,
                        height: 1,
                        color: AppColor.gray_600,
                      ),
                      const SizedBox(height: 16),
                      StreamBuilder(
                        stream: products,
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return const Center(
                              child: CustomCircularProgressIndicator(),
                            );
                          } else {
                            if (snapshot.hasData &&
                                snapshot.data != null &&
                                snapshot.data!.docs.isNotEmpty) {
                              List<ProductModel> products = [];

                              for (var doc in snapshot.data!.docs) {
                                products.add(ProductModel.fromMap(doc.data()));
                              }
                              return Column(
                                children: products.map(
                                  (product) {
                                    return GestureDetector(
                                      onTap: () {
                                        Navigator.pushNamed(
                                          context,
                                          NamedRoutes.informationProduct,
                                          arguments: product,
                                        );
                                      },
                                      child: CustomCard(
                                        content: ContentInfoProduct(
                                            product: product),
                                        isErrorStyle:
                                            product.currentQuantity! <=
                                                    product.minimumQuantity!
                                                ? true
                                                : false,
                                      ),
                                    );
                                  },
                                ).toList(),
                              );
                            } else {
                              return Text(
                                'Produto não encontrado!',
                                style: AppTextStyle.mediumText
                                    .copyWith(color: AppColor.white),
                              );
                            }
                          }
                        },
                      )
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      endDrawer: const LateralMenu(),
    );
  }
}
