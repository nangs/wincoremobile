import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:wincoremobile/domain/model/accountPinjaman/accountPinjamanDetail_request.dart';
import 'package:wincoremobile/domain/model/accountPinjaman/accountPinjamanDetail_response.dart';
import 'package:wincoremobile/repository/accountPinjaman/accountPinjamanDetail_repository.dart';
import 'package:wincoremobile/repository/token_repository.dart';

part 'account_pinjaman_detail_state.dart';

class AccountPinjamanDetailCubit extends Cubit<AccountPinjamanDetailState> {
  AccountPinjamanDetailCubit() : super(AccountPinjamanDetailInitial());

  final PinjamanDetailRepository _pinjamanRepository =
      PinjamanDetailRepository();
  final TokenRepository _tokenRepository = TokenRepository();

  void getPinjamanDetail(PinjamanDetailRequest pinjamanRequest) async {
    emit(PinjamanDetailLoading());

    try {
      final _token = await _tokenRepository.GetToken();

      final _data = await _pinjamanRepository.getPinjaman(
          token: _token.toString(), pinjamanRequest: pinjamanRequest);

      // l = left, r = right. left untuk error, right untuk yang gak error
      _data.fold((l) => emit(PinjamanDetailError(l)),
          (r) => emit(PinjamanDetailSuccess(r)));
    } catch (e) {
      emit(PinjamanDetailError(e.toString()));
    }
  }
}
