import 'package:flutter/material.dart';
import 'package:invenmanager/classes/product.dart';
import 'package:invenmanager/global/app_text_style.dart';
import 'package:invenmanager/global/routes.dart';
import 'package:invenmanager/layout/bottom_navbar.dart';
import 'package:invenmanager/layout/lateral_menu.dart';
import 'package:invenmanager/global/app_color.dart';
import 'package:invenmanager/widget/custom_button.dart';
import 'package:invenmanager/widget/custom_text_form_field.dart';

class CreateProductPage extends StatefulWidget {
  const CreateProductPage({Key? key}) : super(key: key);

  @override
  _CreateProductPageState createState() => _CreateProductPageState();
}

class _CreateProductPageState extends State<CreateProductPage> {
  final Product product = Product(
      id: 1,
      name: 'Chocolate',
      currentQuantity: 200,
      minimumQuantity: 30,
      unitValue: 10.0,
      barCode: 1234567890);
  final _formKey = GlobalKey<FormState>();

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
                label: 'Nome do Produto',
                hintText: 'Produto 1',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira o nome do produto';
                  }
                  return null;
                },
              ),
              CustomTextFormField(
                label: 'Valor Unitário',
                hintText: 'R\$ 100,00',
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira o valor unitário';
                  }
                  final parsedValue = double.tryParse(value);
                  if (parsedValue == null) {
                    return 'Por favor, insira um número válido';
                  }
                  return null;
                },
              ),
              CustomTextFormField(
                label: 'Código',
                hintText: '0000001',
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira o código do produto';
                  }
                  return null;
                },
              ),
              CustomTextFormField(
                label: 'Quantidade',
                hintText: 'Ex. 10',
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira a quantidade do produto';
                  }
                  return null;
                },
              ),
              CustomTextFormField(
                label: 'Quantidade Mínima',
                hintText: 'Ex. 10',
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira a quantidade mínima';
                  }
                  return null;
                },
              ),
              CustomButton(
                label: 'Adicionar ao Estoque',
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: const Text(
                          'Produto Adicionado!',
                          style: TextStyle(color: AppColor.gray_200),
                        ),
                        backgroundColor: AppColor.gray_750,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4),
                          side: const BorderSide(color: AppColor.yellow),
                        ),
                        duration: const Duration(seconds: 3),
                      ),
                    );
                    Navigator.pushNamed(
                        context, NamedRoutes.informationProduct);
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
