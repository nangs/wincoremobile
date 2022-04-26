part of 'account_deposito_detail_cubit.dart';

@immutable
abstract class AccountDepositoDetailState {}

class AccountDepositoDetailInitial extends AccountDepositoDetailState {}

class DepositoDetailLoading extends AccountDepositoDetailState {}

class DepositoDetailError extends AccountDepositoDetailState {
  final String errorMsg;
  DepositoDetailError(this.errorMsg);
}

class DepositoDetailSuccess extends AccountDepositoDetailState {
  final DepositoDetailResponse response;
  DepositoDetailSuccess(this.response);
}
