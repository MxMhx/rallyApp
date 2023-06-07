import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:rallymobile/repository/authentication_repository.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthenticationRepository _authenticationRepository;

  LoginBloc({
    required AuthenticationRepository authenticationRepository,
  })  : _authenticationRepository = authenticationRepository,
        super(LoginInitial()) {
    on<LoginSubmitted>(_onSummitted);
  }

  Future<void> _onSummitted(
    LoginSubmitted event,
    Emitter<LoginState> emit,
  ) async {
    emit(LoginInprogress());
    try {
      final username = event.username;
      final password = event.password;

      await _authenticationRepository.logIn(
        username: username,
        password: password,
      );
      emit(LoginSuccess());
    } catch (_) {
      emit(LoginFailed());
    }
  }
}
