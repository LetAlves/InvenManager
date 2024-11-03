import 'package:flutter/material.dart';
import 'package:invenmanager/classes/product.dart';
import 'package:invenmanager/global/app_text_style.dart';
import 'package:invenmanager/layout/bottom_navbar.dart';
import 'package:invenmanager/layout/lateral_menu.dart';
import 'package:invenmanager/global/app_color.dart';
import 'package:invenmanager/pages/information_product/info_product_page.dart';
import 'package:invenmanager/widget/custom_button.dart';

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
                child: Text('Informações do produto',
                    style: AppTextStyle.headerText
                        .copyWith(color: AppColor.white)),
              ),
              const SizedBox(height: 20),
              _buildTextField(
                label: 'Nome do Produto',
                hint: 'Produto 1',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira o nome do produto';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              _buildTextField(
                label: 'Valor Unitário',
                hint: 'R\$ 100,00',
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
              const SizedBox(height: 20),
              _buildTextField(
                label: 'Código',
                hint: '0000001',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira o código do produto';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              _buildTextField(
                label: 'Quantidade',
                hint: 'Ex. 10',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira a quantidade do produto';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              _buildTextField(
                label: 'Quantidade mínima',
                hint: 'Ex. 10',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira a quantidade mínima';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              CustomButton(
                label: 'Adicionar ao estoque',
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
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => InfoProductPage(product: product),
                      ),
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

  Widget _buildTextField({
    required String label,
    required String hint,
    required FormFieldValidator<String> validator,
  }) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: label,
        labelStyle: const TextStyle(color: AppColor.gray_200),
        filled: true,
        fillColor: AppColor.gray_700,
        hintText: hint,
        hintStyle: const TextStyle(color: AppColor.gray_250),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: const BorderSide(color: AppColor.gray_250),
        ),
        enabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
          borderSide: BorderSide.none,
        ),
        errorStyle: const TextStyle(color: AppColor.red),
        errorBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: AppColor.red),
        ),
        focusedErrorBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColor.red,
            width: 2.0,
          ),
        ),
      ),
      style: const TextStyle(color: AppColor.white),
      cursorColor: AppColor.yellow,
      validator: validator,
    );
  }
}
