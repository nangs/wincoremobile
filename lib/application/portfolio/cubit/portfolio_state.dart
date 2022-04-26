part of 'portfolio_cubit.dart';

@immutable
abstract class PortfolioState {}

class PortfolioInitial extends PortfolioState {}

class PortfolioLoading extends PortfolioState {}

class PortfolioError extends PortfolioState {
  final String errorMsg;
  PortfolioError(this.errorMsg);
}

class PortfolioSuccess extends PortfolioState {
  final PortfolioResponse response;
  PortfolioSuccess(this.response);
}

class PortfolioPagingLoading extends PortfolioState {}

class PortfolioPagingError extends PortfolioState {
  final String errorMsg;
  PortfolioPagingError(this.errorMsg);
}

class PortfolioPagingSuccess extends PortfolioState {
  final PortfolioResponse response;
  PortfolioPagingSuccess(this.response);
}
