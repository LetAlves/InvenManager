import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:invenmanager/global/app_color.dart';
import 'package:invenmanager/global/routes.dart';
import 'package:invenmanager/pages/home/home_page.dart';
import 'package:invenmanager/pages/product/create_product/create_product_page.dart';
import 'package:invenmanager/widget/text_button_navbar.dart';

class HomePageView extends StatefulWidget {
  const HomePageView({super.key});

  @override
  State<HomePageView> createState() => _HomePageViewState();
}

class _HomePageViewState extends State<HomePageView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: PageView(
        physics: const AlwaysScrollableScrollPhysics(),
        children: const [Homepage(), CreateProductPage()],
      ),
      bottomNavigationBar: BottomAppBar(
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
                  Navigator.pushReplacementNamed(
                      context, NamedRoutes.createProduct);
                },
              ),
              TextButtonNavBar(
                label: 'Meu inventário',
                icon: Icons.inventory,
                onPressed: () {
                  Navigator.pushReplacementNamed(context, NamedRoutes.initial);
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
