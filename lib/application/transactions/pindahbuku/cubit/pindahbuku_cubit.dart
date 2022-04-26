// ignore_for_file: avoid_print

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:wincoremobile/domain/model/transactions/pindahbuku/dstAccount_request.dart';
import 'package:wincoremobile/domain/model/transactions/pindahbuku/pindahbuku_request.dart';
import 'package:wincoremobile/domain/model/transactions/pindahbuku/pindahbuku_response.dart';
import 'package:wincoremobile/repository/destinationAccount/dstAccount_repository.dart';
import 'package:wincoremobile/repository/token_repository.dart';
import 'package:wincoremobile/repository/transaction/pindahBuku/pindahBuku_repository.dart';

part 'pindahbuku_state.dart';

class PindahbukuCubit extends Cubit<PindahbukuState> {
  PindahbukuCubit() : super(PindahbukuInitial());

  final PindahBukuRepository _pindahBukuRepository = PindahBukuRepository();
  final TokenRepository _tokenRepository = TokenRepository();
  final DestinationAccountRepository _destinationAccountRepository =
      DestinationAccountRepository();

  void sendBalance(
      PindahBukuRequest request,
      DestinationAccountRequest destinationAccountRequest,
      bool isChecked) async {
    emit(PindahbukuLoading());

    try {
      final _token = await _tokenRepository.GetToken();

      // jika isChecked == true, maka simpan dstAccount.
      if (isChecked == true) {
        final destinationAccount =
            await _destinationAccountRepository.setDestinationAccount(
                token: _token,
                destinationAccountRequest: destinationAccountRequest);

        print(destinationAccount);
      }

      final _data = await _pindahBukuRepository.SendBalance(
          token: _token.toString(), pindahBukuRequest: request);

      // l = left, r = right. left untuk error, right untuk yang gak error
      _data.fold(
          (l) => emit(PindahbukuError(l)), (r) => emit(PindahbukuSuccess(r)));
    } catch (e) {
      emit(PindahbukuError(e.toString()));
    }
  }
}
