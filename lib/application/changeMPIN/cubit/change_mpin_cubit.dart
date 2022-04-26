import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:wincoremobile/domain/model/changeMPIN/changeMPIN_request.dart';
import 'package:wincoremobile/domain/model/changeMPIN/changeMPIN_response.dart';
import 'package:wincoremobile/repository/changeMPIN/changeMPIN_repository.dart';

import 'package:wincoremobile/repository/token_repository.dart';

part 'change_mpin_state.dart';

class ChangeMpinCubit extends Cubit<ChangeMpinState> {
  ChangeMpinCubit() : super(ChangeMpinInitial());

  final MpinRepository _mpinRepository = MpinRepository();
  final TokenRepository _tokenRepository = TokenRepository();

  void changeMpin(MpinRequest mpinRequest) async {
    try {
      final _token = await _tokenRepository.GetToken();

      final _data = await _mpinRepository.changeNewMPIN(
          token: _token.toString(), mpinRequest: mpinRequest);
      // l = left, r = right. left untuk error, right untuk yang gak error
      _data.fold((l) => emit(MpinError(l)),
          (r) => emit(ChangeMpinSuccessRestoreState(r)));
    } catch (e) {
      emit(MpinError(e.toString()));
    }
  }
}
