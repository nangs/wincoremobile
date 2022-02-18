import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:wincoremobile/domain/model/forgotPassword/forgotPassword_request.dart';
import 'package:wincoremobile/domain/model/forgotPassword/forgotPassword_response.dart';
import 'package:wincoremobile/repository/forgotPassword/forgotPassword_repository.dart';
import 'package:wincoremobile/repository/token_repository.dart';

part 'forgot_password_new_pass_state.dart';

class ForgotPasswordNewPassCubit extends Cubit<ForgotPasswordNewPassState> {
  ForgotPasswordNewPassCubit() : super(ForgotPasswordNewPassInitial());

  final ForgotPasswordRepository _forgotPasswordRepository =
      ForgotPasswordRepository();
  final TokenRepository _tokenRepository = TokenRepository();

  void forgotPasswordSetNewPassword(
      ForgotPasswordSetNewPassRequest forgotPasswordSetNewPassRequest) async {
        
    emit(ForgotPasswordLoadingState());

    try {
      final _token = await _tokenRepository.GetToken();
      final _data = await _forgotPasswordRepository.forgotPasswordSetNewPass(
          token: _token.toString(),
          forgotPasswordSetNewPassRequest: forgotPasswordSetNewPassRequest);
      _data.fold((l) => emit(ForgotPasswordErrorState(l)),
          (r) => emit(ForgotPasswordSuccessChangePasswordState(r)));

      // emit(ForgotPasswordSuccessState(_data));
    } catch (e) {
      emit(ForgotPasswordErrorState(e.toString()));
    }
  }
}
