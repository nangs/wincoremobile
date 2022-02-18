part of 'forgot_password_validate_cubit.dart';

@immutable
abstract class ForgotPasswordValidateState {}

class ForgotPasswordValidateInitial extends ForgotPasswordValidateState {}

class ForgotPasswordDetailInitialState extends ForgotPasswordValidateState {}

class ForgotPasswordLoadingState extends ForgotPasswordValidateState {}

class ForgotPasswordValidateSuccessState extends ForgotPasswordValidateState {
  final ForgotPasswordResponse forgotPasswordResponse;
  ForgotPasswordValidateSuccessState(this.forgotPasswordResponse);
}

class ForgotPasswordVerifySuccessState extends ForgotPasswordValidateState {
  final ForgotPasswordResponse forgotPasswordResponse;
  ForgotPasswordVerifySuccessState(this.forgotPasswordResponse);
}

class ForgotPasswordSuccessChangePasswordState extends ForgotPasswordValidateState {
  final ForgotPasswordResponse forgotPasswordResponse;
  ForgotPasswordSuccessChangePasswordState(this.forgotPasswordResponse);
}

class ForgotPasswordErrorState extends ForgotPasswordValidateState {
  final String errorMsg;
  ForgotPasswordErrorState(this.errorMsg);
}

class OTPSentState extends ForgotPasswordValidateState {
  final String verificationId;
  OTPSentState(this.verificationId);
}

class OTPSuccessState extends ForgotPasswordValidateState {
  final String dataLogin;
  OTPSuccessState(this.dataLogin);
}
