import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../domain/usecases/signin_anonymous_usecase.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final SignInAnonymouslyUseCase signInAnonymously;
  AuthBloc({required this.signInAnonymously}) : super(AuthInitial()) {
    on<AuthEvent>((event, emit) async {
      if (event is NameAuthEvent) {
        emit(LoadingAuthState());
        final failureOrAuth = await signInAnonymously(event.name);
        failureOrAuth.fold((l) {
          emit(ErrorAuthState(l.toString()));
        }, (isAuth) {
          emit(SuccessAuthState(isAuth));
        });
      }
    });
  }
}
