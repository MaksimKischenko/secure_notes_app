// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:secure_notes_app/data/data.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<AuthEvent>(_onEvent);
  }

  void _onEvent(
    AuthEvent event,
    Emitter<AuthState> emit,
  ) {
    if (event is AuthRun) return _onAuthRun(event, emit);
    if (event is AuthLogOut) return _onAuthLogOut(event, emit);
  }


  void _onAuthRun (
    AuthRun event,
    Emitter<AuthState> emit
  ) async {
    
    try {
      final password = event.password;
      final login = event.login;

      if(Credantials.credantials.containsKey(login) 
      && Credantials.credantials.containsValue(password)) {
        await PreferencesHelper.setCredentials(login, password);
        emit(AuthSuccessLogin());
      } else {
        emit(AuthUnSuccessLogin());
      }

    } catch(e) {
      emit(const AuthError(
        error: 'Error!'
      ));
    }
  }  

  void _onAuthLogOut (
    AuthLogOut event,
    Emitter<AuthState> emit
  ) async {
     emit(AuthLoading());
     await PreferencesHelper.clearCredentials();
     emit(AuthLogOutSuccess());
  }
}
