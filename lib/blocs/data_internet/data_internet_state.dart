part of 'data_internet_bloc.dart';

sealed class DataInternetState extends Equatable {
  const DataInternetState();

  @override
  List<Object> get props => [];
}

final class DataInternetInitial extends DataInternetState {}

final class DataInternetLoading extends DataInternetState {}

final class DataInternetFailed extends DataInternetState {
  final String e;
  const DataInternetFailed(this.e);

  @override
  List<Object> get props => [e];
}

final class DataInternetSuccess extends DataInternetState {}
