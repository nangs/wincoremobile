part of 'forgot_password_cubit.dart';

@immutable
abstract class ForgotPasswordState {}

class ForgotPasswordInitial extends ForgotPasswordState {}

class ForgotPasswordDetailInitialState extends ForgotPasswordState {}

class ForgotPasswordLoadingState extends ForgotPasswordState {}

class ForgotPasswordVerifySuccessState extends ForgotPasswordState {
  final ForgotPasswordResponse forgotPasswordResponse;
  ForgotPasswordVerifySuccessState(this.forgotPasswordResponse);
}

class ForgotPasswordErrorState extends ForgotPasswordState {
  final String errorMsg;
  ForgotPasswordErrorState(this.errorMsg);
}

class OTPSentState extends ForgotPasswordState {
  final String verificationId;
  OTPSentState(this.verificationId);
}

class OTPSuccessState extends ForgotPasswordState {
  final String dataLogin;
  OTPSuccessState(this.dataLogin);
}
