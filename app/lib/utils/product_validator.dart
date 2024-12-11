class ProductValidator {
  ProductValidator._();

  static String? validateQuantity(String? value) {
    if (value == null || value.isEmpty) {
      return 'Por favor, insira a quantidade do produto';
    }
    return null;
  }

  static String? validateBarCode(String? value) {
    if (value == null || value.isEmpty) {
      return 'Por favor, insira o código do produto';
    }
    return null;
  }

  static String? validateUnitValue(String? value) {
    if (value == null || value.isEmpty) {
      return 'Por favor, insira o valor unitário';
    }
    final parsedValue = double.tryParse(value);
    if (parsedValue == null) {
      return 'Por favor, insira um número válido';
    }
    return null;
  }

  static String? validateProductName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Por favor, insira o nome do produto';
    }
    return null;
  }
}
