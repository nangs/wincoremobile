import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:wincoremobile/domain/model/accountDeposito/accountDeposito_request.dart';
import 'package:wincoremobile/domain/model/accountDeposito/accountDeposito_response.dart';
import 'package:wincoremobile/repository/accountDeposito/accountDeposito_repository.dart';
import 'package:wincoremobile/repository/token_repository.dart';

part 'accountdeposito_state.dart';

class AccountdepositoCubit extends Cubit<AccountdepositoState> {
  AccountdepositoCubit() : super(AccountdepositoInitial());

  final DepositoRepository _depositoRepository = DepositoRepository();
  final TokenRepository _tokenRepository = TokenRepository();

  void getDeposito(DepositoRequest depositoRequest) async {
    emit(DepositoLoading());

    try {
      final _token = await _tokenRepository.GetToken();

      final _data = await _depositoRepository.getDeposito(
          token: _token.toString(), depositoRequest: depositoRequest);

      // l = left, r = right. left untuk error, right untuk yang gak error
      _data.fold(
          (l) => emit(DepositoError(l)), (r) => emit(DepositoSuccess(r)));
    } catch (e) {
      emit(DepositoError(e.toString()));
    }
  }

  void getDepositoPaging(DepositoRequest depositoRequest) async {
    emit(DepositoPagingLoading());

    try {
      final _token = await _tokenRepository.GetToken();

      final _data = await _depositoRepository.getDeposito(
          token: _token.toString(), depositoRequest: depositoRequest);

      // l = left, r = right. left untuk error, right untuk yang gak error
      _data.fold((l) => emit(DepositoPagingError(l)),
          (r) => emit(DepositoPagingSuccess(r)));
    } catch (e) {
      emit(DepositoPagingError(e.toString()));
    }
  }
}
