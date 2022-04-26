import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:wincoremobile/domain/model/portfolio/portfolio_request.dart';
import 'package:wincoremobile/domain/model/portfolio/portfolio_response.dart';
import 'package:wincoremobile/repository/portfolio/portfolio_repository.dart';
import 'package:wincoremobile/repository/token_repository.dart';

part 'portfolio_state.dart';

class PortfolioCubit extends Cubit<PortfolioState> {
  PortfolioCubit() : super(PortfolioInitial());

  final PortfolioRepository _portfolioRepository = PortfolioRepository();
  final TokenRepository _tokenRepository = TokenRepository();

  void getPortfolio(PortfolioRequest portfolioRequest) async {
    emit(PortfolioLoading());

    try {
      final _token = await _tokenRepository.GetToken();

      final _data = await _portfolioRepository.getPortfolio(
          token: _token.toString(), portfolioRequest: portfolioRequest);

      // l = left, r = right. left untuk error, right untuk yang gak error
      _data.fold(
          (l) => emit(PortfolioError(l)), (r) => emit(PortfolioSuccess(r)));
    } catch (e) {
      emit(PortfolioError(e.toString()));
    }
  }

  void getPortfolioPaging(PortfolioRequest portfolioRequest) async {
    emit(PortfolioPagingLoading());

    try {
      final _token = await _tokenRepository.GetToken();

      final _data = await _portfolioRepository.getPortfolio(
          token: _token.toString(), portfolioRequest: portfolioRequest);

      // l = left, r = right. left untuk error, right untuk yang gak error
      _data.fold((l) => emit(PortfolioPagingError(l)),
          (r) => emit(PortfolioPagingSuccess(r)));
    } catch (e) {
      emit(PortfolioPagingError(e.toString()));
    }
  }
}
