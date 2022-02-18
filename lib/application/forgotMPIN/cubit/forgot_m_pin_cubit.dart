import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:wincoremobile/domain/model/forgotMPin/forgotMPin_request.dart';
import 'package:wincoremobile/domain/model/forgotMPin/forgotMPin_response.dart';
import 'package:wincoremobile/repository/forgotMPIN/forgotMPin_repository.dart';
import 'package:wincoremobile/repository/token_repository.dart';

part 'forgot_m_pin_state.dart';

class ForgotMPinCubit extends Cubit<ForgotMPinState> {
  ForgotMPinCubit() : super(ForgotMPinInitial());

  final ForgotMPinRepository _forgotMPinRepository = ForgotMPinRepository();
  final TokenRepository _tokenRepository = TokenRepository();

  void forgotMPinVerifyData(ForgotMPinRequest forgotMPinRequest) async {
    try {
      final _token = await _tokenRepository.GetToken();
      final _data = await _forgotMPinRepository.verificationDataForgotMPin(
        token: _token.toString(),
        forgotMPinRequest: forgotMPinRequest,
      );
      _data.fold((l) => emit(ForgotMPinErrorState(l)),
          (r) => emit(ForgotMPinSuccessRestoreState(r)));
    } catch (e) {
      emit(ForgotMPinErrorState(e.toString()));
    }
  }
}
