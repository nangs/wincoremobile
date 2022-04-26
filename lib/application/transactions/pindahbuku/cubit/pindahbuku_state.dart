part of 'pindahbuku_cubit.dart';

@immutable
abstract class PindahbukuState {}

class PindahbukuInitial extends PindahbukuState {}

class PindahbukuLoading extends PindahbukuState {}

class PindahbukuError extends PindahbukuState {
  final String errorMsg;
  PindahbukuError(this.errorMsg);
}

class PindahbukuSuccess extends PindahbukuState {
  final PindahBukuResponse response;
  PindahbukuSuccess(this.response);
}
