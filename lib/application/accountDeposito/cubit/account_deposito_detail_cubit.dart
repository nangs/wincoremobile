import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:wincoremobile/domain/model/accountDeposito/accountDepositoDetail_request.dart';
import 'package:wincoremobile/domain/model/accountDeposito/accountDepositoDetail_response.dart';
import 'package:wincoremobile/repository/accountDeposito/accountDepositoDetail_repository.dart';
import 'package:wincoremobile/repository/token_repository.dart';

part 'account_deposito_detail_state.dart';

class AccountDepositoDetailCubit extends Cubit<AccountDepositoDetailState> {
  AccountDepositoDetailCubit() : super(AccountDepositoDetailInitial());

  final DepositoDetailRepository _depositoRepository =
      DepositoDetailRepository();
  final TokenRepository _tokenRepository = TokenRepository();

  void getDepositoDetail(DepositoDetailRequest depositoRequest) async {
    emit(DepositoDetailLoading());

    try {
      final _token = await _tokenRepository.GetToken();

      final _data = await _depositoRepository.getDeposito(
          token: _token.toString(), depositoRequest: depositoRequest);

      // l = left, r = right. left untuk error, right untuk yang gak error
      _data.fold((l) => emit(DepositoDetailError(l)),
          (r) => emit(DepositoDetailSuccess(r)));
    } catch (e) {
      emit(DepositoDetailError(e.toString()));
    }
  }
}
