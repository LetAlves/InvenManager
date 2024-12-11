abstract class CreateProductState {}

class CreateProductInitialState extends CreateProductState {}

class CreateProductLoadingState extends CreateProductState {}

class CreateProductSuccessState extends CreateProductState {}

class CreateProductErrorState extends CreateProductState {
  final String message;

  CreateProductErrorState(this.message);
}
