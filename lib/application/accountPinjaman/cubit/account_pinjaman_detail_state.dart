part of 'account_pinjaman_detail_cubit.dart';

@immutable
abstract class AccountPinjamanDetailState {}

class AccountPinjamanDetailInitial extends AccountPinjamanDetailState {}

class PinjamanDetailLoading extends AccountPinjamanDetailState {}

class PinjamanDetailError extends AccountPinjamanDetailState {
  final String errorMsg;
  PinjamanDetailError(this.errorMsg);
}

class PinjamanDetailSuccess extends AccountPinjamanDetailState {
  final PinjamanDetailResponse response;
  PinjamanDetailSuccess(this.response);
}
