abstract class EditProductState {}

class EditProductInitialState extends EditProductState {}

class EditProductLoadingState extends EditProductState {}

class EditProductSuccessState extends EditProductState {}

class EditProductErrorState extends EditProductState {
  final String message;

  EditProductErrorState(this.message);
}
