import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:innopay/models/data_internet_plan_model.dart';
import 'package:innopay/services/transaction_service.dart';

part 'data_internet_event.dart';
part 'data_internet_state.dart';

class DataInternetBloc extends Bloc<DataInternetEvent, DataInternetState> {
  DataInternetBloc() : super(DataInternetInitial()) {
    on<DataInternetEvent>((event, emit) async {
      if (event is DataInternetPost) {
        try {
          emit(DataInternetLoading());

          await TransactionService().buyDataInternet(event.data);

          emit(DataInternetSuccess());
        } catch (e) {
          emit(DataInternetFailed(e.toString()));
        }
      }
    });
  }
}
