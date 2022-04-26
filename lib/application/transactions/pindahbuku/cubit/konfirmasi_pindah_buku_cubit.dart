import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:wincoremobile/domain/model/transactions/pindahbuku/konfirmasipindahbuku_request.dart';
import 'package:wincoremobile/domain/model/transactions/pindahbuku/konfirmasipindahbuku_response.dart';
import 'package:wincoremobile/repository/token_repository.dart';
import 'package:wincoremobile/repository/transaction/pindahBuku/konfirmasiPindahBuku_repository.dart';

part 'konfirmasi_pindah_buku_state.dart';

class KonfirmasiPindahBukuCubit extends Cubit<KonfirmasiPindahBukuState> {
  KonfirmasiPindahBukuCubit() : super(KonfirmasiPindahBukuInitial());

  final KonfirmasiPindahBukuRepository _konfirmasiPindahBukuRepository =
      KonfirmasiPindahBukuRepository();
  final TokenRepository _tokenRepository = TokenRepository();

  void getAccountName(
      TransferConfirmationPBRequest transferConfirmationPBRequest) async {
    emit(KonfirmasiPindahBukuLoading());

    try {
      final _token = await _tokenRepository.GetToken();

      final _data = await _konfirmasiPindahBukuRepository.GetAccountName(
          token: _token.toString(),
          transferConfirmationPBRequest: transferConfirmationPBRequest);

      // l = left, r = right. left untuk error, right untuk yang gak error
      _data.fold((l) => emit(KonfirmasiPindahBukuError(l)),
          (r) => emit(KonfirmasiPindahBukuSuccess(r)));
    } catch (e) {
      emit(KonfirmasiPindahBukuError(e.toString()));
    }
  }
}
