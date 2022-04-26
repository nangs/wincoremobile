part of 'change_mpin_cubit.dart';

@immutable
abstract class ChangeMpinState {}

class ChangeMpinInitial extends ChangeMpinState {}

class MpinLoading extends ChangeMpinState {}

class MpinError extends ChangeMpinState {
  final String errorMsg;
  MpinError(this.errorMsg);
}

class ChangeMpinSuccessRestoreState extends ChangeMpinState {
  final MpinResponse chagesMpinResponse;
  ChangeMpinSuccessRestoreState(this.chagesMpinResponse);
}
