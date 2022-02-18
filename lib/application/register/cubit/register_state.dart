part of 'register_cubit.dart';

@immutable
abstract class RegisterState {}

class RegisterInitialState extends RegisterState {}

class RegisterLoadingState extends RegisterState {}

class RegisterSuccessState extends RegisterState {
  final RegisterResponse dataLogin;
  RegisterSuccessState(this.dataLogin);
}

class RegisterErrorState extends RegisterState {
  final String errorMsg;
  RegisterErrorState(this.errorMsg);
}

class OTPSentState extends RegisterState {
  final String verificationId;
  OTPSentState(this.verificationId);
}

class OTPSuccessState extends RegisterState {
  final String dataLogin;
  OTPSuccessState(this.dataLogin);
}
