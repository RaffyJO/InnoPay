part of 'data_internet_bloc.dart';

sealed class DataInternetEvent extends Equatable {
  const DataInternetEvent();

  @override
  List<Object> get props => [];
}

class DataInternetPost extends DataInternetEvent {
  final DataInternetPlanModel data;
  const DataInternetPost(this.data);

  @override
  List<Object> get props => [data];
}
