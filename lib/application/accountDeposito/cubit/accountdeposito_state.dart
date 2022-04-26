part of 'accountdeposito_cubit.dart';

@immutable
abstract class AccountdepositoState {}

class AccountdepositoInitial extends AccountdepositoState {}

class DepositoLoading extends AccountdepositoState {}

class DepositoError extends AccountdepositoState {
  final String errorMsg;
  DepositoError(this.errorMsg);
}

class DepositoSuccess extends AccountdepositoState {
  final DepositoResponse response;
  DepositoSuccess(this.response);
}

class DepositoPagingLoading extends AccountdepositoState {}

class DepositoPagingError extends AccountdepositoState {
  final String errorMsg;
  DepositoPagingError(this.errorMsg);
}

class DepositoPagingSuccess extends AccountdepositoState {
  final DepositoResponse response;
  DepositoPagingSuccess(this.response);
}
