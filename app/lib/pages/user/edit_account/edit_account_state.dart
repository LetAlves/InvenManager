abstract class EditAccountState {}

class EditAccountInitialState extends EditAccountState {}

class EditAccountLoadingState extends EditAccountState {}

class EditAccountSuccessState extends EditAccountState {}

class EditAccountErrorState extends EditAccountState {
  final String message;

  EditAccountErrorState(this.message);
}
