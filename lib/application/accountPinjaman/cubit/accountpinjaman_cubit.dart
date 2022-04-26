import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:wincoremobile/domain/model/accountPinjaman/accountPinjaman_request.dart';
import 'package:wincoremobile/domain/model/accountPinjaman/accountPinjaman_response.dart';
import 'package:wincoremobile/repository/accountPinjaman/accountPinjaman_repository.dart';
import 'package:wincoremobile/repository/token_repository.dart';

part 'accountpinjaman_state.dart';

class AccountpinjamanCubit extends Cubit<AccountpinjamanState> {
  AccountpinjamanCubit() : super(AccountpinjamanInitial());

  final PinjamanRepository _pinjamanRepository = PinjamanRepository();
  final TokenRepository _tokenRepository = TokenRepository();

  void getPinjaman(PinjamanRequest pinjamanRequest) async {
    emit(PinjamanLoading());

    try {
      final _token = await _tokenRepository.GetToken();

      final _data = await _pinjamanRepository.getPinjaman(
          token: _token.toString(), pinjamanRequest: pinjamanRequest);

      // l = left, r = right. left untuk error, right untuk yang gak error
      _data.fold(
          (l) => emit(PinjamanError(l)), (r) => emit(PinjamanSuccess(r)));
    } catch (e) {
      emit(PinjamanError(e.toString()));
    }
  }

  void getPinjamanPaging(PinjamanRequest pinjamanRequest) async {
    emit(PinjamanPagingLoading());

    try {
      final _token = await _tokenRepository.GetToken();

      final _data = await _pinjamanRepository.getPinjaman(
          token: _token.toString(), pinjamanRequest: pinjamanRequest);

      // l = left, r = right. left untuk error, right untuk yang gak error
      _data.fold((l) => emit(PinjamanPagingError(l)),
          (r) => emit(PinjamanPagingSuccess(r)));
    } catch (e) {
      emit(PinjamanPagingError(e.toString()));
    }
  }
}
