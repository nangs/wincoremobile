// ignore_for_file: avoid_print

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:wincoremobile/domain/model/auth/auth_request.dart';
import 'package:wincoremobile/domain/model/auth/auth_response.dart';
import 'package:wincoremobile/repository/auth/auth_repository.dart';
import 'package:wincoremobile/repository/token_repository.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  final AuthRepository _authRepository = AuthRepository();
  final TokenRepository _tokenRepository = TokenRepository();

  void signInUser(AuthRequest authRequest) async {
    emit(AuthLoading());

    try {
      final _token = await _tokenRepository.GetToken();

      final _data = await _authRepository.signInUserWithUsernameAndPassword(
          token: _token.toString(), authRequest: authRequest);

      // l = left, r = right. left untuk error, right untuk yang gak error
      _data.fold((l) => emit(AuthError(l)), (r) => emit(AuthLoginSuccess(r)));
    } catch (e) {
      emit(AuthError(e.toString()));
    }
  }
}
