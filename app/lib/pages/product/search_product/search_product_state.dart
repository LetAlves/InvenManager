abstract class SearchState {}

class SearchStateInitial extends SearchState {}

class SearchStateLoading extends SearchState {}

class SearchStateSuccess extends SearchState {}

class SearchStateError extends SearchState {
  SearchStateError(String string, {required this.message});

  final String message;
}
