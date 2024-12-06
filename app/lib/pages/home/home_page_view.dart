import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:invenmanager/global/app_color.dart';
import 'package:invenmanager/pages/home/home_page.dart';
import 'package:invenmanager/pages/product/create_product/create_product_page.dart';
import 'package:invenmanager/widget/custom_bottom_app_bar.dart';

class HomePageView extends StatefulWidget {
  const HomePageView({super.key});

  @override
  State<HomePageView> createState() => _HomePageViewState();
}

class _HomePageViewState extends State<HomePageView> {
  final pageController = PageController();
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    pageController.addListener(() {
      log(pageController.page.toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: PageView(
        controller: pageController,
        physics: const AlwaysScrollableScrollPhysics(),
        onPageChanged: (index) {
          setState(() {
            _currentPage = index;
          });
        },
        children: const [
          Homepage(),
          CreateProductPage(),
        ],
      ),
      bottomNavigationBar: CustomBottomAppBar(
        selectedItemColor: AppColor.yellow,
        currentIndex: _currentPage, // Passa a página atual
        children: [
          CustomBottomAppBarItem(
            label: "Meu Inventário",
            primaryIcon: Icons.inventory_2_outlined,
            secondaryIcon: Icons.inventory_2,
            onPressed: () => pageController.jumpToPage(0),
          ),
          CustomBottomAppBarItem(
            label: "Novo Produto",
            primaryIcon: Icons.add_circle_outline,
            secondaryIcon: Icons.add_circle,
            onPressed: () => pageController.jumpToPage(1),
          ),
        ],
      ),
    );
  }
}
