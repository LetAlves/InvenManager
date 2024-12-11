abstract class LateralMenuState {}

class LateralMenuStateInitial extends LateralMenuState {}

class LateralMenuStateLoading extends LateralMenuState {}

class LateralMenuStateSuccess extends LateralMenuState {}

class LateralMenuStateError extends LateralMenuState {
  LateralMenuStateError(String string, {required this.message});

  final String message;
}
