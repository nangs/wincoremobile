// ignore_for_file: avoid_print

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';
import 'package:wincoremobile/domain/model/accountActivities/accActivities_request.dart';
import 'package:wincoremobile/domain/model/accountActivities/accActivities_response.dart';
import 'package:wincoremobile/repository/accountActivities/accountActivities_repository.dart';
import 'package:wincoremobile/repository/token_repository.dart';

part 'acc_activities_state.dart';

class AccActivitiesCubit extends Cubit<AccActivitiesState> {
  AccActivitiesCubit() : super(AccActivitiesInitial());

  final AccountActivitiesRepository _accountActivitiesRepository =
      AccountActivitiesRepository();
  final TokenRepository _tokenRepository = TokenRepository();

  void getAccountActivities(
      AccountActivitiesRequest accountActivitiesRequest) async {
    emit(AccActivitiesLoading());

    try {
      final _token = await _tokenRepository.GetToken();

      final _data = await _accountActivitiesRepository.getAccountActivities(
          token: _token.toString(),
          accountActivitiesRequest: accountActivitiesRequest);

      // l = left, r = right. left untuk error, right untuk yang gak error
      _data.fold((l) => emit(AccActivitiesError(l)),
          (r) => emit(AccActivitiesSuccess(r)));
    } catch (e) {
      emit(AccActivitiesError(e.toString()));
    }
  }

  void getAccountActivitiesPaging(
      AccountActivitiesRequest accountActivitiesRequest) async {
    emit(AccActivitiesPagingLoading());

    try {
      final _token = await _tokenRepository.GetToken();

      final _data = await _accountActivitiesRepository.getAccountActivities(
          token: _token.toString(),
          accountActivitiesRequest: accountActivitiesRequest);
      print("masuk getAccountActivitiesPaging");
      // l = left, r = right. left untuk error, right untuk yang gak error
      _data.fold((l) => emit(AccActivitiesPagingError(l)),
          (r) => emit(AccActivitiesPagingSuccess(r)));
    } catch (e) {
      emit(AccActivitiesPagingError(e.toString()));
    }
  }
}
