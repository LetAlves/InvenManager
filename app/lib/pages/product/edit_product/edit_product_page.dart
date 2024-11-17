import 'package:flutter/material.dart';
import 'package:invenmanager/global/app_text_style.dart';
import 'package:invenmanager/global/routes.dart';
import 'package:invenmanager/layout/bottom_navbar.dart';
import 'package:invenmanager/layout/lateral_menu.dart';
import 'package:invenmanager/global/app_color.dart';
import 'package:invenmanager/locator.dart';
import 'package:invenmanager/pages/product/Edit_Product/Edit_product_state.dart';
import 'package:invenmanager/pages/product/Edit_product/Edit_product_controller.dart';
import 'package:invenmanager/utils/product_validator.dart';
import 'package:invenmanager/widget/custom_bottom_sheet.dart';
import 'package:invenmanager/widget/custom_button.dart';
import 'package:invenmanager/widget/custom_circular_progress_indicator.dart';
import 'package:invenmanager/widget/custom_text_form_field.dart';

class EditProductPage extends StatefulWidget {
  const EditProductPage({Key? key}) : super(key: key);

  @override
  _EditProductPageState createState() => _EditProductPageState();
}

class _EditProductPageState extends State<EditProductPage> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _minimumQuantityController = TextEditingController();
  final _unitValueController = TextEditingController();
  final _barCodeController = TextEditingController();
  final _controller = locator.get<EditProductController>();

  @override
  void dispose() {
    _nameController.dispose();
    _minimumQuantityController.dispose();
    _unitValueController.dispose();
    _barCodeController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      if (_controller.state is EditProductLoadingState) {
        showDialog(
            context: context,
            builder: (context) => const CustomCircularProgressIndicator());
      }
      if (_controller.state is EditProductSuccessState) {
        Navigator.pop(context);
        Navigator.pushReplacementNamed(context, NamedRoutes.initial);
      }
      if (_controller.state is EditProductErrorState) {
        //final error = _controller.state as EditProductErrorState;
        Navigator.pop(context);
        CustomBottomSheet(context);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Editar Produto'),
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
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Text('Informações do Produto',
                    style: AppTextStyle.headerText
                        .copyWith(color: AppColor.white)),
              ),
              CustomTextFormField(
                controller: _nameController,
                label: 'Nome do Produto',
                hintText: 'Produto 1',
                validator: ProductValidator.validateProductName,
              ),
              CustomTextFormField(
                controller: _unitValueController,
                label: 'Valor Unitário',
                hintText: 'R\$ 100,00',
                keyboardType: TextInputType.number,
                validator: ProductValidator.validateUnitValue,
              ),
              CustomTextFormField(
                controller: _barCodeController,
                label: 'Código',
                hintText: '0000001',
                keyboardType: TextInputType.number,
                validator: ProductValidator.validateBarCode,
              ),
              CustomTextFormField(
                  controller: _minimumQuantityController,
                  label: 'Quantidade Mínima',
                  hintText: 'Ex. 10',
                  keyboardType: TextInputType.number,
                  validator: ProductValidator.validateQuantity),
              CustomButton(
                label: 'Adicionar ao Estoque',
                onPressed: () {
                  final valid = _formKey.currentState!.validate();
                  if (valid) {
                    _controller.editProduct(
                      name: _nameController.text,
                      unitValue: double.parse(_unitValueController.text),
                      minimumQuantity:
                          int.parse(_minimumQuantityController.text),
                      barCode: int.parse(_barCodeController.text),
                    );
                  }
                },
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
