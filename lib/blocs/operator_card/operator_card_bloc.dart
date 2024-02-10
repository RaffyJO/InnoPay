import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:innopay/models/operator_card_model.dart';
import 'package:innopay/services/transaction_service.dart';

part 'operator_card_event.dart';
part 'operator_card_state.dart';

class OperatorCardBloc extends Bloc<OperatorCardEvent, OperatorCardState> {
  OperatorCardBloc() : super(OperatorCardInitial()) {
    on<OperatorCardEvent>((event, emit) async {
      if (event is OperatorCardGet) {
        try {
          emit(OperatorCardLoading());

          final operatorCards = await TransactionService().getOperatorCards();

          emit(OperatorCardSuccess(operatorCards));
        } catch (e) {
          emit(OperatorCardFailed(e.toString()));
        }
      }
    });
  }
}
