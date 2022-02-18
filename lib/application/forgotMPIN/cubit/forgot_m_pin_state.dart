part of 'forgot_m_pin_cubit.dart';

@immutable
abstract class ForgotMPinState {}

class ForgotMPinInitial extends ForgotMPinState {}

class ForgotMPinLoadingState extends ForgotMPinState {}

class ForgotMPinErrorState extends ForgotMPinState {
  final String errorMsg;
  ForgotMPinErrorState(this.errorMsg);
}

class ForgotMPinSuccessRestoreState extends ForgotMPinState {
  final ForgotMPinResponse forgotMPinResponse;
  ForgotMPinSuccessRestoreState(this.forgotMPinResponse);
}
