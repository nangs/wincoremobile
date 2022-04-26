part of 'change_pass_cubit.dart';

@immutable
abstract class ChangePassState {}

class ChangePassInitial extends ChangePassState {}

class PassLoading extends ChangePassState {}

class PassError extends ChangePassState {
  final String errorMsg;
  PassError(this.errorMsg);
}

class ChangePassSuccessRestoreState extends ChangePassState {
  final PassResponse chagesPassResponse;
  ChangePassSuccessRestoreState(this.chagesPassResponse);
}
