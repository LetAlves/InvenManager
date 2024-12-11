import 'package:flutter/material.dart';
import 'package:invenmanager/global/app_text_style.dart';
import 'package:invenmanager/global/routes.dart';
import 'package:invenmanager/locator.dart';
import 'package:invenmanager/models/product_model.dart';
import 'package:invenmanager/pages/home/home_controller.dart';
import 'package:invenmanager/widget/content_info_product.dart';
import 'package:invenmanager/widget/custom_card.dart';
import 'package:invenmanager/widget/custom_circular_progress_indicator.dart';
import 'package:invenmanager/widget/lateral_menu/lateral_menu.dart';
import 'package:invenmanager/global/app_color.dart';
import 'package:invenmanager/widget/custom_button.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage>
    with AutomaticKeepAliveClientMixin<Homepage> {
  bool isVisibleSearch = false;
  final _controller = locator.get<HomeController>();

  @override
  bool get wantKeepAlive => true;

  @override
  void dispose() {
    super.dispose();
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
              CustomButton(
                label: 'Buscar',
                onPressed: () {
                  Navigator.pushNamed(context, NamedRoutes.searchProduct);
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
                    stream: _controller.getProducts(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
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
                                    content:
                                        ContentInfoProduct(product: product),
                                    isErrorStyle: product.currentQuantity! <=
                                            product.minimumQuantity!
                                        ? true
                                        : false,
                                  ),
                                );
                              },
                            ).toList(),
                          );
                        } else {
                          return Wrap(
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
                          );
                        }
                      }
                    },
                  )
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
