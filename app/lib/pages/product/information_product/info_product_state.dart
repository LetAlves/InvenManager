abstract class InfoProductState {}

class InfoProductInitialState extends InfoProductState {}

class InfoProductLoadingState extends InfoProductState {}

class InfoProductSuccessState extends InfoProductState {}

class InfoProductErrorState extends InfoProductState {
  final String message;

  InfoProductErrorState(this.message);
}
