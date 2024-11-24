import 'package:flutter/material.dart';
import 'package:invenmanager/global/app_text_style.dart';
import 'package:invenmanager/global/routes.dart';
import 'package:invenmanager/widget/lateral_menu.dart';
import 'package:invenmanager/global/app_color.dart';
import 'package:invenmanager/locator.dart';
import 'package:invenmanager/pages/product/create_product/create_product_state.dart';
import 'package:invenmanager/pages/product/create_product/create_product_controller.dart';
import 'package:invenmanager/utils/product_validator.dart';
import 'package:invenmanager/widget/custom_bottom_sheet.dart';
import 'package:invenmanager/widget/custom_button.dart';
import 'package:invenmanager/widget/custom_circular_progress_indicator.dart';
import 'package:invenmanager/widget/custom_text_form_field.dart';

class CreateProductPage extends StatefulWidget {
  const CreateProductPage({Key? key}) : super(key: key);

  @override
  _CreateProductPageState createState() => _CreateProductPageState();
}

class _CreateProductPageState extends State<CreateProductPage> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _currentQuantityController = TextEditingController();
  final _minimumQuantityController = TextEditingController();
  final _unitValueController = TextEditingController();
  final _barCodeController = TextEditingController();
  final _controller = locator.get<CreateProductController>();

  @override
  void dispose() {
    _nameController.dispose();
    _currentQuantityController.dispose();
    _minimumQuantityController.dispose();
    _unitValueController.dispose();
    _barCodeController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      if (_controller.state is CreateProductLoadingState) {
        showDialog(
            context: context,
            builder: (context) => const CustomCircularProgressIndicator());
      }
      if (_controller.state is CreateProductSuccessState) {
        Navigator.pop(context);
        Navigator.pushReplacementNamed(context, NamedRoutes.initial);
      }
      if (_controller.state is CreateProductErrorState) {
        //final error = _controller.state as CreateProductErrorState;
        Navigator.pop(context);
        CustomBottomSheet(context);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Adicionar novo produto'),
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
                controller: _currentQuantityController,
                label: 'Quantidade',
                hintText: 'Ex. 10',
                keyboardType: TextInputType.number,
                validator: ProductValidator.validateQuantity,
              ),
              CustomTextFormField(
                controller: _minimumQuantityController,
                label: 'Quantidade Mínima',
                hintText: 'Ex. 10',
                keyboardType: TextInputType.number,
                validator: ProductValidator.validateQuantity,
              ),
              CustomButton(
                label: 'Adicionar ao Estoque',
                onPressed: () {
                  final valid = _formKey.currentState!.validate();
                  if (valid) {
                    _controller.createProduct(
                      name: _nameController.text,
                      unitValue: double.parse(_unitValueController.text),
                      currentQuantity:
                          int.parse(_currentQuantityController.text),
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
    );
  }
}
