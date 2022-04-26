part of 'destination_account_cubit.dart';

@immutable
abstract class DestinationAccountState {}

class DestinationAccountInitial extends DestinationAccountState {}

class DestinationAccountLoading extends DestinationAccountState {}

class DestinationAccountError extends DestinationAccountState {
  final String errorMsg;
  DestinationAccountError(this.errorMsg);
}

class DestinationAccountSuccess extends DestinationAccountState {
  final DestinationAccountLoadResponse response;
  DestinationAccountSuccess(this.response);
}

class DestinationAccountAddRemoveSuccess extends DestinationAccountState {
  final DestinationAccountAddRemoveResponse response;
  DestinationAccountAddRemoveSuccess(this.response);
}
