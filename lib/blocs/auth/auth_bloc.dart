import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:innopay/services/auth_service.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<AuthEvent>((event, emit) async {
      if (event is AuthCheckEmail) {
        try {
          emit(AuthLoading());

          final res = await AuthService().checkEmail(event.email);

          if (res == false) {
            emit(AuthCheckEmailSuccess());
          } else {
            emit(const AuthFailed('Email is already in use!'));
          }
        } catch (e) {
          emit(AuthFailed(e.toString()));
        }
      }
    });
  }
}
