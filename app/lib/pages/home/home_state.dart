abstract class HomeState {}

class HomeStateInitial extends HomeState {}

class HomeStateLoading extends HomeState {}

class HomeStateSuccess extends HomeState {}

class HomeStateError extends HomeState {
  HomeStateError(String string, {required this.message});

  final String message;
}
