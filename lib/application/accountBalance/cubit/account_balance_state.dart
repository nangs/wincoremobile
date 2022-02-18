part of 'account_balance_cubit.dart';

@immutable
abstract class AccountBalanceState {}

class AccountBalanceInitial extends AccountBalanceState {}

class AccountBalanceLoading extends AccountBalanceState {}

class AccountBalanceError extends AccountBalanceState {
  final String errorMsg;
  AccountBalanceError(this.errorMsg);
}

class AccountBalanceSuccess extends AccountBalanceState {
  final AccountInfoResponse accountInfoResponse;
  AccountBalanceSuccess(this.accountInfoResponse);
}
