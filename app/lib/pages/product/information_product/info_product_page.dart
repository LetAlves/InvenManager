import 'package:flutter/material.dart';
import 'package:invenmanager/global/app_color.dart';
import 'package:invenmanager/global/app_text_style.dart';
import 'package:invenmanager/global/routes.dart';
import 'package:invenmanager/models/history_product_model.dart';
import 'package:invenmanager/models/product_model.dart';
import 'package:invenmanager/utils/product_validator.dart';
import 'package:invenmanager/widget/content_info_product.dart';
import 'package:invenmanager/widget/content_info_updated_product.dart';
import 'package:invenmanager/widget/lateral_menu/lateral_menu.dart';
import 'package:invenmanager/locator.dart';
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
  final _formKey = GlobalKey<FormState>();
  final _oldQuantity = TextEditingController();
  final _newQuantityController = TextEditingController();
  final _controller = locator.get<InfoProductController>();

  bool isVisibleHistory = false;
  bool isVisibleAction = true;

  @override
  void dispose() {
    super.dispose();
    _oldQuantity.dispose();
    _newQuantityController.dispose();
    _controller.dispose();
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
    final product = ModalRoute.of(context)!.settings.arguments as ProductModel;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Informações do Produto'),
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
        padding: const EdgeInsets.symmetric(vertical: 24.0, horizontal: 20.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    NamedRoutes.editProduct,
                    arguments: product,
                  );
                },
                child: ContentInfoProduct(
                  product: product,
                ),
              ),
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
                      color:
                          isVisibleHistory == true ? AppColor.gray_600 : null,
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
                      color: isVisibleAction == true ? AppColor.gray_600 : null,
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
                child: Column(
                  children: [
                    StreamBuilder(
                      stream:
                          _controller.getProductHistory(productId: product.id!),
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
                            List<HistoryProductItemModel> historyItems = [];

                            for (var doc in snapshot.data!.docs) {
                              var data = doc.data();
                              var history = data['history'];

                              if (history != null && history.isNotEmpty) {
                                for (var historyEntry in history) {
                                  var createdAtString =
                                      historyEntry['createdAt'];
                                  DateTime createdAt =
                                      DateTime.parse(createdAtString);

                                  historyItems
                                      .add(HistoryProductItemModel.fromMap({
                                    ...historyEntry,
                                    'createdAt': createdAt,
                                  }));
                                }
                              }
                            }

                            if (historyItems.isNotEmpty) {
                              return Column(
                                children: historyItems.map(
                                  (historyItem) {
                                    return ContentInfoUpdatedProduct(
                                      historyItem: historyItem,
                                    );
                                  },
                                ).toList(),
                              );
                            } else {
                              return Text(
                                'O produto ainda não tem nenhuma ação',
                                style: AppTextStyle.mediumText
                                    .copyWith(color: AppColor.white),
                              );
                            }
                          } else {
                            return Text(
                              'O produto ainda não tem nenhuma ação',
                              style: AppTextStyle.mediumText
                                  .copyWith(color: AppColor.white),
                            );
                          }
                        }
                      },
                    )
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
                          Form(
                            key: _formKey,
                            child: CustomSizedBox(
                              value: '10',
                              controller: _newQuantityController,
                              validator: ProductValidator.validateQuantity,
                            ),
                          )
                        ],
                      ),
                      const SizedBox(height: 10),
                      CustomButton(
                        label: 'Confirmar estoque',
                        labelColor: AppColor.white,
                        backgroundColor: AppColor.green,
                        onPressed: () {
                          final valid = _formKey.currentState!.validate();
                          if (valid) {
                            _controller.updateQuantityProduct(
                              id: product.id!,
                              oldQuantity: product.currentQuantity ?? 0,
                              newQuantity:
                                  int.parse(_newQuantityController.text),
                            );
                          }
                        },
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
    );
  }
}
