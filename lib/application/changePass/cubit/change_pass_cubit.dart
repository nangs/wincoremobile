import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:wincoremobile/domain/model/changePassword/changePass_request.dart';
import 'package:wincoremobile/domain/model/changePassword/changePass_response.dart';
import 'package:wincoremobile/repository/changePass/changePass_repository.dart';
import 'package:wincoremobile/repository/token_repository.dart';

part 'change_pass_state.dart';

class ChangePassCubit extends Cubit<ChangePassState> {
  ChangePassCubit() : super(ChangePassInitial());

  final PassRepository _passRepository = PassRepository();
  final TokenRepository _tokenRepository = TokenRepository();

  void changePass(PassRequest passRequest) async {
    try {
      final _token = await _tokenRepository.GetToken();

      final _data = await _passRepository.changeNewPass(
          token: _token.toString(), passRequest: passRequest);
      // l = left, r = right. left untuk error, right untuk yang gak error
      _data.fold((l) => emit(PassError(l)),
          (r) => emit(ChangePassSuccessRestoreState(r)));
    } catch (e) {
      emit(PassError(e.toString()));
    }
  }
}
