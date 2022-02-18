part of 'forgot_password_new_pass_cubit.dart';

@immutable
abstract class ForgotPasswordNewPassState {}

class ForgotPasswordNewPassInitial extends ForgotPasswordNewPassState {}

class ForgotPasswordDetailInitialState extends ForgotPasswordNewPassInitial {}

class ForgotPasswordLoadingState extends ForgotPasswordNewPassInitial {}

class ForgotPasswordSuccessChangePasswordState
    extends ForgotPasswordNewPassInitial {
  final ForgotPasswordResponse forgotPasswordResponse;
  ForgotPasswordSuccessChangePasswordState(this.forgotPasswordResponse);
}

class ForgotPasswordErrorState extends ForgotPasswordNewPassInitial {
  final String errorMsg;
  ForgotPasswordErrorState(this.errorMsg);
}

class OTPSentState extends ForgotPasswordNewPassInitial {
  final String verificationId;
  OTPSentState(this.verificationId);
}

class OTPSuccessState extends ForgotPasswordNewPassInitial {
  final String dataLogin;
  OTPSuccessState(this.dataLogin);
}
