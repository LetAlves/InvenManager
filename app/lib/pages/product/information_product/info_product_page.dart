import 'package:flutter/material.dart';
import 'package:invenmanager/global/app_color.dart';
import 'package:invenmanager/global/app_text_style.dart';
import 'package:invenmanager/global/routes.dart';
import 'package:invenmanager/layout/bottom_navbar.dart';
import 'package:invenmanager/layout/content_info_product.dart';
import 'package:invenmanager/layout/content_info_updated_product.dart';
import 'package:invenmanager/layout/lateral_menu.dart';
import 'package:invenmanager/locator.dart';
import 'package:invenmanager/pages/home/home_page.dart';
import 'package:invenmanager/pages/product/information_product/info_product_controller.dart';
import 'package:invenmanager/pages/product/information_product/info_product_state.dart';
import 'package:invenmanager/widget/custom_bottom_sheet.dart';
import 'package:invenmanager/widget/custom_button.dart';
import 'package:invenmanager/widget/custom_card.dart';
import 'package:invenmanager/widget/custom_circular_progress_indicator.dart';
import 'package:invenmanager/widget/custom_filled_button_bar.dart';
import 'package:invenmanager/widget/custom_sized_box.dart';

class InfoProductPage extends StatefulWidget {
  const InfoProductPage({Key? key}) : super(key: key);

  @override
  State<InfoProductPage> createState() => _InfoProductPageState();
}

class _InfoProductPageState extends State<InfoProductPage> {
  final _oldQuantity = TextEditingController();
  final _newQuantity = TextEditingController();
  final _controller = locator.get<InfoProductController>();

  bool isVisibleHistory = false;
  bool isVisibleAction = true;

  @override
  void dispose() {
    _oldQuantity.dispose();
    _newQuantity.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      if (_controller.state is InfoProductLoadingState) {
        showDialog(
            context: context,
            builder: (context) => const CustomCircularProgressIndicator());
      }
      if (_controller.state is InfoProductSuccessState) {
        Navigator.pop(context);
        Navigator.pushReplacementNamed(context, NamedRoutes.initial);
      }
      if (_controller.state is InfoProductErrorState) {
        //final error = _controller.state as InfoProductErrorState;
        Navigator.pop(context);
        CustomBottomSheet(context);
      }
    });
  }

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
      body: SingleChildScrollView(
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
                decoration: BoxDecoration(
                    color: AppColor.gray_750,
                    borderRadius: BorderRadius.circular(4.0)),
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
                child: const Column(
                  children: [
                    ContentInfoUpdatedProduct(),
                    SizedBox(height: 10),
                    ContentInfoUpdatedProduct(),
                    SizedBox(height: 10),
                    ContentInfoUpdatedProduct()
                  ],
                ),
              ),
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
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      endDrawer: const LateralMenu(),
      bottomNavigationBar: const BottomNavBar(),
    );
  }
}
