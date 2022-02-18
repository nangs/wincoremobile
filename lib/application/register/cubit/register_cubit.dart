import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:wincoremobile/domain/model/register/register_request.dart';
import 'package:wincoremobile/domain/model/register/register_response.dart';
import 'package:wincoremobile/repository/register/register_repository.dart';
import 'package:wincoremobile/repository/token_repository.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitialState());

  final RegisterRepository _registerRepository = RegisterRepository();
  final TokenRepository _tokenRepository = TokenRepository();
  void sendOTP(String phoneNumber) async {
    emit(RegisterLoadingState());

    try {
      await _registerRepository.verifyMobileNumber(phoneNumber: phoneNumber);
      emit(OTPSuccessState("OK"));
    } catch (e) {
      emit(RegisterErrorState(e.toString()));
    }
  }

  void registeringNewUser(RegisterRequest registerRequest) async {
    emit(RegisterLoadingState());

    try {
      final _token = await _tokenRepository.GetToken();
      final _data = await _registerRepository.registerNewUser(
          token: _token.toString(), registerRequest: registerRequest);
      _data.fold((l) => emit(RegisterErrorState(l)),
          (r) => emit(RegisterSuccessState(r)));

      // emit(RegisterSuccessState(_data));
    } catch (e) {
      emit(RegisterErrorState(e.toString()));
    }
  }
}
