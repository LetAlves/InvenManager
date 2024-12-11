abstract class RecoverPasswordState {}

class RecoverPasswordInitialState extends RecoverPasswordState {}

class RecoverPasswordLoadingState extends RecoverPasswordState {}

class RecoverPasswordSuccessState extends RecoverPasswordState {}

class RecoverPasswordErrorState extends RecoverPasswordState {
  final String message;

  RecoverPasswordErrorState(this.message);
}
