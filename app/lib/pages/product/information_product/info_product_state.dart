abstract class InfoProductState {}

class InfoProductInitialState extends InfoProductState {}

class InfoProductLoadingState extends InfoProductState {}

class InfoProductSuccessState extends InfoProductState {}

class InfoProductErrorState extends InfoProductState {
  InfoProductErrorState(String string, {required this.message});
  final String message;
}
