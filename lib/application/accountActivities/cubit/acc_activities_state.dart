part of 'acc_activities_cubit.dart';

@immutable
abstract class AccActivitiesState {}

class AccActivitiesInitial extends AccActivitiesState {}

class AccActivitiesLoading extends AccActivitiesState {}

class AccActivitiesError extends AccActivitiesState {
  final String errorMsg;
  AccActivitiesError(this.errorMsg);
}

class AccActivitiesSuccess extends AccActivitiesState {
  final AccountActivitiesResponse accActivitiesResponse;
  AccActivitiesSuccess(this.accActivitiesResponse);
}

class AccActivitiesPagingLoading extends AccActivitiesState {}

class AccActivitiesPagingError extends AccActivitiesState {
  final String errorMsg;
  AccActivitiesPagingError(this.errorMsg);
}

class AccActivitiesPagingSuccess extends AccActivitiesState {
  final AccountActivitiesResponse accActivitiesResponse;
  AccActivitiesPagingSuccess(this.accActivitiesResponse);
}
