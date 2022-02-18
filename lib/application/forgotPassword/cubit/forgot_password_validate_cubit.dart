import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:wincoremobile/domain/model/forgotPassword/forgotPassword_request.dart';
import 'package:wincoremobile/domain/model/forgotPassword/forgotPassword_response.dart';
import 'package:wincoremobile/repository/forgotPassword/forgotPassword_repository.dart';
import 'package:wincoremobile/repository/token_repository.dart';

part 'forgot_password_validate_state.dart';

class ForgotPasswordValidateCubit extends Cubit<ForgotPasswordValidateState> {
  ForgotPasswordValidateCubit() : super(ForgotPasswordValidateInitial());

  final ForgotPasswordRepository _forgotPasswordRepository =
      ForgotPasswordRepository();
  final TokenRepository _tokenRepository = TokenRepository();

  void forgotPasswordValidateData(
      ForgotPasswordValidateRequest forgotPasswordRequest) async {
    emit(ForgotPasswordLoadingState());

    try {
      final _token = await _tokenRepository.GetToken();
      final _data = await _forgotPasswordRepository.validateDataForgotPassword(
          token: _token.toString(),
          forgotPasswordValidateRequest: forgotPasswordRequest);
      _data.fold((l) => emit(ForgotPasswordErrorState(l)),
          (r) => emit(ForgotPasswordValidateSuccessState(r)));

      // emit(ForgotPasswordSuccessState(_data));
    } catch (e) {
      emit(ForgotPasswordErrorState(e.toString()));
    }
  }
}
