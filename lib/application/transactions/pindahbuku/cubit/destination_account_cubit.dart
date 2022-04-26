import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:wincoremobile/domain/model/transactions/pindahbuku/dstAccount_request.dart';
import 'package:wincoremobile/domain/model/transactions/pindahbuku/dstAccount_response.dart';
import 'package:wincoremobile/repository/destinationAccount/dstAccount_repository.dart';
import 'package:wincoremobile/repository/token_repository.dart';

part 'destination_account_state.dart';

class DestinationAccountCubit extends Cubit<DestinationAccountState> {
  DestinationAccountCubit() : super(DestinationAccountInitial());

  final DestinationAccountRepository _destinationAccountRepository =
      DestinationAccountRepository();
  final TokenRepository _tokenRepository = TokenRepository();

  void dstAccountName(
      DestinationAccountRequest destinationAccountRequest) async {
    emit(DestinationAccountLoading());

    try {
      final _token = await _tokenRepository.GetToken();

      final _data =
          await _destinationAccountRepository.getDestinationAccount(
              token: _token.toString(),
              destinationAccountRequest: destinationAccountRequest);

      // l = left, r = right. left untuk error, right untuk yang gak error
      _data.fold((l) => emit(DestinationAccountError(l)),
          (r) => emit(DestinationAccountSuccess(r)));
    } catch (e) {
      emit(DestinationAccountError(e.toString()));
    }
  }

  void addRemoveDstAccountName(
      DestinationAccountRequest destinationAccountRequest) async {
    emit(DestinationAccountLoading());

    try {
      final _token = await _tokenRepository.GetToken();

      final _data = await _destinationAccountRepository.setDestinationAccount(
          token: _token.toString(),
          destinationAccountRequest: destinationAccountRequest);

      // l = left, r = right. left untuk error, right untuk yang gak error
      _data.fold((l) => emit(DestinationAccountError(l)),
          (r) => emit(DestinationAccountAddRemoveSuccess(r)));
    } catch (e) {
      emit(DestinationAccountError(e.toString()));
    }
  }
}
