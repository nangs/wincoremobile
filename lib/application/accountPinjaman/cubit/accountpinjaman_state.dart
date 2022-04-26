part of 'accountpinjaman_cubit.dart';

@immutable
abstract class AccountpinjamanState {}

class AccountpinjamanInitial extends AccountpinjamanState {}

class PinjamanLoading extends AccountpinjamanState {}

class PinjamanError extends AccountpinjamanState {
  final String errorMsg;
  PinjamanError(this.errorMsg);
}

class PinjamanSuccess extends AccountpinjamanState {
  final PinjamanResponse response;
  PinjamanSuccess(this.response);
}

class PinjamanPagingLoading extends AccountpinjamanState {}

class PinjamanPagingError extends AccountpinjamanState {
  final String errorMsg;
  PinjamanPagingError(this.errorMsg);
}

class PinjamanPagingSuccess extends AccountpinjamanState {
  final PinjamanResponse response;
  PinjamanPagingSuccess(this.response);
}
