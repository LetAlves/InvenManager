import 'package:flutter/material.dart';
import 'package:invenmanager/layout/bottomNavBar.dart';
import 'package:invenmanager/layout/lateralMenu.dart';
import 'package:invenmanager/global/invenmanager_colors.dart';
import 'package:invenmanager/screens/product_information_page.dart';

class CreateProductPage extends StatefulWidget {
  const CreateProductPage({Key? key}) : super(key: key);

  @override
  _CreateProductPageState createState() => _CreateProductPageState();
}

class _CreateProductPageState extends State<CreateProductPage> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Adicionar novo produto'),
        centerTitle: true,
        backgroundColor: Color(InvenmanagerColors.gray_800),
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
              const Padding(
                padding: EdgeInsets.only(top: 20.0),
                child: Text(
                  'Informações do produto',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Nome do Produto',
                  labelStyle:
                      TextStyle(color: Color(InvenmanagerColors.gray_200)),
                  filled: true,
                  fillColor: Color(InvenmanagerColors.gray_700),
                  hintText: 'Produto 1',
                  hintStyle:
                      TextStyle(color: Color(InvenmanagerColors.gray_250)),
                  border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8.0)),
                    borderSide: BorderSide.none,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: const BorderRadius.all(Radius.circular(8.0)),
                    borderSide:
                        BorderSide(color: Color(InvenmanagerColors.gray_250)),
                  ),
                  enabledBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8.0)),
                    borderSide: BorderSide.none,
                  ),
                  errorStyle: TextStyle(
                    color: Color(InvenmanagerColors.red),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(InvenmanagerColors.red),
                    ),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(InvenmanagerColors.red),
                      width: 2.0,
                    ),
                  ),
                ),
                style: TextStyle(
                  color: Color(InvenmanagerColors.white),
                ),
                cursorColor: Color(InvenmanagerColors.yellow),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira o nome do produto';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Valor Unitário',
                  labelStyle:
                      TextStyle(color: Color(InvenmanagerColors.gray_200)),
                  filled: true,
                  fillColor: Color(InvenmanagerColors.gray_700),
                  hintText: 'R\$ 100,00',
                  hintStyle:
                      TextStyle(color: Color(InvenmanagerColors.gray_250)),
                  border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8.0)),
                    borderSide: BorderSide.none,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: const BorderRadius.all(Radius.circular(8.0)),
                    borderSide:
                        BorderSide(color: Color(InvenmanagerColors.gray_250)),
                  ),
                  enabledBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8.0)),
                    borderSide: BorderSide.none,
                  ),
                  errorStyle: TextStyle(
                    color: Color(InvenmanagerColors.red),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(InvenmanagerColors.red),
                    ),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(InvenmanagerColors.red),
                      width: 2.0,
                    ),
                  ),
                ),
                style: TextStyle(
                  color: Color(InvenmanagerColors.white),
                ),
                cursorColor: Color(InvenmanagerColors.yellow),
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
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Código',
                  labelStyle:
                      TextStyle(color: Color(InvenmanagerColors.gray_200)),
                  filled: true,
                  fillColor: Color(InvenmanagerColors.gray_700),
                  hintText: '0000001',
                  hintStyle:
                      TextStyle(color: Color(InvenmanagerColors.gray_250)),
                  border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8.0)),
                    borderSide: BorderSide.none,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: const BorderRadius.all(Radius.circular(8.0)),
                    borderSide:
                        BorderSide(color: Color(InvenmanagerColors.gray_250)),
                  ),
                  enabledBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8.0)),
                    borderSide: BorderSide.none,
                  ),
                  errorStyle: TextStyle(
                    color: Color(InvenmanagerColors.red),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(InvenmanagerColors.red),
                    ),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(InvenmanagerColors.red),
                      width: 2.0,
                    ),
                  ),
                ),
                style: TextStyle(
                  color: Color(InvenmanagerColors.white),
                ),
                cursorColor: Color(InvenmanagerColors.yellow),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira o código do produto';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Quantidade',
                  labelStyle:
                      TextStyle(color: Color(InvenmanagerColors.gray_200)),
                  filled: true,
                  fillColor: Color(InvenmanagerColors.gray_700),
                  hintText: 'Ex. 10',
                  hintStyle:
                      TextStyle(color: Color(InvenmanagerColors.gray_250)),
                  border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8.0)),
                    borderSide: BorderSide.none,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: const BorderRadius.all(Radius.circular(8.0)),
                    borderSide:
                        BorderSide(color: Color(InvenmanagerColors.gray_250)),
                  ),
                  enabledBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8.0)),
                    borderSide: BorderSide.none,
                  ),
                  errorStyle: TextStyle(
                    color: Color(InvenmanagerColors.red),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(InvenmanagerColors.red),
                    ),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(InvenmanagerColors.red),
                      width: 2.0,
                    ),
                  ),
                ),
                style: TextStyle(
                  color: Color(InvenmanagerColors.white),
                ),
                cursorColor: Color(InvenmanagerColors.yellow),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira a quantidade do produto';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Quantidade mínima',
                  labelStyle:
                      TextStyle(color: Color(InvenmanagerColors.gray_200)),
                  filled: true,
                  fillColor: Color(InvenmanagerColors.gray_700),
                  hintText: 'Ex. 10',
                  hintStyle:
                      TextStyle(color: Color(InvenmanagerColors.gray_250)),
                  border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8.0)),
                    borderSide: BorderSide.none,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: const BorderRadius.all(Radius.circular(8.0)),
                    borderSide:
                        BorderSide(color: Color(InvenmanagerColors.gray_250)),
                  ),
                  enabledBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8.0)),
                    borderSide: BorderSide.none,
                  ),
                  errorStyle: TextStyle(
                    color: Color(InvenmanagerColors.red),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(InvenmanagerColors.red),
                    ),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(InvenmanagerColors.red),
                      width: 2.0,
                    ),
                  ),
                ),
                style: TextStyle(
                  color: Color(InvenmanagerColors.white),
                ),
                cursorColor: Color(InvenmanagerColors.yellow),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira a quantidade mínima';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton.icon(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          'Produto Adicionado!',
                          style: TextStyle(
                              color: Color(InvenmanagerColors.gray_200)),
                        ),
                        backgroundColor: Color(InvenmanagerColors.gray_750),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4),
                          side: BorderSide(
                            color: Color(InvenmanagerColors.yellow),
                          ),
                        ),
                        duration: const Duration(seconds: 3),
                      ),
                    );
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ProductInformationPage(),
                      ),
                    );
                  }
                },
                label: Text(
                  'Adicionar ao estoque',
                  style: TextStyle(color: Color(InvenmanagerColors.gray_800)),
                ),
                style: ElevatedButton.styleFrom(
                  textStyle: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                  backgroundColor: Color(InvenmanagerColors.yellow),
                  minimumSize: const Size(335, 52),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      endDrawer: const LateralMenu(),
      bottomNavigationBar: const BottomNavBar(),
    );
  }
}
