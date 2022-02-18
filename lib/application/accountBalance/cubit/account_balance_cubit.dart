import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:wincoremobile/domain/model/accountInformation/accInformation_request.dart';
import 'package:wincoremobile/domain/model/accountInformation/accInformation_response.dart';
import 'package:wincoremobile/repository/accountBalance/accountBalance_repository.dart';
import 'package:wincoremobile/repository/token_repository.dart';

part 'account_balance_state.dart';

class AccountBalanceCubit extends Cubit<AccountBalanceState> {
  AccountBalanceCubit() : super(AccountBalanceInitial());

  final AccountBalanceRepository _authRepository = AccountBalanceRepository();
  final TokenRepository _tokenRepository = TokenRepository();

  void getAccountInfo(AccountInfoRequest accInfoRequest) async {
    emit(AccountBalanceLoading());

    try {
      final _token = await _tokenRepository.GetToken();

      final _data = await _authRepository.getCurrentBalance(
          token: _token.toString(), accountInfoRequest: accInfoRequest);

      // l = left, r = right. left untuk error, right untuk yang gak error
      _data.fold((l) => emit(AccountBalanceError(l)),
          (r) => emit(AccountBalanceSuccess(r)));
    } catch (e) {
      emit(AccountBalanceError(e.toString()));
    }
  }
}
