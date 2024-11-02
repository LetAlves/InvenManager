import 'package:flutter/material.dart';
import 'package:invenmanager/layout/bottomNavBar.dart';
import 'package:invenmanager/layout/lateralMenu.dart';
import 'package:invenmanager/global/invenmanager_colors.dart';

class ProductInformationPage extends StatefulWidget {
  const ProductInformationPage({Key? key}) : super(key: key);

  @override
  State<ProductInformationPage> createState() => _ProductInformationPageState();
}

class _ProductInformationPageState extends State<ProductInformationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Informações do Produto'),
        centerTitle: true,
        backgroundColor: Color(InvenmanagerColors.gray_800),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.file_upload_outlined),
            tooltip: 'Upload',
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 24.0, horizontal: 20.0),
        child: Center(
          // Centraliza todos os elementos
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Text(
                'Produto 1',
                style: TextStyle(
                  color: Color(InvenmanagerColors.white),
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Quantidade em estoque: 50',
                        style: TextStyle(
                            color: Color(InvenmanagerColors.gray_200)),
                      ),
                      Text(
                        'Estoque mínimo: 10',
                        style: TextStyle(
                            color: Color(InvenmanagerColors.gray_200)),
                      ),
                    ],
                  ),
                  Text(
                    'Código: 0000010',
                    style: TextStyle(color: Color(InvenmanagerColors.gray_200)),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Container(
                width: 380,
                height: 1,
                color: Color(InvenmanagerColors.gray_600),
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment
                    .spaceAround, // Distribui espaço entre os botões
                children: [
                  ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      textStyle: const TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                      ),
                      backgroundColor: Color(InvenmanagerColors.gray_750),
                      minimumSize: const Size(100, 48),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 10),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onPressed: () {},
                    icon: Icon(
                      Icons.history,
                      color: Color(InvenmanagerColors.white),
                    ),
                    label: Text(
                      'Histórico de Ações',
                      style: TextStyle(color: Color(InvenmanagerColors.white)),
                    ),
                  ),
                  ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      textStyle: const TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                      ),
                      backgroundColor: Color(InvenmanagerColors.gray_750),
                      minimumSize: const Size(50, 48),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 50, vertical: 10),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onPressed: () {},
                    icon: Icon(
                      Icons.pending_actions,
                      color: Color(InvenmanagerColors.white),
                    ), // Ícone opcional
                    label: Text(
                      'Ações',
                      style: TextStyle(color: Color(InvenmanagerColors.white)),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30),
              Center(
                child: Container(
                  padding: const EdgeInsets.all(20.0),
                  decoration: BoxDecoration(
                    color: Color(InvenmanagerColors.gray_750),
                    borderRadius: BorderRadius.circular(10),
                    border: Border(
                      bottom: BorderSide(
                        color: Color(InvenmanagerColors.yellow),
                        width: 2.0,
                      ),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // Título
                      Text(
                        'Atualizar Estoque',
                        style: TextStyle(
                          color: Color(InvenmanagerColors.white),
                          fontSize: 15,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      const SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Nova Quantidade:',
                            style: TextStyle(
                                color: Color(InvenmanagerColors.gray_200)),
                          ),
                          const SizedBox(width: 8),
                          // Formulário para nova quantidade
                          SizedBox(
                            width: 70, // Largura do formulário
                            child: TextFormField(
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Color(InvenmanagerColors.gray_700),
                                hintText: '50',
                                hintStyle: TextStyle(
                                    color: Color(InvenmanagerColors.gray_250)),
                                border: const OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(8.0)),
                                  borderSide: BorderSide.none,
                                ),
                              ),
                              style: TextStyle(
                                  color: Color(InvenmanagerColors.white)),
                              keyboardType: TextInputType
                                  .number, // Define o teclado numérico
                              textAlign: TextAlign
                                  .center, // Centraliza o hintText e o texto digitado
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      ElevatedButton.icon(
                        onPressed: () {},
                        label: Text(
                          'CONFIRMAR ESTOQUE',
                          style:
                              TextStyle(color: Color(InvenmanagerColors.white)),
                        ),
                        icon: Icon(
                          Icons.check,
                          color: Color(InvenmanagerColors.white),
                        ),
                        style: ElevatedButton.styleFrom(
                          textStyle: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                          backgroundColor: Color(InvenmanagerColors.green),
                          minimumSize: const Size(335, 52),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
      endDrawer: const LateralMenu(),
      bottomNavigationBar: const BottomNavBar(),
    );
  }
}
